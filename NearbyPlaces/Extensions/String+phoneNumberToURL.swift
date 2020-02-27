//
//  String+phoneNumberToURL.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 27.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation

extension String {
    func phoneNumberToUrl() -> URL? {
        let dash = CharacterSet(charactersIn: "-+")
        let cleanString = self.replacingOccurrences(of: " ", with: "").trimmingCharacters(in: dash)
        let tel = "tel://"
        var formattedString = tel + cleanString
        let url: URL? = URL(string: formattedString)
        return url
    }
}
