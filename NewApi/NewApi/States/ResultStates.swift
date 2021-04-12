//
//  ResultStates.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import Foundation

enum ResultStates {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
