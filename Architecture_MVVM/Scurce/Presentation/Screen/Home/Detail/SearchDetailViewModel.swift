//
//  SearchDetailViewModel.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import Foundation

struct SearchDetailTransitionEntity {
    let data: Repository
}

final class SearchDetailViewModel {
    
    @Published private (set) var data: Repository? = nil
    
    private var transitionEntity: SearchDetailTransitionEntity!
    private weak var router: SearchDetailRouter?
    
    func set(transitionEntity: SearchDetailTransitionEntity) {
        self.transitionEntity = transitionEntity
    }
    
    func set(router: SearchDetailRouter) {
        self.router = router
    }
    
    func viewDidLoad() {
        data = transitionEntity.data
    }
}
