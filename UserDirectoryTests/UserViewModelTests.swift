//
//  UserViewModelTests..swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 16/9/25.
//

import Combine
@testable import UserDirectory
import XCTest

// MARK: - Full Coverage Tests
final class UserViewModelTests: XCTestCase {
    private var userVM: UserViewModel!
    private var network: MockNetworkService!
    private var dataManager: MockDataManager!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        network = MockNetworkService()
        dataManager = MockDataManager()
        userVM = UserViewModel(network: network)
    }
    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }
    // MARK: - UserViewModel
    func testGetUsersSuccess() {
        let user = User(id: 1, firstName: "John", lastName: "Doe", email: "j@x.com", avatar: "")
        network.shouldSucceed = true
        network.response = UserResponse(data: [user])
        let exp = expectation(description: "Users success")
        userVM.$usersState.dropFirst().sink { state in
            if case let .success(resp) = state {
                XCTAssertEqual(resp.data.first?.fullName, "John Doe")
                exp.fulfill()
            }
        }.store(in: &cancellables)
        userVM.getUser()
        wait(for: [exp], timeout: 1)
    }
    func testGetUsersFailure() {
        network.shouldSucceed = false
        network.error = .serverError(code: 404, message: "Not Found")
        let exp = expectation(description: "Users failure")
        userVM.$usersState.dropFirst().sink { state in
            if case let .failure(msg) = state {
                XCTAssertEqual(msg, "❌ Server error (404): Not Found")
                exp.fulfill()
            }
        }.store(in: &cancellables)
        userVM.getUser()
        wait(for: [exp], timeout: 1)
    }
}
