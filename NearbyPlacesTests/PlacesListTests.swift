//
//  PlacesListTests.swift
//  NearbyPlacesTests
//
//  Created by Furkan Kaynar on 27.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
import CoreLocation
@testable import NearbyPlaces

class PlacesListTests: XCTestCase {
    
    var placesListView: PlacesListView!
    var viewModel: PlacesListViewModel!
    
    override func setUp() {
        viewModel = PlacesListViewModel()
        placesListView = PlacesListView(viewModel: viewModel)
    }

    // MARK: - Setters
    func testSetLatLng() {
        viewModel.set(latlng: (12.0, 12.0))
        XCTAssertNotNil(viewModel.userLatLng)
        XCTAssertEqual(viewModel.userLatLng!.0, 12.0)
        XCTAssertEqual(viewModel.userLatLng!.1, 12.0)
    }
    
    func testSetError() {
        viewModel.set(errorMessage: "Error Message")
        XCTAssertEqual(viewModel.errorMessage, "Error Message")
    }
    
    func testSetPlaces() {
        viewModel.set(places: [Mocker.getPlaces().first!])
        XCTAssertEqual(viewModel.places, [Mocker.getPlaces().first!])
    }
    
    // MARK: - Places Fetcher
    func testPlacesFetcherDidFetch() {
        viewModel.set(latlng: (12.0, 12.0))
        viewModel.placesFetcher = PlacesFetcherMocker(isSuccessful: true)
        viewModel.configureTable()
        XCTAssertFalse(viewModel.places.isEmpty)
    }
    
    func testPlacesFetcherError() {
        viewModel.set(latlng: (12.0, 12.0))
        viewModel.placesFetcher = PlacesFetcherMocker(isSuccessful: false)
        viewModel.configureTable()
        XCTAssertTrue(viewModel.places.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }
    
    // MARK: - Location Manager
    
    func testGetLocation() {
        let locationMocker: LocationManagerMocker = LocationManagerMocker(isSuccessful: true)
        viewModel.locationManager = locationMocker
        viewModel.getUserLatLng()
        XCTAssertEqual(viewModel.userLatLng!.0, locationMocker.location.coordinate.latitude)
        XCTAssertEqual(viewModel.userLatLng!.1, locationMocker.location.coordinate.longitude)
    }
    
    func testErrorLocation() {
        let locationMocker: LocationManagerMocker = LocationManagerMocker(isSuccessful: false)
        viewModel.locationManager = locationMocker
        viewModel.getUserLatLng()
        XCTAssertNil(viewModel.userLatLng)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}

class PlacesFetcherMocker: PlacesFetcherDelegate {
    var isSuccessful: Bool
    
    init(isSuccessful: Bool){
        self.isSuccessful = isSuccessful
    }
    
    func getPlaces(lat: Double, lng: Double, withCompletion completionHandler: @escaping PlacesFetcher.PlacesFetchHandler) {
        if isSuccessful {
            completionHandler(PlacesFetcher.FetchResult.success(places: Mocker.getPlaces()))
        } else {
            completionHandler(PlacesFetcher.FetchResult.failure(error: "Error"))
        }
    }
}

class LocationManagerMocker: LocationManagerDelegate {
    let location: CLLocation = CLLocation(latitude: 12.0, longitude: 12.0)
    var isSuccessful: Bool
    
    init(isSuccessful: Bool){
        self.isSuccessful = isSuccessful
    }
    
    func getLocation(_ completionHandler: @escaping LocationManager.LocationHandler) {
        if isSuccessful {
            completionHandler(LocationManager.LocationResult.success(location: location))
        } else {
            completionHandler(LocationManager.LocationResult.failure(error: "Error"))
        }
    }
}
