//
//  Extension.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 15/9/25.
//
import Combine
import Foundation

extension NetworkError {
    static func map(_ error: Error) -> NetworkError {
        if let networkError = error as? NetworkError { return networkError }
        if let decodingError = error as? DecodingError { return .decodingError(decodingError) }
        return .unknown(error)
    }
}

extension Publisher {
    func handleState<Value: AnyObject>(
        _ keyPath: ReferenceWritableKeyPath<Value, LoadableState<Output>>,
        on object: Value,
        onSuccess: ((Output) -> Void)? = nil
    ) -> AnyCancellable where Failure: Error {

        object[keyPath: keyPath] = .loading
        return self
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    let message: String
                    if let networkError = error as? NetworkError {
                        message = networkError.errorDescription ?? "Unknown error"
                    } else {
                        message = error.localizedDescription
                    }
                    object[keyPath: keyPath] = .failure(message)
                }
            } receiveValue: { value in
                onSuccess?(value)
                object[keyPath: keyPath] = .success(value)
        }
    }
}
