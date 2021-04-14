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
                case .failed(let error):
                    ErrorView(error: error, actionHandler: viewModel.getArticle)
                default:
                    List(viewModel.isLoading ? Article.dummyData : viewModel.articles) { article in
                        ArticleView(isLoading: viewModel.isLoading, article: article)
                            .onTapGesture {
                                loadLink(url: article.url)
                            }
                    }
                    .navigationTitle("Articles")
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
