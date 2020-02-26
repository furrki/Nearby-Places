//
//  PlaceDetail.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation

struct PlaceDetail {
    var name: String
    var formatted_address: String
    var international_phone_number: String
    var rating: String?
    var photo_reference: String
    var weekday_text: [String]?
    var price_level: String
    var lat: Double
    var lng: Double
}
