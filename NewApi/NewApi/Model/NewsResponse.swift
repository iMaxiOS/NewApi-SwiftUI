//
//  NewModel.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import Foundation

struct NewsResponse: Codable {
    let article: [Article]
}

struct Article: Codable, Identifiable, Equatable {
    var id = UUID()
    let author: String?
    let url: String
    let source, title: String
    let articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: [Article] {
        [
            .init(
                author: "Sam Byford",
                url: "https://www.theverge.com/2021/4/12/22379337/new-ipad-pro-mini-led-production-issues-date-report",
                source: "The Verge",
                title: "New iPad Pro still coming soon but supply could be short, says Bloomberg - The Verge",
                articleDescription: "The Mini LED display is reportedly having production issues",
                image: "https://cdn.vox-cdn.com/thumbor/sBQPi5PJXEdq15ekaIjD_Pl1vNc=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/13385159/akrales_181101_3064_0078.jpg",
                date: Date()
            ),
            .init(
                author: "Sam Byford",
                url: "https://www.theverge.com/2021/4/12/22379337/new-ipad-pro-mini-led-production-issues-date-report",
                source: "The Verge",
                title: "New iPad Pro still coming soon but supply could be short, says Bloomberg - The Verge",
                articleDescription: "The Mini LED display is reportedly having production issues",
                image: "https://cdn.vox-cdn.com/thumbor/sBQPi5PJXEdq15ekaIjD_Pl1vNc=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/13385159/akrales_181101_3064_0078.jpg",
                date: Date()
            ),
            .init(
                author: "Sam Byford",
                url: "https://www.theverge.com/2021/4/12/22379337/new-ipad-pro-mini-led-production-issues-date-report",
                source: "The Verge",
                title: "New iPad Pro still coming soon but supply could be short, says Bloomberg - The Verge",
                articleDescription: "The Mini LED display is reportedly having production issues",
                image: "https://cdn.vox-cdn.com/thumbor/sBQPi5PJXEdq15ekaIjD_Pl1vNc=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/13385159/akrales_181101_3064_0078.jpg",
                date: Date()
            ),
            .init(
                author: "Sam Byford",
                url: "https://www.theverge.com/2021/4/12/22379337/new-ipad-pro-mini-led-production-issues-date-report",
                source: "The Verge",
                title: "New iPad Pro still coming soon but supply could be short, says Bloomberg - The Verge",
                articleDescription: "The Mini LED display is reportedly having production issues",
                image: "https://cdn.vox-cdn.com/thumbor/sBQPi5PJXEdq15ekaIjD_Pl1vNc=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/13385159/akrales_181101_3064_0078.jpg",
                date: Date()
            ),
            .init(
                author: "Sam Byford",
                url: "https://www.theverge.com/2021/4/12/22379337/new-ipad-pro-mini-led-production-issues-date-report",
                source: "The Verge",
                title: "New iPad Pro still coming soon but supply could be short, says Bloomberg - The Verge",
                articleDescription: "The Mini LED display is reportedly having production issues",
                image: "https://cdn.vox-cdn.com/thumbor/sBQPi5PJXEdq15ekaIjD_Pl1vNc=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/13385159/akrales_181101_3064_0078.jpg",
                date: Date()
            )
        ]
    }
}
