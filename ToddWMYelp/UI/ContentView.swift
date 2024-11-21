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

//                                    FavoriteButton(isFavorite: business.isFavorite ?? false) {
//                                        isFavorite(index: index) ? removeFavorite(index: index) : addFavorite(index: index)
//                                    }
                                    
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
    
//    func addFavorite(index: Int) {
//        if var favorites = UserDefaults.standard.object(forKey: kFavorites) as? [String]
//            , !favorites.contains(searchController.businesses[index].id) {
//            favorites.append(searchController.businesses[index].id)
//            UserDefaults.standard.set(favorites, forKey: kFavorites)
//        } else {
//            UserDefaults.standard.set([searchController.businesses[index].id], forKey: kFavorites)
//        }
//
//        searchController.businesses[index].isFavorite = true
//        
//        UserDefaults.standard.synchronize()
//        
//        print(UserDefaults.standard.object(forKey: kFavorites) as! [String])
//    }
//    
//    func removeFavorite(index: Int) {
//        if var favorites = UserDefaults.standard.object(forKey: kFavorites) as? [String]
//            , let favoritesIndex = favorites.firstIndex(of: searchController.businesses[index].id) {
//            favorites.remove(at: favoritesIndex)
//            UserDefaults.standard.set(favorites, forKey: kFavorites)
//            UserDefaults.standard.synchronize()
//        }
//        
//        searchController.businesses[index].isFavorite = false
//
//        print(UserDefaults.standard.object(forKey: kFavorites) as! [String])
//    }
//    
//    func isFavorite(index: Int) -> Bool {
//        
//        var favorite: Bool = false
//        
//        if let favorites = UserDefaults.standard.object(forKey: kFavorites) as? [String] {
//            favorite = favorites.contains(searchController.businesses[index].id)
//        }
//        
////        print("\(searchController.businesses[index].name): \(favorite)")
//        
//        return favorite
//    }

}


//struct FavoriteButton: View {
//    
//    @State var isFavorite: Bool = false
//    let action: () -> Void
//        
//    var body: some View {
//        
//        let _ = print("favorite draw")
//        
//        Button{
//            action()
//            isFavorite.toggle()
//        } label: {
//            Image(systemName: isFavorite ? "star.fill" : "star")
//                .resizable()
//                .frame(width: 25, height: 25)
//        }
//    }
//}


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
