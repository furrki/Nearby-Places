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
    var places: [Place] = []
    
    init() {
        configureTable()
    }
    
    func set(places: [Place]) {
        self.places = places
        objectWillChange.send()
    }
    
    func configureTable() {
        placesFetcher.getPlaces(lat: 42.697708, lng: 23.321867) { [weak self] fetchResult in
            guard case .success(let places) = fetchResult else { return }
            self?.set(places: places)
        }
    }
}
