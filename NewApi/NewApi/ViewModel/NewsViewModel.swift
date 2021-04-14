//
//  NewsViewModel.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticle()
    var isLoading: Bool { get }
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    @Published private(set) var state: ResultStates = .loading
    
    private(set) var articles = [Article]()
    private var cancellable = Set<AnyCancellable>()
    private let service: NewsService
    
    var isLoading: Bool {
        state == .loading
    }
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticle() {
        self.state = .loading
        
        let cancellable = service.request(from: .getNews)
            .sink { result in
                switch result {
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.article
            }
        self.cancellable.insert(cancellable)
    }
}
