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
    var rating: Double?
    var photo_reference: String?
    var weekday_text: [String]?
    var price_level: Int?
    var lat: Double
    var lng: Double
    
    var hasImage: Bool {
        return photo_reference != nil
    }
    
    public init(_ json: JSON) {
        self.name = json["name"].stringValue
        self.formatted_address = json["formatted_address"].stringValue
        self.international_phone_number = json["international_phone_number"].stringValue
        self.rating = json["rating"].double
        
        self.photo_reference = json["photo_reference"].stringValue
        self.price_level = json["price_level"].int
        
        if let openingHours = json["opening_hours"].dictionary {
            self.weekday_text = openingHours["weekday_text"]?.arrayObject as? [String]
        }
        
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
