//
//  SystemThemeManager.swift
//  NewApi
//
//  Created by Maxim Granchenko on 14.04.2021.
//

import Foundation
import UIKit

class SystemThemeManager {
    static var shared = SystemThemeManager()
    
    init() {}
    
    func handleTheme(darkMode: Bool, system: Bool) {
        guard !system else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
            return
        }
        
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
}
