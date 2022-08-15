//
//  SearchRepositoryImpl.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/07.
//

import Foundation

final class SearchRepositoryImpl: SearchRepository {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getSearchRepositories(query: String, sort: Sort?, order: Order?, page: Int?, perPage: Int?) async throws -> GitHubSearchAPIResponse {
        let request = GitHubSearchAPIRequest(query: query, sort: sort, order: order, page: page, perPage: perPage)
        let response = try await apiService.request(request)
        return response
    }
    
    func getSearchRepositories(query: String) async throws -> GitHubSearchAPIResponse {
        let request = GitHubSearchAPIRequest(query:  query, sort: nil, order: nil, page: nil, perPage: nil)
        let response = try await apiService.request(request)
        return response
    }
}
