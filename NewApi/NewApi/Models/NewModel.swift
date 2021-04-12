//
//  NewModel.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import Foundation

struct NewModel: Codable {
    let article: [Article]
}

struct Article: Codable, Identifiable {
    var id = UUID()
    let author: String?
    let url: String
    let source, title: String
    let articleDescription: String?
    let image: String?
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
