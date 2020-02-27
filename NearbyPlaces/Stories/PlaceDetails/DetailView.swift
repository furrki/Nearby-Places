//
//  DetailView.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 25.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            if viewModel.placeDetail != nil {
                    VStack(alignment: .center, spacing: 0) {
                        Text(viewModel.placeDetail.name).bold().font(Font.system(size: 20))

                        if viewModel.imageData != nil {
                            Spacer().frame(height: 10.0)
                            Image(uiImage: UIImage(data: viewModel.imageData ?? Data()) ?? UIImage())
                        }
                        
                        if viewModel.placeDetail.rating != nil {
                            Spacer().frame(height: 10.0)
                            ZStack(alignment: .trailing) {
                                HStack(alignment: .center, spacing: 3.0) {
                                    ForEach(1...5, id: \.self) { index in
                                        Image(systemName: "star.fill").fixedSize().frame(width: 30, height: 30, alignment: .center)
                                    }
                                }
                                Color.white.frame(width: 150.0 * ((5.0 - CGFloat(viewModel.placeDetail.rating!))/5.0), alignment: .trailing)
                            }.frame(height: 30)
                        }
                        
                        Spacer()
                        
                    }.frame(width: UIScreen.main.bounds.width)
              
                
            } else {
                Spacer()
                Text("Loading..")
                Spacer()
            }
        }.padding([.leading, .trailing], 10)
            .onAppear {
                self.viewModel.viewDidAppear()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let detailViewModel: DetailViewModel = DetailViewModel("")
        detailViewModel.set(detail: Mocker.getPlaceDetail())
        detailViewModel.set(image: UIImage(named: "example")?.pngData() ?? Data())
        return DetailView(viewModel: detailViewModel)
    }
}
