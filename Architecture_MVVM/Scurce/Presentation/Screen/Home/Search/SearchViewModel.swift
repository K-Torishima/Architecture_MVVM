//
//  SearchViewModel.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import Foundation

@MainActor
final class SearchViewModel {
    
    // Publisher
    
    private let searchRepository: SearchRepository
    private weak var router: SearchRouter?
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }
    
    func viewDidLoard() {
        fetchRepositories()
    }
    
    func set(router: SearchRouter) {
        self.router = router
    }
    
    private func fetchRepositories() {
        Task {
            do {
                let response =  try await searchRepository.getSearchRepositories(query: "go")
                print(response)
                
            } catch let error {
                print(error)
            }
        }
    }
}
