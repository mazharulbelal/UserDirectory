//
//  NetworkError.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case serverError(code: Int, message: String)
    case decodingError(Error)
    case unknown(Error)
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "❌ Invalid URL"
        case .serverError(let code, let message):
            return "❌ Server error (\(code)): \(message)"
        case .decodingError(let error):
            return "❌ Decoding failed: \(error.localizedDescription)"
        case .unknown(let error):
            return "❌ Unknown error: \(error.localizedDescription)"
        }
    }
}
