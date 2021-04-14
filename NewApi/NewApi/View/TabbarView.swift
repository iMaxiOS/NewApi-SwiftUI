//
//  TabbarView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 14.04.2021.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
