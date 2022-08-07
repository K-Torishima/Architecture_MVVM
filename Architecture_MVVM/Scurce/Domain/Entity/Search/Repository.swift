//
//  Repository.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/07.
//

import Foundation

// https://docs.github.com/ja/rest/reference/search
struct Repository: Decodable {
    let id: Int
    let nodeID: String
    let name: String
    let fullName: String
    let owner: Owner
    let isPrivate: Bool
    let htmlURL: URL
    let contributorsURL: URL
    let description: String?
    let isFork: Bool
    let url: URL
    let createdAt: String
    let updatedAt: String
    let pushedAt: String?
    let homepage: String?
    let size: Int
    let stargazersCount: Int
    let watchersCount: Int
    let language: String?
    let forksCount: Int
    let openIssuesCount: Int
    let defaultBranch: String

    private enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case isPrivate = "private"
        case htmlURL = "html_url"
        case contributorsURL = "contributors_url"
        case description
        case isFork = "fork"
        case url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case homepage
        case size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case defaultBranch = "default_branch"
    }
}
