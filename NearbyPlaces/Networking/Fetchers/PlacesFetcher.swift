//
//  PlacesFetcher.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation

class PlacesFetcher {
    public enum FetchResult {
        case success(places: [Place])
        case failure(error: String)
    }
    
    public typealias PlacesFetchHandler = (FetchResult) -> Void
    let RADIUS: Int = 100
    
    func getPlaces(lat: String, lng: String, withCompletion completionHandler: @escaping PlacesFetchHandler) {
        RestServices.getResponse(.getPlacesList, type: PlacesResponse.self, parameters: [
            "location": "\(lat),\(lng)",
            "radius": RADIUS
            ], successBlock: { (response: PlacesResponse) in
                if let places = response.places {
                    completionHandler(FetchResult.success(places: places))
                } else {
                    completionHandler(FetchResult.failure(error: "Places not found."))
                }
        }) { (error) in
            completionHandler(FetchResult.failure(error: error.error_message))
        }
    }
}
