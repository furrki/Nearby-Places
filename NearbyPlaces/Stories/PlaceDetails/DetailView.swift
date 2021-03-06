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
                            VStack {
                                Text(self.viewModel.placeDetail.name)
                                    .bold()
                                    .font(Font.system(size: 20))
                                    .multilineTextAlignment(.center)
                                if self.viewModel.placeDetail.price_level != nil {
                                    Text("$\(self.viewModel.getPriceLevelText())$").font(Font.system(size: 14))
                                }
                            }
                            .frame(width: geometry.size.width - 10.0)
                            
                            if self.viewModel.imageData != nil {
                                Spacer().frame(height: 10.0)
                                Image(uiImage: UIImage(data: self.viewModel.imageData ?? Data()) ?? UIImage())
                            }
                            
                            if self.viewModel.placeDetail.rating != nil {
                                Spacer().frame(height: 10.0)
                                StarsView(viewModel: self.viewModel)
                            }
                            
                            if self.viewModel.placeDetail.weekday_text != nil {
                                Text(self.viewModel.getWorkingHoursForToday()).font(Font.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .frame(width: geometry.size.width - 30.0)
                            }
                            
                            Text(self.viewModel.placeDetail.formatted_address).font(Font.system(size: 16))
                                .multilineTextAlignment(.center)
                                .frame(width: geometry.size.width - 30.0)
                            
                            
                            Button(action: {
                                if let url: URL = self.viewModel.placeDetail.international_phone_number.phoneNumberToUrl() {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Text(self.viewModel.placeDetail.international_phone_number)
                                    .font(Font.system(size: 16))
                                    .frame(width: geometry.size.width - 30.0)
                                    .lineLimit(1)
                            }
                        }
                        
                        MapView(pinLocation: self.viewModel.placeDetail.location, title: self.viewModel.placeDetail.name, address: self.viewModel.placeDetail.formatted_address)
                            .frame(width: geometry.size.width - 30.0, height: 250.0)
                            .onTapGesture {
                                if let url = URL(string: "http://maps.apple.com/maps?ll=\(self.viewModel.placeDetail.location.coordinate.latitude),\(self.viewModel.placeDetail.location.coordinate.longitude)") {
                                    UIApplication.shared.open(url)
                                }
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
