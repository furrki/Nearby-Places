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
    @State var hasError: Bool = false
    
    var body: some View {
        List(viewModel.places, id: \.self) { place in
            NavigationLink(destination: DetailView(viewModel: DetailViewModel(place.place_id))) {
                HStack {
                    Text("\(place.name)")
                    Spacer()
                    Text("\(String(format: "%.2f m", place.distanceFromUser ?? 0.0))")
                }
            }
        }.onAppear {
            self.viewModel.viewDidAppear()
        }.onReceive(viewModel.objectWillChange) { _ in
            self.hasError = self.viewModel.errorMessage != nil
        }.alert(isPresented: self.$hasError) { () -> Alert in
            Alert(title: Text("Error"), message: Text(self.viewModel.errorMessage!))
        }
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView(viewModel: PlacesListViewModel())
    }
}

