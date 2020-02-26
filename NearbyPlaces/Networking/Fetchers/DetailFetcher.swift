//
//  DetailFetcher.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation


class DetailFetcher {
    public enum FetchResult {
        case success(detail: PlaceDetail)
        case failure(error: String)
    }
    
    let fields: String = "name,formatted_address,rating,photos,geometry,price_level,opening_hours"
    
    public typealias DetailFetchHandler = (FetchResult) -> Void

    func getDetail(placeId: String, withCompletion completionHandler: @escaping DetailFetchHandler) {
        RestServices.getResponse(.getDetailsOfPlace, type: DetailResponse.self, parameters: [
            "place_id": placeId,
            "fields": fields
            ], successBlock: { (response: DetailResponse) in
                if let detail = response.detail {
                    completionHandler(FetchResult.success(detail: detail))
                } else {
                    completionHandler(FetchResult.failure(error: "Detail not found."))
                }
        }) { (error) in
            completionHandler(FetchResult.failure(error: error.error_message))
        }
    }
}
