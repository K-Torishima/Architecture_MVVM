//
//  TopViewModel.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/06.
//

import Foundation
import Combine

@MainActor
final class TopViewModel {
    
    enum DisplayState {
        case initial
        case main
    }
    
    @Published private (set) var desplayState: DisplayState = .initial
    
    private let searchRepository: SearchRepository
    private weak var router: TopRouter?
    
    func viewDidLoad() {
        desplayState = .main
        
        
        test()
    }
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }
    
    func set(router: TopRouter) {
        self.router = router
    }
    
    private func test() {
        Task {
            do {
                let response = try await searchRepository.getSearchRepositories(query: "swift")
                print(response)
            } catch let error {
                print(error)
            }
        }
    }
}
