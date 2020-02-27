//
//  ImageFetcher.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation

protocol ImageFetcherDelegate {
    func getImage(photoreference: String, withCompletion completionHandler: @escaping ImageFetcher.ImageFetcherHandler)
}

class ImageFetcher: ImageFetcherDelegate {
    public enum FetchResult {
        case success(imageData: Data)
        case failure(error: String)
    }
    
    public typealias ImageFetcherHandler = (FetchResult) -> Void
    
    let MAX_WIDTH: Int = 300
    let MAX_HEIGHT: Int = 300
    
    func getImage(photoreference: String, withCompletion completionHandler: @escaping ImageFetcherHandler) {
        RestServices.getData(.getPhoto, parameters: [
            "photoreference": photoreference,
            "maxwidth": MAX_WIDTH,
            "maxheight": MAX_HEIGHT,
            ], successBlock: { (data) in
                completionHandler(FetchResult.success(imageData: data))
        }) { (error) in
            completionHandler(FetchResult.failure(error: error.error_message))
        }
    }
}
