//
//  Mocker.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Mocker {
    static func getPlaces() -> [Place] {
        return [
            Place(JSON())
//            Place(place_id: "Place_Id", name: "Plane_Name", lat: 12.0, lng: 12.0),
//            Place(place_id: "Place_Id_2", name: "Plane_Name_2", lat: 13.0, lng: 13.0),
//            Place(place_id: "Place_Id_3", name: "Plane_Name_3", lat: 14.0, lng: 14.0),
        ]
    }
    
    static func getPlaceDetail() -> PlaceDetail {
        let weekDayText: [String] = [
            "Monday: Open 24 hours",
            "Tuesday: Open 24 hours",
            "Wednesday: Open 24 hours",
            "Thursday: Open 24 hours",
            "Friday: Open 24 hours",
            "Saturday: Closed",
            "Sunday: Closed"
        ]
        
        
        return PlaceDetail(name: "Name of Place", formatted_address: "ul Tintyava, 12A 14, Izgrev Sofia", international_phone_number: "+359 334 445 55", rating: "3.2", photo_reference: "", weekday_text: weekDayText, price_level: "3", lat: 13.0, lng: 13.0)
    }
}
