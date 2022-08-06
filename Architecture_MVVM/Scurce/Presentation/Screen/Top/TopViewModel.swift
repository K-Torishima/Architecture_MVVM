//
//  TopViewModel.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/06.
//

import Foundation

final class TopViewModel {
    
    enum DisplayState {
        case initial
        case main
    }
    
    @Published private (set) var desplayState: DisplayState = .initial
    
    private weak var router: TopRouter?
    
    func viewDidLoad() {
        desplayState = .main
        print("main")
    }
    
    func set(router: TopRouter) {
        self.router = router
    }
}
