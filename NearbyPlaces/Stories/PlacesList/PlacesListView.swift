//
//  PlacesListView.swift
//  NearbyPlaces
//
//  Created by Furkan Kaynar on 25.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct PlacesListView: View {
    var body: some View {
        List(1 ... 5, id: \.self) { x in
            NavigationLink(destination: DetailView()) {
                Text("Master\nYou can display a list for example")
            }
        }
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView()
    }
}
