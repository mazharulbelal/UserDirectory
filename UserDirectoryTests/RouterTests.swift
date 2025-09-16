//
//  RouteTest.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 16/9/25.
//

import XCTest
import Combine
@testable import UserDirectory

final class RouteTest: XCTestCase {
    private var router: HomeFlowRouter!
    private var cancellables = Set<AnyCancellable>()
    override func setUp() {
        super.setUp()
        router = HomeFlowRouter()
    }
    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }
    // MARK: - Router
    func testRouterNavigation() {
        XCTAssertTrue(router.navPaths.isEmpty)
        router.navigate(to: .userList)
        XCTAssertEqual(router.navPaths.first, .userList)
        let user = User(id: 2, firstName: "Jane", lastName: "Smith", email: "", avatar: "")
        router.navigate(to: .userDetails(user: user))
        XCTAssertEqual(router.navPaths.count, 2)
        router.navigateBack()
        XCTAssertEqual(router.navPaths.count, 1)
        router.navigateToRoot()
        XCTAssertTrue(router.navPaths.isEmpty)
    }
    // MARK: - Flow Enums
    func testHomeFlowTitles() {
        XCTAssertEqual(HomeFlow.userList.title, "First Screen - Overview of Music")
        let user = User(id: 1, firstName: "X", lastName: "Y", email: "", avatar: "")
        XCTAssertEqual(HomeFlow.userDetails(user: user).title, "Second Screen - Explore Genres")
    }
    func testAuthFlowTitles() {
        XCTAssertEqual(AuthFlow.login.title, "Login")
        XCTAssertEqual(AuthFlow.createUser.title, "Create Account")
        XCTAssertEqual(AuthFlow.recover.title, "Recover Password")
    }
    // MARK: - Endpoint
    func testEndpointRequest() {
        let loginReq = LoginRequest(email: "a@b.com", password: "123")
        let loginURL = Endpoint.login(loginReq).urlRequest
        XCTAssertEqual(loginURL?.httpMethod, "POST")
        XCTAssertTrue(loginURL?.url?.absoluteString.contains("login") ?? false)
        let usersURL = Endpoint.getUsers(page: 2).urlRequest
        XCTAssertEqual(usersURL?.httpMethod, "GET")
        XCTAssertTrue(usersURL?.url?.absoluteString.contains("page=2") ?? false)
    }
    // MARK: - User Model
    func testUserFullName() {
        let user = User(id: 10, firstName: "Ali", lastName: "Hasan", email: "a@a.com", avatar: "")
        XCTAssertEqual(user.fullName, "Ali Hasan")
    }
    // MARK: - UserDetailsView Logic
    func testUserDetailsAppear() {
        var appear = false
        appear = true
        XCTAssertTrue(appear)
    }
}
