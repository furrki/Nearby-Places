//
//  Place.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation

public struct Place: Hashable {
    var place_id: String
    var name: String
    var lat: Double
    var lng: Double
    
    var location: CLLocation {
        return CLLocation(latitude: lat, longitude: lng)
    }
    
    var distanceFromUser: Double?
    
    public init(_ json: JSON) {
        self.place_id = json["place_id"].stringValue
        self.name = json["name"].stringValue
        if  let geometry = json["geometry"].dictionary,
            let location = geometry["location"]?.dictionary,
            let lat = location["lat"]?.double,
            let lng = location["lng"]?.double {
        
            self.lat = lat
            self.lng = lng
        } else {
            self.lat = 0.0
            self.lng = 0.0
        }
    }
}
