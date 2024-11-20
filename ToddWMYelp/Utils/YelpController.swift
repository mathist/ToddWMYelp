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

//Client ID
//7NZsL01YfTh_zNY-HObD7Q
//
//API Key
//MnYEzConF2Iv3nRbE12_Ihfn-PVMeVSF3o7zTHmIedNQtdGBvSy9LFcUijWl2XqxnY8BhvAjUy3jaCvmfCW8_HAQGzLsJLuKnlN1oSdnLNJCrXOrtmCjWrp9GDQ-Z3Yx

enum YelpSort: String {
    case bestMatch = "best_match"
    case rating = "rating"
    case reviewCount = "review_count"
    case distance = "distance"
}


class YelpController {
    
    static let apiKey: String = "MnYEzConF2Iv3nRbE12_Ihfn-PVMeVSF3o7zTHmIedNQtdGBvSy9LFcUijWl2XqxnY8BhvAjUy3jaCvmfCW8_HAQGzLsJLuKnlN1oSdnLNJCrXOrtmCjWrp9GDQ-Z3Yx"
    static let yelpSearchURLPath: String = "https://api.yelp.com/v3/businesses/search"
    static let badURLError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Bad URL"]) as Error
    
    let urlSession = URLSession.shared
    
    func search(location: CLLocation, term: String, radius: Int, sort: YelpSort) async -> Result<[Business],Error> {
        guard var url = URL(string: YelpController.yelpSearchURLPath) else {return .failure(YelpController.badURLError)}
        
        url.append(queryItems: [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude))
            , URLQueryItem(name: "longitude", value: String(location.coordinate.longitude))
            , URLQueryItem(name: "term", value: term)
            , URLQueryItem(name: "sort_by", value: sort.rawValue)
        ])
        
        let result = await performSearch(url: url)
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            do {
                let businessData = try decoder.decode(BusinessData.self, from: data)
                return .success(businessData.businesses)
            } catch {
                return .failure(error)
            }
            
        case .failure(let error):
            return .failure(error)
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
    
    func testBusinesses() -> [Business]? {
        let data: Data = BusinessData.testData()
        
        let decoder = JSONDecoder()
        let businessData = try? decoder.decode(BusinessData.self, from: data)
        var businesses = businessData?.businesses
        print(businesses)
        
        return businesses
    }
}
