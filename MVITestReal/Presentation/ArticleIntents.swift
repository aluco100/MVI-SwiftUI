//
//  ArticleIntents.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import Foundation
import Combine

enum ArticleIntents {
    
    var actionProcessor: ArticleActionProcessor {
        ArticleActionProcessor(
            ArticleInteractor(ArticleRepository())
        )
    }
    
    // Use case 1: Fetch Data
    case fetchData
    
    // Use case 2: load more items
    
    case loadMoreItems
    
    func intentInterpreter() -> AnyPublisher<ArticleState, Never> {
        switch self {
        case .fetchData:
            return actionProcessor.fetchArticles()
        case .loadMoreItems:
            return actionProcessor.fetchArticles()
        }
    }
}
