//
//  ErrorResponse.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ErrorResponse: Response {
    public var error_message: String
    public var status: String

    public init(_ contents: Data) {
        let json = JSON(contents).dictionaryValue
        self.error_message = json["error_message"]?.stringValue ?? "An error occured."
        self.status = json["status"]?.stringValue ?? "ERROR"
    }
}
