//
//  NetworkServicing.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import Combine
import Foundation

protocol NetworkServicing {
    func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, NetworkError>
}

final class NetworkService: NetworkServicing {
    func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, NetworkError> {
        guard let request = endpoint.urlRequest else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse else {
                    throw NetworkError.unknown(URLError(.badServerResponse))
                }
                guard (200...299).contains(httpResponse.statusCode) else {
                    let message = String(data: output.data, encoding: .utf8) ?? "No message"
                    throw NetworkError.serverError(code: httpResponse.statusCode, message: message)
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError(NetworkError.map)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}



