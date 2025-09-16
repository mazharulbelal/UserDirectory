//
//  AuthViewModelTests.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 16/9/25.
//

import Combine
import XCTest
@testable import UserDirectory

final class AuthViewModelTests: XCTestCase {
    private var authVM: AuthViewModel!
    private var network: MockNetworkService!
    private var dataManager: MockDataManager!
    private var cancellables = Set<AnyCancellable>()
    override func setUp() {
        super.setUp()
        network = MockNetworkService()
        dataManager = MockDataManager()
        authVM = AuthViewModel(network: network, dataManager: dataManager)
    }
    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }
    // MARK: - AuthViewModel
    func testLoginSuccess() {
        network.shouldSucceed = true
        network.response = LoginResponse(token: "abc123")
        let exp = expectation(description: "Login success")
        authVM.$loginState
            .dropFirst()
            .sink { state in
                if case let .success(resp) = state {
                    XCTAssertEqual(resp.token, "abc123")
                    XCTAssertEqual(self.dataManager.savedToken, "abc123")
                    exp.fulfill()
                }
            }
            .store(in: &cancellables)
        authVM.login(email: "a@b.com", password: "pass")
        wait(for: [exp], timeout: 1)
    }
    func testLoginFailure() {
        network.shouldSucceed = false
        network.error = .serverError(code: 401, message: "Unauthorized")
        let exp = expectation(description: "Login failure")
        authVM.$loginState.dropFirst()
            .sink { state in
                if case let .failure(msg) = state {
                    XCTAssertEqual(msg, "❌ Server error (401): Unauthorized")
                    XCTAssertNil(self.dataManager.savedToken)
                    exp.fulfill()
                }
            }
        .store(in: &cancellables)
        authVM.login(email: "wrong", password: "bad")
        wait(for: [exp], timeout: 1)
    }
    func testLogout() {
        dataManager.saveToken("temp")
        authVM.logout()
        XCTAssertTrue(dataManager.didDeleteToken)
        if case .idle = authVM.loginState { } else {
            XCTFail("Expected idle")
        }
    }
}
