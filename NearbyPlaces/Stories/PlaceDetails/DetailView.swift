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
        Text("")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let detailViewModel: DetailViewModel = DetailViewModel("")
        return DetailView(viewModel: detailViewModel)
    }
}
