//
//  NewEndpoing.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsApi {
    case getNews
}

extension NewsApi: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software/news")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
}
