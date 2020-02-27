//
//  StarsView.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 27.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct StarsView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack(alignment: .center, spacing: 3.0) {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: "star.fill").foregroundColor(Color.yellow).fixedSize().frame(width: 30, height: 30, alignment: .center)
                }
            }
            Color.white.frame(width: 150.0 * ((5.0 - CGFloat(self.viewModel.placeDetail.rating!))/5.0), alignment: .trailing)
            HStack(alignment: .center, spacing: 3.0) {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: "star").fixedSize().frame(width: 30, height: 30, alignment: .center)
                }
            }
        }.frame(height: 30)
    }
}
