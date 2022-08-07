//
//  APIError.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/07.
//

import Foundation

enum APIError: Error {
    case noData(HTTPURLResponse)
    case noResponse
    case unacceptableStatusCode(Int, Message?)
    case failedToCreateComponents(URL)
    case failedToCreateURL(URLComponents)
}

extension APIError {
    struct Message: Decodable {
        let documentationURL: URL
        let message: String

        enum CodingKeys: String, CodingKey {
            case documentationURL = "documentation_url"
            case message
        }
    }
}
