//
//  DetailResponse.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DetailResponse: Response {
    public var detail: PlaceDetail?

    public init(_ contents: Data) {
        let json = JSON(contents).dictionaryValue
        if let result = json["result"] {
            print(result)
            detail = PlaceDetail(result)
        }
    }
}
