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
    
    var body: some View {
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
    }
}

//#Preview {
//    ContentView()
//}
