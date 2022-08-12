//
//  SearchViewModel.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/11.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel {
    
    enum DisplayState {
        case initial
        case main
    }
    
    enum ProgressState {
        case none
        case fetch
    }
    
    // Publisher
    @Published private (set) var displayState: DisplayState = .initial
    @Published private (set) var progressState: ProgressState = .none
    @Published private (set) var datasource: [Repository] = []
    
    private let searchRepository: SearchRepository
    private weak var router: SearchRouter?
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }
    
    func viewDidLoard() {
        
    }
    
    func set(router: SearchRouter) {
        self.router = router
    }
    
    func apply(searchText: String) {
        reset()
        fetchRepositories(query: searchText)
    }
    
    // 検索して最初のfetch
    private func fetchRepositories(query: String) {
        progressState = .fetch
        Task {
            do {
                defer { Task { @MainActor in progressState = .none } }
                let response =  try await searchRepository.getSearchRepositories(query: query)
                datasource.append(contentsOf: response.items)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    // スクロールして取りに行く時によぶ
    private func hasnext() {
        
    }
    
    private func reset() {
        datasource.removeAll()
    }
}
