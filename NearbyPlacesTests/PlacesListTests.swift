//
//  PlacesListTests.swift
//  NearbyPlacesTests
//
//  Created by Furkan Kaynar on 27.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import NearbyPlaces
import CoreLocation
class PlacesListTests: XCTestCase {
    
    var placesListView: PlacesListView!
    var viewModel: PlacesListViewModel!
    
    override func setUp() {
        viewModel = PlacesListViewModel()
        placesListView = PlacesListView(viewModel: viewModel)
    }

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
