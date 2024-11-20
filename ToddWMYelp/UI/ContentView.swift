//
//  ContentView.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import SwiftUI

struct ContentView: View {
    
    var locationManager: LocationManager = LocationManager()
    var yelpController = YelpController()
    
    @State private var searchText = ""
    @State private var businesses = [Business]()
    
    var body: some View {
        NavigationStack {
            List {
//                ForEach(businesses) { business in
//                    VStack(alignment: .leading) {
//                        Text(business.name)
//                            .font(.headline)
//
//                        Text(business.name)
//                    }
//                }
            }
            .navigationTitle("Messages")
        }
        .searchable(text: $searchText)
//        .searchScopes($searchScope) {
//            ForEach(SearchScope.allCases, id: \.self) { scope in
//                Text(scope.rawValue.capitalized)
//            }
//        }
        .onAppear(perform: runSearch)
        .onSubmit(of: .search, runSearch)
//        .onChange(of: searchScope) { _ in runSearch() }
    }

    
    func runSearch() {
        Task {
//            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }
//
//            let (data, _) = try await URLSession.shared.data(from: url)
//            messages = try JSONDecoder().decode([Message].self, from: data)
        }
    }
}

//#Preview {
//    ContentView()
//}


/*
 
 VStack {
     Button(action: {
         locationManager.start()
     }, label: { Text("Start")})

     Button(action: {

//                yelpController.testBusinesses()
         
         if let location = locationManager.mostRecentLocation {
             Task {
                 await yelpController.search(location: location, term: "coffee", radius: (1609 * 25), sort: .distance)
             }
         }
     }, label: { Text("Search")})

     
 }
 .padding()

 */
