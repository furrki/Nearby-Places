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
                GeometryReader { geometry in
                    ScrollView(.vertical) {
                    VStack(alignment: .center, spacing: 5) {
                        HStack {
                            Text(self.viewModel.placeDetail.name)
                                .bold()
                                .font(Font.system(size: 20))
                                .frame(width: geometry.size.width - 30.0)
                                .multilineTextAlignment(.center)
                            if self.viewModel.placeDetail.price_level != nil {
                                Text("(\(self.viewModel.getPriceLevelText())").bold().font(Font.system(size: 17))
                            }
                        }
                        
                        if self.viewModel.imageData != nil {
                            Spacer().frame(height: 10.0)
                            Image(uiImage: UIImage(data: self.viewModel.imageData ?? Data()) ?? UIImage())
                        }
                        
                        if self.viewModel.placeDetail.rating != nil {
                            Spacer().frame(height: 10.0)
                            ZStack(alignment: .trailing) {
                                HStack(alignment: .center, spacing: 3.0) {
                                    ForEach(1...5, id: \.self) { index in
                                        Image(systemName: "star.fill").fixedSize().frame(width: 30, height: 30, alignment: .center)
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
                        
                        if self.viewModel.placeDetail.weekday_text != nil {
                            Text(self.viewModel.getWorkingHoursForToday()).font(Font.system(size: 16))
                            .multilineTextAlignment(.center)
                            .frame(width: geometry.size.width - 30.0)
                        }
                        
                        Text(self.viewModel.placeDetail.formatted_address).font(Font.system(size: 16))
                            .multilineTextAlignment(.center)
                            .frame(width: geometry.size.width - 30.0)
                        
                        Text(self.viewModel.placeDetail.international_phone_number)
                            .font(Font.system(size: 16))
                            .frame(width: geometry.size.width - 30.0)
                            .lineLimit(1)
                        
                        }
                        
                        MapView(pinLocation: self.viewModel.placeDetail.location, title: self.viewModel.placeDetail.name, address: self.viewModel.placeDetail.formatted_address)
                            .frame(width: geometry.size.width - 30.0, height: 250.0)
                            .onTapGesture {
                                let url = "http://maps.apple.com/maps?ll=\(self.viewModel.placeDetail.location.coordinate.latitude),\(self.viewModel.placeDetail.location.coordinate.longitude)"
                                UIApplication.shared.open(URL(string: url)!)
                        }
                        
                        Spacer()
                    }
                }.frame(width: UIScreen.main.bounds.width)
                
                
            } else {
                Spacer()
                Text("Loading..")
                Spacer()
            }
        }
            .padding([.leading, .trailing], 10)
            .navigationBarTitle("Details")
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
