//
//  LocationManager.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    var locationManager:  CLLocationManager
    var mostRecentLocation: CLLocation?
    
    override public init() {
        print("LocationManager init")

        locationManager = CLLocationManager()
        
        super.init()
        
        locationManager.requestWhenInUseAuthorization()        
    }
    
    deinit {
        print("LocationManager deinit")
    }
    
    func start() {
        guard locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse
        else {
            print("No location authorization")
            return
        }
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        locations.forEach({
//            print("location: \($0.coordinate.latitude), \($0.coordinate.longitude)")
//        })
        
        mostRecentLocation = locations.last
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

