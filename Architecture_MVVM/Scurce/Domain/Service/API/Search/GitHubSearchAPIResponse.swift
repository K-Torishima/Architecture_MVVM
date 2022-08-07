//
//  GitHubSearchAPIResponse.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/07.
//

import Foundation

// Jsonの形が微妙。
// topには,dataとかでまとまっていると良いのでは
struct GitHubSearchAPIResponse: APIResponse {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
