//
//  ContentView.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 25.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            PlacesListView(viewModel: PlacesListViewModel()).navigationBarTitle("Places List")
            Text("Looking for the places around you..")
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
