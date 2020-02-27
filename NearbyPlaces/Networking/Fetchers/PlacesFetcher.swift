//
//  PlacesFetcher.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import CoreLocation

protocol PlacesFetcherDelegate {
    func getPlaces(lat: Double, lng: Double, withCompletion completionHandler: @escaping PlacesFetcher.PlacesFetchHandler)
}

class PlacesFetcher: PlacesFetcherDelegate {
    public enum FetchResult {
        case success(places: [Place])
        case failure(error: String)
    }
    
    public typealias PlacesFetchHandler = (FetchResult) -> Void
    let RADIUS: Int = 100
    
    func getPlaces(lat: Double, lng: Double, withCompletion completionHandler: @escaping PlacesFetchHandler) {
        RestServices.getResponse(.getPlacesList, type: PlacesResponse.self, parameters: [
            "location": "\(lat),\(lng)",
            "radius": RADIUS
            ], successBlock: { (response: PlacesResponse) in
                if let places = response.places {
                    let placesWithDistance: [Place] = places.map { place in
                        var newPlace: Place = place
                        newPlace.distanceFromUser = newPlace.location.distance(from: CLLocation(latitude: lat, longitude: lng))
                        return newPlace
                    }
                    completionHandler(FetchResult.success(places: placesWithDistance))
                } else {
                    completionHandler(FetchResult.failure(error: "Places not found."))
                }
        }) { (error) in
            completionHandler(FetchResult.failure(error: error.error_message))
        }
    }
}
