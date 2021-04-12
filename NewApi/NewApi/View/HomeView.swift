//
//  HomeView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import SwiftUI

struct HomeView: View {
//    var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("News")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
