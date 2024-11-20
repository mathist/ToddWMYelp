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
    @State private var tappedIndex: Int?
    @State private var showDetailScreen: Bool = false
    @Environment(\.openURL) var openURL
    
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
                        
                        ForEach(yelpController.businesses.indices, id: \.self) { index in
                            let business = yelpController.businesses[index]
                            
                            HStack(alignment: .top, spacing: 8) {
                                
                                if let image_url = business.image_url
                                    , let url = URL(string: image_url) {
                                        DisplayImageFromNetwork(imageUrl: url)
                                            .frame(width: 100, height: 100)
                                } else {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                }

                                VStack(alignment: .leading) {
                                    Text(business.name)
                                        .font(.headline)
                                    
                                    if let address = business.location?.display_address?.joined(separator: "\n") {
                                        Text(address)
                                    }
                                }
                            }
                            .onTapGesture {
                                print("tapped \(index)")
                                tappedIndex = index
                                showDetailScreen = true
                            }
                            
                            Divider()
                                .onAppear() {
                                    if index == yelpController.businesses.count-1 {
                                        print("last item")
                                        nextPage()
                                    }
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
        .alert("Open Business?", isPresented: $showDetailScreen) {
            Button("Cancel", role: .cancel) {}
            Button("Safari") {
                if let tappedIndex = tappedIndex
                    , let path = yelpController.businesses[tappedIndex].url
                    , let url = URL(string: path) {
                    openURL(url)
                }
            }
            Button("Webview") {
                print("webview")
            }
        }
    }

    
    func runSearch() {
  
//        yelpController.testBusinesses(isNextPage: false)
        
        Task {
            if let location = locationManager.mostRecentLocation {
                await yelpController.search(location: location, term: searchText, radius: 1609*5, sort: .distance, nextPage: false)
            }
        }
    }
    
    func nextPage() {
//        yelpController.testBusinesses(isNextPage: true)
        

        Task {
            if let location = locationManager.mostRecentLocation {
                await yelpController.search(location: location, term: searchText, radius: 1609*5, sort: .distance, nextPage: true)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}



