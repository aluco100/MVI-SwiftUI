//
//  ArticleActionProcessor.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import Foundation
import Combine

class ArticleActionProcessor {
    
    private var interactor: IArticleInteractor
    
    init(_ interactor: IArticleInteractor) {
        self.interactor = interactor
    }
    
    func fetchArticles() -> AnyPublisher<ArticleState, Never> {
        interactor.fetchArticles()
            .eraseToAnyPublisher()
    }
}
