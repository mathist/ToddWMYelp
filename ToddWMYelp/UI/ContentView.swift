//
//  ContentView.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import SwiftUI

struct ContentView: View {
    
    var locationManager: LocationManager
    
    @ObservedObject var yelpController: YelpController
    @State private var searchText: String
    
    init() {
        self.locationManager = LocationManager()
        self.yelpController = YelpController()
        self.searchText = ""
        
        self.locationManager.start()
    }
    
    var body: some View {
        NavigationStack {

            ScrollViewReader() { proxy in
                ScrollView() {
                    LazyVStack(alignment: .leading, spacing: 4) {
                        ForEach(yelpController.businesses) { business in
                            VStack(alignment: .leading) {
                                Text(business.name!)
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .padding(16)
        }
        .searchable(text: $searchText)
        .onAppear(perform: runSearch)
        .onSubmit(of: .search, runSearch)
        .onChange(of: searchText, { runSearch()})
    }

    
    func runSearch() {
        Task {
            if let location = locationManager.mostRecentLocation {
                await yelpController.search(location: location, term: searchText, radius: 1609, sort: .distance)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}



