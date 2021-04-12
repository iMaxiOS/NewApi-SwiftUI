//
//  ArticleView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import SwiftUI
import URLImage

struct ArticleView: View {
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
                    
                    Text(article.source)
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            } else {
                PlaceholderImageView()
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
