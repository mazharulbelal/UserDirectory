//
//  Endpoints.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import Foundation

enum LoadableState<Value> {
    case idle
    case loading
    case success(Value)
    case failure(String)
}

enum HTTPMethod: String {
    case GET, POST, PUT, PATCH, DELETE
}

enum Endpoint: APIEndpoint {
    case login(LoginRequest)
    case getUsers(page: Int)
    case getInfo(id: String)
    var path: String {
        switch self {
        case .login: return "login"
        case .getUsers: return "users"
        case .getInfo: return "dd"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .login: return .POST
        case .getUsers: return .GET
        default: return.GET
        }
    }
    var body: Encodable? {
        switch self {
        case .login(let req): return req
        case .getUsers: return nil
        default: return nil
        }
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case .getUsers(let page):
            return [URLQueryItem(name: "page", value: "\(page)")]
        default:
            return []
        }
    }
}
