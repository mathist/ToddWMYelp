//
//  ContentView.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var searchController: SearchController = SearchController()
    @State private var tappedIndex: Int?
    @State private var showDetailScreen: Bool = false
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationStack {

            ScrollViewReader() { proxy in
                ScrollView() {
                    LazyVStack(alignment: .leading, spacing: 4) {
                        
                        ForEach(searchController.businesses.indices, id: \.self) { index in
                            let business = searchController.businesses[index]
                            
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
                                tappedIndex = index
                                showDetailScreen = true
                            }
                            
                            Divider()
                                .onAppear() {
                                    if index == searchController.businesses.count-1 {
                                        searchController.nextPage()
                                    }
                                }
                        }
                    }
                }
            }
            .padding(16)
        }
        .searchable(text: $searchController.searchQuery)
        .alert("Open Business?", isPresented: $showDetailScreen) {
            Button("Cancel", role: .cancel) {}
            Button("Safari") {
                if let tappedIndex = tappedIndex
                    , let path = searchController.businesses[tappedIndex].url
                    , let url = URL(string: path) {
                    openURL(url)
                }
            }
            Button("Webview") {
                print("webview")
            }
        }
    }

}
