//
//  ArticleInteractor.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import Foundation
import Combine

protocol IArticleInteractor: AnyObject {
    func fetchArticles() -> Future<ArticleState, Never>
}

class ArticleInteractor: IArticleInteractor {
    
    private var repo: IArticleRepository
    
    init(_ repository: IArticleRepository) {
        repo = repository
    }
    
    func fetchArticles() -> Future<ArticleState, Never> {
        repo.fetchArticles()
    }
}
