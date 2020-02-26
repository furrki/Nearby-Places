//
//  PlacesListView.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 25.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct PlacesListView: View {
    @ObservedObject var viewModel: PlacesListViewModel
    
    var body: some View {
        List(viewModel.places, id: \.self) { place in
            NavigationLink(destination: DetailView(viewModel: DetailViewModel(place.place_id))) {
                HStack {
                    Text("\(place.name)")
                    Spacer()
                    Text("\(String(format: "%.2f m", place.distanceFromUser ?? 0.0))")
                }
            }
        }
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView(viewModel: PlacesListViewModel())
    }
}
