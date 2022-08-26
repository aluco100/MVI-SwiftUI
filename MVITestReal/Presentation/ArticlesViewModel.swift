//
//  ArticlesViewModel.swift
//  MVITestReal
//
//  Created by Alfredo Luco Gordon on 11-08-22.
//

import Foundation
import Combine

class ArticlesViewModel: ObservableObject {
    
    var cancellableSet: Set<AnyCancellable> = []
    @Published var state: ArticleState
    
    init() {
        state = .loading
    }
    
    func performIntent(intent: ArticleIntents) {
       let intent = intent.intentInterpreter()
        intent
            .receive(on: RunLoop.current)
            .sink { newState in
                
                    // TODO: reducer
                    self.state = newState
                    self.objectWillChange.send()
            }.store(in: &cancellableSet)
    }
}
