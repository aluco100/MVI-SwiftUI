//
//  ArticleList.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import SwiftUI

struct ArticleList: View {
    
    @StateObject var vm: ArticlesViewModel = ArticlesViewModel()
//    @State var error: String = ""
//    @State var showActivity: Bool = false
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            switch vm.state {
            case .loading:
                ProgressView()
            case .failure(let error):
                Text(error.localizedDescription)
            case .render(let articles):
                List {
                    ForEach(articles) { article in
                        Text(article.title ?? "")
                            .padding()
                    }
                }
            }
        }.onAppear {
            vm.performIntent(intent: .fetchData)
        }
        
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList()
    }
}
