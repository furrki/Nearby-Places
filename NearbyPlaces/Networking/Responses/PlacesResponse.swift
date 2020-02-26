//
//  PlacesResponse.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct PlacesResponse: Response {
    public var places: [Place]?

    public init(_ contents: Data) {
        let json = JSON(contents).dictionaryValue
        if let results = json["results"]?.array {
            places = results.map { Place($0) }
        }        
    }
}
