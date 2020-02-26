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
    
    // MARK: - Object Lifecycle
    init(_ placeId: String) {
        self.placeId = placeId
    }
}
