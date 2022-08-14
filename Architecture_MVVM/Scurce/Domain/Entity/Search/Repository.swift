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

extension Repository {
    static func mock() -> Repository {
        return Repository(id: 44838949,
                          nodeID: "MDEwOlJlcG9zaXRvcnk0NDgzODk0OQ==",
                          name: "swift",
                          fullName: "apple/swift",
                          owner: Owner(login: "apple",
                                       id: 10639145,
                                       nodeID: "MDEyOk9yZ2FuaXphdGlvbjEwNjM5MTQ1",
                                       avatarURL: URL(string:"https://avatars.githubusercontent.com/u/10639145?v=4")!,
                                       gravatarID: "",
                                       url: URL(string: "https://api.github.com/users/apple")!,
                                       receivedEventsURL: URL(string: "https://api.github.com/users/apple/received_events")!,
                                       type: "Organization"),
                          isPrivate: false,
                          htmlURL: URL(string: "https://github.com/apple/swift")!,
                          contributorsURL: URL(string: "https://api.github.com/repos/apple/swift/contributors")!,
                          description: "The Swift Programming Language",
                          isFork: false,
                          url: URL(string: "https://api.github.com/repos/apple/swift")!,
                          createdAt: "2015-10-23T21:15:07Z",
                          updatedAt: "2022-08-13T11:17:23Z",
                          pushedAt: "2022-08-13T14:13:56Z",
                          homepage: "https://swift.org",
                          size: 843960,
                          stargazersCount: 60300,
                          watchersCount: 60300,
                          language: "C++",
                          forksCount: 9688,
                          openIssuesCount: 6035,
                          defaultBranch: "main")
    }
}
