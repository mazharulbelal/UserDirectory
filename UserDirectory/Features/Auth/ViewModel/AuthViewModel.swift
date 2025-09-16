//
//  AuthViewModel.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//
import Combine
import Foundation

final class AuthViewModel: ObservableObject {
    private let network: NetworkServicing
    private let dataManager: DataManagerProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published var loginState: LoadableState<LoginResponse> = .idle
    init(network: NetworkServicing = NetworkService(),
         dataManager: DataManagerProtocol = DataManager.shared) {
        self.network = network
        self.dataManager = dataManager
    }
    func login(email: String, password: String) {
        let request = LoginRequest(email: email, password: password)
        network.request(Endpoint.login(request))
            .handleState(\.loginState, on: self) { [weak self] response in
                self?.dataManager.saveToken(response.token)
            }
            .store(in: &cancellables)
    }
    func logout() {
        dataManager.deleteToken()
        loginState = .idle
    }
}
