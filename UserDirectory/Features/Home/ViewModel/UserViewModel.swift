//
//  UserViewModel.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 15/9/25.
//

import Combine
import Foundation

final class UserViewModel: ObservableObject {
    private let network: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published var usersState: LoadableState<UserResponse> = .idle
    init(network: NetworkServiceProtocol = NetworkService()) {
        self.network = network
    }
    func getUser() {
        network.request(Endpoint.getUsers(page: 1))
            .handleState(\.usersState, on: self)
            .store(in: &cancellables)
    }
}
