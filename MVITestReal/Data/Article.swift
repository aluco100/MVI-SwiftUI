//
//  Article.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import Foundation

struct Article: Decodable, Identifiable {
    
    var id: UUID = UUID()
    var title: String?
    var author: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try? container.decodeIfPresent(String.self, forKey: .title)
        author = try? container.decodeIfPresent(String.self, forKey: .author)
    }
    
    enum CodingKeys: String, CodingKey  {
        case title
        case author
    }
}
