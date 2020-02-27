//
//  PlacesListViewModel.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import Combine

class PlacesListViewModel: ObservableObject {
    // MARK: - Properties
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    let placesFetcher: PlacesFetcher = PlacesFetcher()
    let locationManager: LocationManager = LocationManager()
    var userLatLng: (Double, Double)?
    
    @Published var places: [Place] = []
    @Published var errorMessage: String?
    
    // MARK: - LifeCycle
    init() {
        reloadData()
    }
    
    func viewDidAppear() {
        
    }
    
    func reloadData() {
        getUserLatLng()
    }
    
    // MARK: - Set Methods
    func set(places: [Place]) {
        self.places = places
        objectWillChange.send()
    }
    
    func set(latlng: (Double, Double)) {
        self.errorMessage = nil
        self.userLatLng = latlng
        configureTable()
        objectWillChange.send()
    }
    
    func set(errorMessage: String) {
        self.errorMessage = errorMessage
        objectWillChange.send()
    }
    
    // MARK: - Fetchings
    func getUserLatLng() {
        locationManager.getLocation { [weak self] (locationResult) in
            if case .success(let location) = locationResult {
                self?.set(latlng: (location.coordinate.latitude, location.coordinate.longitude))
            } else if case .failure(let error) = locationResult {
                self?.set(errorMessage: error)
            }
        }
    }
    
    func configureTable() {
        if let userLatLng = userLatLng {
            placesFetcher.getPlaces(lat: userLatLng.0, lng: userLatLng.1) { [weak self] fetchResult in
                guard case .success(let places) = fetchResult else { return }
                if places.isEmpty {
                    self?.set(errorMessage: "There aren't any places around you.")
                } else {
                    self?.set(places: places)
                }
            }
        }
    }
}
