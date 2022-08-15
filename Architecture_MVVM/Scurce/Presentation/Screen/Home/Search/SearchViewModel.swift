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
    
    private var page: Int = 1
    private let perPage: Int = 20
    
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
        // fetchRepositories(query: searchText)
        
        fetchRepositories(query: searchText, page: page, perPage: perPage)
    }
    
    func didSelectRowAt(_ row: Int) {
        let data = datasource[row]
        router?.goToSearchDetail(data: data)
    }
    
    func hasNext() {
        
    }
    
    // 指定なし
    private func fetchRepositories(query: String) {
        progressState = .fetch
        Task {
            do {
                defer { Task { @MainActor in progressState = .none } }
                let response = try await searchRepository.getSearchRepositories(query: query)
                datasource.append(contentsOf: response.items)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchRepositories(query: String, page: Int, perPage: Int) {
        progressState = .fetch
        Task {
            do {
                defer { Task { @MainActor in progressState = .none } }
                let response = try await searchRepository.getSearchRepositories(query: query,
                                                                                sort: nil,
                                                                                order: nil,
                                                                                page: page,
                                                                                perPage: perPage)
                datasource.append(contentsOf: response.items)
                self.page += 1
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
