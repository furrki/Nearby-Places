//
//  DetailViewModel.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 26.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    // MARK: - Properties
    let objectWillChange = PassthroughSubject<Void, Never>()
    var placeId: String
    var placeDetail: PlaceDetail?
    var imageData: Data?
    
    let detailFetcher: DetailFetcher = DetailFetcher()
    let imageFetcher: ImageFetcher = ImageFetcher()
    
    // MARK: - Object Lifecycle
    init(_ placeId: String) {
        self.placeId = placeId
        getDetails()
    }
    
    // MARK: - Fetchings
    func getDetails() {
        detailFetcher.getDetail(placeId: placeId) { [weak self] fetchResult in
            guard case .success(let detail) = fetchResult else { return }
            self?.set(detail: detail)
        }
    }
    
    func getImage() {
        if  let detail = placeDetail,
            let photoReference = detail.photo_reference {
            
            imageFetcher.getImage(photoreference: photoReference) {  [weak self] fetchResult in
                guard case .success(let imageData) = fetchResult else { return }
                self?.set(image: imageData)
            }
        }
    }
    
    func set(detail: PlaceDetail) {
        self.placeDetail = detail
        objectWillChange.send()
        
        if detail.hasImage {
            getImage()
        }
    }
    
    func set(image: Data) {
        self.imageData = image
        objectWillChange.send()
    }
}
