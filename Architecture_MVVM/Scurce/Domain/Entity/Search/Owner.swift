//
//  Owner.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/07.
//

import Foundation

struct Owner: Decodable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: URL
    let gravatarID: String
    let url: URL
    let receivedEventsURL: URL
    let type: String

    private enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case receivedEventsURL = "received_events_url"
        case type
    }
}
