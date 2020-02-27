//
//  DetailTests.swift
//  NearbyPlacesTests
//
//  Created by Furkan Kaynar on 27.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import NearbyPlaces

class DetailTests: XCTestCase {
    var detail: PlaceDetail!
    var detailView: DetailView!
    var viewModel: DetailViewModel!
    
    override func setUp() {
        viewModel = DetailViewModel("")
        detailView = DetailView(viewModel: viewModel)
        detail = Mocker.getPlaceDetail()
        viewModel.set(detail: detail)
    }

    // MARK: - Setters
    func testSetImage() {
        viewModel.set(image: Data())
        XCTAssertEqual(viewModel.imageData, Data())
    }
    
    func testSetDetail() {
        detail = Mocker.getPlaceDetail()
        viewModel.set(detail: detail)
        XCTAssertEqual(viewModel.placeDetail, detail)
    }
    
    // MARK: - Text for UI
    func testPriceLevelText() {
        detail.photo_reference = nil
        
        detail.price_level = 2
        viewModel.set(detail: detail)
        XCTAssertEqual(viewModel.getPriceLevelText(), "Moderate")

        detail.price_level = 4
        viewModel.set(detail: detail)
        XCTAssertEqual(viewModel.getPriceLevelText(), "Very Expensive")
        
        detail.price_level = 0
        viewModel.set(detail: detail)
        XCTAssertEqual(viewModel.getPriceLevelText(), "Free")
        
        detail.price_level = 5
        viewModel.set(detail: detail)
        XCTAssertEqual(viewModel.getPriceLevelText(), "")
    }
    
    // MARK: - Fetchings
    func testGetDetailsAndEnsureImageTriggered() {
        let imageData: Data = Data()
        var detail = Mocker.getPlaceDetail()
        detail.photo_reference = "Something"
        viewModel.detailFetcher = DetailFetcherMocker(isSuccessful: true, placeDetail: detail)
        viewModel.imageFetcher = ImageFetcherMocker(isSuccessful: true, imageData: imageData)
        viewModel.getDetails()
        
        XCTAssertEqual(viewModel.placeDetail, Mocker.getPlaceDetail())
        XCTAssertNotNil(viewModel.imageData)
        XCTAssertEqual(viewModel.imageData, imageData)
    }
}

class DetailFetcherMocker: DetailFetcherDelegate {
    let isSuccessful: Bool
    var detail: PlaceDetail = Mocker.getPlaceDetail()
    
    init(isSuccessful: Bool, placeDetail: PlaceDetail? = nil){
        self.isSuccessful = isSuccessful
        if let placeDetail = placeDetail {
            self.detail = placeDetail
        }
    }
    
    func getDetail(placeId: String, withCompletion completionHandler: @escaping DetailFetcher.DetailFetchHandler) {
        if isSuccessful {
            completionHandler(DetailFetcher.FetchResult.success(detail: detail))
        } else {
            completionHandler(DetailFetcher.FetchResult.failure(error: "Error"))
        }
    }
}

class ImageFetcherMocker: ImageFetcherDelegate {
    var imageData: Data = Data()
    let isSuccessful: Bool
    
    init(isSuccessful: Bool, imageData: Data? = nil){
        self.isSuccessful = isSuccessful
        if let imageData = imageData {
            self.imageData = imageData
        }
    }
    
    func getImage(photoreference: String, withCompletion completionHandler: @escaping ImageFetcher.ImageFetcherHandler) {
        if isSuccessful {
            completionHandler(ImageFetcher.FetchResult.success(imageData: imageData))
        } else {
            completionHandler(ImageFetcher.FetchResult.failure(error: "Error"))
        }
    }
}
