//
//  YelpController.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import Foundation
import CoreLocation

//curl --request GET \
//     --url https://api.yelp.com/v3/events/awesome-event \
//     --header 'Authorization: Bearer API_KEY' \
//     --header 'accept: application/json'


enum YelpSort: String {
    case bestMatch = "best_match"
    case rating = "rating"
    case reviewCount = "review_count"
    case distance = "distance"
}


class YelpController: ObservableObject {
    
    static let apiKey: String = ""
    static let yelpSearchURLPath: String = "https://api.yelp.com/v3/businesses/search"
    static let searchResultsCount: Int = 25
    @Published var businesses: [Business] = []
    
    let urlSession = URLSession.shared
    var currentOffset: Int = 0
    
    @MainActor
    func search(location: CLLocation, term: String, radius: Int, sort: YelpSort, nextPage: Bool) async  {
        guard var url = URL(string: YelpController.yelpSearchURLPath) else {return}
        
        url.append(queryItems: [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude))
            , URLQueryItem(name: "longitude", value: String(location.coordinate.longitude))
            , URLQueryItem(name: "term", value: term)
            , URLQueryItem(name: "sort_by", value: sort.rawValue)
            , URLQueryItem(name: "radius", value: String(radius))
            , URLQueryItem(name: "limit", value: String(YelpController.searchResultsCount))
        ])

        if nextPage {
            url.append(queryItems: [URLQueryItem(name: "offset", value: String(currentOffset))])
        } else {
            currentOffset = 0
        }
        
        let result = await performSearch(url: url)
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            do {
                let businessData = try decoder.decode(BusinessData.self, from: data)
                
                if nextPage {
                    businesses.append(contentsOf: businessData.businesses)
                } else {
                    businesses = businessData.businesses
                }
                
                currentOffset = businesses.count
            } catch {
            }
            
        case .failure(let error):
            print(error)
        }
    }
    
    func performSearch(url: URL) async -> Result<Data,Error> {
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(YelpController.apiKey)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await urlSession.data(for: request)
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
    
    func testBusinesses(isNextPage: Bool) {
        let data: Data = BusinessData.testData()
        
        let decoder = JSONDecoder()
        if let businessData = try? decoder.decode(BusinessData.self, from: data) {
            if isNextPage {
                self.businesses.append(contentsOf: businessData.businesses)
            } else {
                self.businesses = businessData.businesses
            }
        }
    }
}
