//
//  APIService.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/06.
//

import Foundation

protocol APIService {
    func request<T: RequestProtocol>(_ request: T) async throws -> T.Response
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    // etc...
}

enum ParameterEncodingType {
    case url
    case json
    
    var contentType: String {
        switch self {
        case .url:
            return "application/x-www-form-urlencoded"
        case .json:
            return "application/json; charset=utf-8"
        }
    }
}

protocol RequestProtocol {
    associatedtype Response: APIResponse
    var baseURL: URL { get }
    var method: HttpMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    var parameters: [String: String] { get }
}

extension RequestProtocol {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var body: Data? {
        return nil
    }
    
    var parameters: [String: String] {
        return [:]
    }
}

protocol APIResponse: Decodable {
}

final class NoResponse: APIResponse {
}

// 共通処理
extension APIResponse {
}

extension RequestProtocol {
    func createHeders() -> [String: String] {
        var result: [String: String] = headers
        
        result["Accept"] = "application/json"
        
        
        return result
    }
}
