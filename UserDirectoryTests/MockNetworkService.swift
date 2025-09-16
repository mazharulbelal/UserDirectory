//
//  MockNetworkService.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 16/9/25.
//

import Combine
@testable import UserDirectory
import XCTest

final class MockDataManager: DataManagerProtocol {
    private(set) var savedToken: String?
    private(set) var didDeleteToken = false
    func saveToken(_ token: String) { savedToken = token }
    func getToken() -> String? { savedToken }
    func hasValidToken() -> Bool { savedToken != nil && !savedToken!.isEmpty }
    func deleteToken() { didDeleteToken = true; savedToken = nil }
}

// MARK: - Mock Services
final class MockNetworkService: NetworkServiceProtocol {
    var shouldSucceed = true
    var response: Any = LoginResponse(token: "mock-token")
    var error: NetworkError = .serverError(code: 500, message: "Mock error")

    func request<T>(_ endpoint: APIEndpoint) -> AnyPublisher<T, NetworkError> where T : Decodable {
        if shouldSucceed {
            guard let casted = response as? T else {
                return Fail(error: NetworkError.decodingError(NSError()))
                    .eraseToAnyPublisher()
            }
            return Just(casted)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
