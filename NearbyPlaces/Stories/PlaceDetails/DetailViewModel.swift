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
    @Published var placeDetail: PlaceDetail!
    @Published var imageData: Data?
    
    let detailFetcher: DetailFetcher = DetailFetcher()
    let imageFetcher: ImageFetcher = ImageFetcher()
    
    // MARK: - Object Lifecycle
    init(_ placeId: String) {
        self.placeId = placeId
    }
    
    func viewDidAppear() {
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
        print(detail)
        objectWillChange.send()
        
        if detail.hasImage {
            getImage()
        }
    }
    
    func set(image: Data) {
        self.imageData = image
        objectWillChange.send()
    }
    
    //MARK: - Methods
    func getPriceLevelText() -> String {
        if  let placeDetail = placeDetail,
            let priceLevel: Int = placeDetail.price_level, priceLevel < 5 {
            let levels: [String] = ["Free", "Inexpensive", "Moderate", "Expensice", "Very Expensive"]
            return levels[priceLevel]
        }
        return ""
    }
    
    func getWorkingHoursForToday() -> String {
        if  let placeDetail = placeDetail,
            let weekdayTexts = placeDetail.weekday_text, weekdayTexts.count == 7 {
            let now: Date = Date()
            
            return weekdayTexts[now.getDayOfWeek()]
        }
        return ""
    }
}
