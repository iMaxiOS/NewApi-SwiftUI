//
//  SettingsView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 14.04.2021.
//

import SwiftUI

struct SettingsView: View {
    @State private var isToggle = false
    @State private var isUserCustomSettings = false
    
    private let header = "Display"
    private let footerString = "System settings will override Dark mode and use the current device theme"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(header), footer: Text(footerString)) {
                    Toggle(isOn: $isToggle, label: {
                        Text("Dark mode")
                    })
                    
                    Toggle(isOn: $isUserCustomSettings, label: {
                        Text("Use system settings")
                    })
                }
                
                Section {
                    Link(destination: URL(string: Constants.twitter)!, label: {
                        Label("Follow me on Twitter @iMaxiOS", systemImage: "link")
                    })
                    Link("Contact me via email", destination: URL(string: Constants.email)!)
                    Link("Call me", destination: URL(string: Constants.phone)!)
                }
                .foregroundColor(.black)
                .font(.headline)
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
