//
//  EndPointURL.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

struct NetworkingConstants {
    static let BASE_URL: String = "https://maps.googleapis.com/maps/api/place/"
    static let API_KEY: String = "AIzaSyCka63i5oTpHvw0CPRbiPitfPb4rBZMPqM"
}

public enum EndPointURL: String {
    // MARK: - Enum Cases
    case getPlacesList = "nearbysearch/json"
    case getDetailsOfPlace = "details/json"
    case getPhoto = "photo"
    
    
    // MARK: - Methods
    func fullPath(_ params: [String]? = nil) -> String {
        if let params = params {
            let trimmedParams = params.compactMap { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            return String(format: "\(NetworkingConstants.BASE_URL)\(self.rawValue)", arguments: trimmedParams)
        }
        return "\(NetworkingConstants.BASE_URL)\(self.rawValue)"
    }
}
