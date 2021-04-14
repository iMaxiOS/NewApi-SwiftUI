//
//  TabbarView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 14.04.2021.
//

import SwiftUI

struct TabbarView: View {
    @AppStorage("darkModeEnable") private var darkModeEnable = false
    @AppStorage("systemThemeEnable") private var systemThemeEnable = false    
    
    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            
            SettingsView(darkModeEnable: $darkModeEnable, systemThemeEnable: $systemThemeEnable)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .onAppear {
            SystemThemeManager.shared.handleTheme(darkMode: darkModeEnable, system: systemThemeEnable)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
