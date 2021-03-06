//
//  ArticleView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    @State var isLoading: Bool
    
    var article: Article
    
    var body: some View {
        HStack(spacing: 10) {
            if let urlImage = article.image, let url = URL(string: urlImage) {
                URLImage(
                    url: url,
                    options: URLImageOptions(
                        identifier: article.id.uuidString,
                        cachePolicy: .returnCacheElseLoad(cacheDelay: nil)
                    ),
                    failure: { error, _ in
                        PlaceholderImageView()
                    },
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                )
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(article.title)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .lineLimit(3)
                    
                    Text(article.source)
                        .foregroundColor(.gray)
                        .font(.footnote)
                    
                    if let date = article.date {
                        HStack {
                            Text(date, style: .date)
                                .bold()
                            Text(date, style: .time)
                        }
                        .foregroundColor(.gray)
                        .font(.footnote)
                    }
                }
            } else {
                PlaceholderImageView()
            }
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(isLoading: false, article: Article.dummyData.last!)
            .previewLayout(.sizeThatFits)
    }
}
