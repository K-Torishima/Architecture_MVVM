//
//  SearchRepository.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/07.
//

import Foundation

protocol SearchRepository {
    // 指定あり
    func getSearchRepositories(query: String) async throws -> GitHubSearchAPIResponse
    // 指定なし
    func getSearchRepositories(query: String, sort: Sort, order: Order, page: Int, perPage: Int) async throws -> GitHubSearchAPIResponse
}
