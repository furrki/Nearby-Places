//
//  LocationManager.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 27.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate {
    func getLocation(_ completionHandler: @escaping LocationManager.LocationHandler)
}

class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerDelegate {
    public enum LocationResult {
        case success(location: CLLocation)
        case failure(error: String)
    }
    
    private let locationManager = CLLocationManager()
    public typealias LocationHandler = (_ locationResult: LocationResult) -> Void
    public typealias LocationResponse = (_ location: CLLocation) -> Void
    public typealias LocationError = (_ error: Error) -> Void
    
    var didUpdateLocation: (LocationHandler)?
    
    var didUserAcceptToShareHisLocation: Bool {
        get {
            return CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        }
    }
    
    private func startTrackingLocation() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            self.locationManager.startUpdatingLocation()
        } else {
            self.didUpdateLocation?(LocationResult.failure(error: "Please enable the location services."))
        }
    }
    
    private func requestNewLocation() {
        locationManager.requestLocation()
    }
    
    private func stopTrackingLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.stopUpdatingLocation()
            locationManager.stopUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        dump("Location updated to: \(locations)")
        if let latestlocation = locations.first {
            updateUserLocation(latestlocation)
        } else {
            self.didUpdateLocation?(LocationResult.failure(error: "Location fetch error."))
        }
    }
    
    private func updateUserLocation(_ location: CLLocation) {
        self.didUpdateLocation?(LocationResult.success(location: location))
        stopTrackingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        startTrackingLocation()
        requestNewLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.didUpdateLocation?(LocationResult.failure(error: error.localizedDescription))
    }
    
    func getLocation(_ completionHandler: @escaping LocationHandler) {
        self.didUpdateLocation = completionHandler
        startTrackingLocation()
        requestNewLocation()
        stopTrackingLocation()
    }
}
