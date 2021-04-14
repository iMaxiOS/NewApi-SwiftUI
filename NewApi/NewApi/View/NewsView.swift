//
//  HomeView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import SwiftUI

struct NewsView: View {
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(error: error, actionHandler: viewModel.getArticle)
                case .success(let articles):
                    NavigationView {
                        List(articles) { article in
                            ArticleView(article: article)
                                .onTapGesture {
                                    loadLink(url: article.url)
                                }
                        }
                        .navigationTitle("Articles")
                    }
                }
            }
        }
        .onAppear(perform: viewModel.getArticle)
    }
    
    func loadLink(url: String?) {
        guard let link = url, let url = URL(string: link) else { return }
        
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
