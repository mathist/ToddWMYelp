//
//  ContentView.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @ObservedObject var searchController: SearchController = SearchController()

    @State private var tappedIndex: Int?
    @State private var showDetailScreen: Bool = false
    @State private var showWebView: Bool = false
    @State private var favorites: [String] = UserDefaults.standard.object(forKey: kFavorites) as? [String] ?? []

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
                                    
                                    Button{
                                        isFavorite(index: index) ? removeFavorite(index: index) : addFavorite(index: index)
                                    } label: {
                                        Image(systemName: isFavorite(index: index) ? "star.fill" : "star")
                                            .resizable()
                                            .frame(width: 25, height: 25)
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
            .navigationTitle("Yelp Business Search")
            .navigationBarTitleDisplayMode(.inline)
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
                showWebView = true
            }
        }
        .sheet(isPresented: $showWebView, content: {
            if let tappedIndex = tappedIndex
                , let path = searchController.businesses[tappedIndex].url
                , let url = URL(string: path) {
                DetailScreen(url: url, showModal: $showWebView)
            }
        })


    }
    
    func addFavorite(index: Int) {
        favorites.append(searchController.businesses[index].id)
        UserDefaults.standard.set(favorites, forKey: kFavorites)
        UserDefaults.standard.synchronize()
    }
    
    func removeFavorite(index: Int) {
        favorites.removeAll(where: {$0.compare(searchController.businesses[index].id) == .orderedSame})
        UserDefaults.standard.set(favorites, forKey: kFavorites)
        UserDefaults.standard.synchronize()
    }
    
    func isFavorite(index: Int) -> Bool {
        return favorites.contains(searchController.businesses[index].id)
    }
}


struct DetailScreen: View {
    var url: URL
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationStack {
            WebView(url: url)
                .navigationTitle("Detail View")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showModal.toggle()
                        }, label: {
                            Text("Close")
                        })
                    }
                }
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
