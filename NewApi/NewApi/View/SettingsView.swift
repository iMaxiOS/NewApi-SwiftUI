//
//  SettingsView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 14.04.2021.
//

import SwiftUI

struct SettingsView: View {
    @Binding var darkModeEnable: Bool
    @Binding var systemThemeEnable: Bool
    
    private let header = "Display"
    private let footerString = "System settings will override Dark mode and use the current device theme"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(header), footer: Text(footerString)) {
                    Toggle(isOn: $darkModeEnable, label: {
                        Text("Dark mode")
                    })
                    .onChange(of: darkModeEnable, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnable, system: systemThemeEnable)
                    })
                    
                    Toggle(isOn: $systemThemeEnable, label: {
                        Text("Use system settings")
                    })
                    .onChange(of: systemThemeEnable, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnable, system: systemThemeEnable)
                    })
                }
                
                Section {
                    Link(destination: URL(string: Constants.twitter)!, label: {
                        Label("Follow me on Twitter @iMaxiOS", systemImage: "link")
                    })
                    Link("Contact me via email", destination: URL(string: Constants.email)!)
                    Link("Call me", destination: URL(string: Constants.phone)!)
                }
                .foregroundColor(Color(.label))
                .font(.headline)
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(darkModeEnable: .constant(false), systemThemeEnable: .constant(false))
    }
}
