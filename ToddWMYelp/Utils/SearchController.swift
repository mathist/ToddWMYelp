//
//  YelpController.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import Foundation
import CoreLocation
import Combine

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

class SearchController: ObservableObject {
    
    static let yelpSearchURLPath: String = "https://api.yelp.com/v3/businesses/search"
    static let searchResultsCount: Int = 15
    @Published var businesses: [Business] = []
    
    let urlSession = URLSession.shared
    @Published var searchQuery: String = ""
    private var cancellables = Set<AnyCancellable>()
    private var locationManager: LocationManager = LocationManager()
    
    init() {
        locationManager.start()
        
        $searchQuery
            .debounce(for: .milliseconds(1500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.autoSearch(query: query)
            }
            .store(in: &cancellables)        
    }
    
    @MainActor
    func search(location: CLLocation, term: String, radius: Int, sort: YelpSort, nextPage: Bool) async  {
        guard var url = URL(string: SearchController.yelpSearchURLPath)
                , !term.isEmpty
        else {return}
        
        url.append(queryItems: [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude))
            , URLQueryItem(name: "longitude", value: String(location.coordinate.longitude))
            , URLQueryItem(name: "term", value: term)
            , URLQueryItem(name: "sort_by", value: sort.rawValue)
            , URLQueryItem(name: "radius", value: String(radius))
            , URLQueryItem(name: "limit", value: String(SearchController.searchResultsCount))
        ])

        if nextPage {
            url.append(queryItems: [URLQueryItem(name: "offset", value: String(businesses.count))])
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
            } catch {
            }
            
        case .failure(let error):
            print(error)
        }
    }
    
    func performSearch(url: URL) async -> Result<Data,Error> {
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(kApiKey)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await urlSession.data(for: request)
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
    
    private func autoSearch(query: String) {        
        Task {
            if let location = locationManager.mostRecentLocation {
                await search(location: location, term: query, radius: 1609*5, sort: .distance, nextPage: false)
            }
        }
    }
    
    func nextPage() {
        Task {
            if let location = locationManager.mostRecentLocation {
                await search(location: location, term: searchQuery, radius: 1609*5, sort: .distance, nextPage: true)
            }
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
