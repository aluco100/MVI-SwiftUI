//
//  ArticleState.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import Foundation

enum ArticleState { //sealed class
    case loading // object
    case render(articles: [Article]) // data class
    case failure(error: Error)
}
