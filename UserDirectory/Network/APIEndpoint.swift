//
//  APIEndpoint.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import Combine
import Foundation

// MARK: - API Endpoint Protocol
protocol APIEndpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem] { get }
}

extension APIEndpoint {
    var baseURL: String { "https://reqres.in/api" }
    var headers: [String: String] {
        [
            "Content-Type": "application/json",
            "x-api-key": "reqres-free-v1"
        ]
    }
    var queryItems: [URLQueryItem] { [] }
    var urlRequest: URLRequest? {
        var urlString = "\(baseURL)/\(path)"
        if !queryItems.isEmpty {
            var components = URLComponents(string: urlString)
            components?.queryItems = queryItems
            if let urlWithQuery = components?.url {
                urlString = urlWithQuery.absoluteString
            }
        }
        guard let url = URL(string: urlString) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        if let body = body {
            request.httpBody = try? JSONEncoder().encode(body)
        }
        return request
    }
}
