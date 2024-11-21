//
//  LocationManager.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    var locationManager:  CLLocationManager = CLLocationManager()
    var mostRecentLocation: CLLocation?
    
    override public init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
        
    func start() {
        guard locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse
        else {
            print("No location authorization")
            return
        }
        
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mostRecentLocation = locations.last
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways
            || locationManager.authorizationStatus == .authorizedWhenInUse {
            start()
        }
    }
}

