//
//  ArticleRepository.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import Foundation
import Combine

class ArticleRepository: IArticleRepository {
    static let apiKey: String = "d82c4383383a488cbc020d516d7031cc"
    
    func fetchArticles() -> Future<ArticleState, Never> {
        let ep = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(Self.apiKey)"
        return Future { promise in
            let urlSession = URLSession.shared
            
            guard let url = URL(string: ep) else {
                return
            }
            let urlRequest = URLRequest(url: url)
            let task = urlSession.dataTask(with: urlRequest) { data, response, error in
                guard error == nil else {
                    promise(.success(.failure(error: error!)))
                    return
                }
                guard let data = data else {
                    promise(.success(.failure(error: NSError(domain: "Test", code: 400, userInfo: [NSLocalizedDescriptionKey: "Yury"]))))
                    return
                }

                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] ?? [:]
                    let articles = json["articles"] as? [[String: Any]] ?? []
                    let jsonDataValue = try JSONSerialization.data(withJSONObject: articles, options: .fragmentsAllowed)
                    let jsonData = try JSONDecoder().decode([Article].self, from: jsonDataValue)
                    promise(.success(ArticleState.render(articles: jsonData)))
                } catch {
                    promise(.success(.failure(error: NSError(domain: "Test", code: 400, userInfo: [NSLocalizedDescriptionKey: "unabled to fetch goddamn data"]))))
                }
            }
            task.resume()
        }
    }
}
