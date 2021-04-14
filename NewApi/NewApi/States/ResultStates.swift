//
//  ResultStates.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import Foundation

enum ResultStates: Equatable {
    case loading
    case success(content: [Article])
    case failed(error: Error)

    static func == (lhs: ResultStates, rhs: ResultStates) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.success(content: let lhsType), .success(content: let rhsType)):
            return lhsType == rhsType
        case (.failed(error: let lhsError), .failed(error: let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
