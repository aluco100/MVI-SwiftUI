//
//  IArticleRepository.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import Foundation
import Combine

protocol IArticleRepository: AnyObject {
    func fetchArticles() -> Future<ArticleState, Never>
}
