//
//  PlaceDetail.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct PlaceDetail {
    var name: String
    var formatted_address: String
    var international_phone_number: String
    var rating: String?
    var photo_reference: String?
    var weekday_text: [String]?
    var price_level: String?
    var lat: Double
    var lng: Double
    
    public init(_ json: JSON) {
        self.name = json["name"].stringValue
        self.formatted_address = json["formatted_address"].stringValue
        self.international_phone_number = json["international_phone_number"].stringValue
        self.rating = json["rating"].string
        
        self.photo_reference = json["photo_reference"].stringValue
        self.price_level = json["price_level"].string
        self.weekday_text = json["weekday_text"].arrayObject as? [String]
        
        if  let photos = json["photos"].array,
            let firstPhoto = photos.first,
            let firstPhotoReference = firstPhoto["photo_reference"].string {
            
            self.photo_reference = firstPhotoReference
        }
        
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
