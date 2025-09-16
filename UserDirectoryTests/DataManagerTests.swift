//
//  DataManagerTests.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 16/9/25.
//


@testable import UserDirectory
import XCTest

final class DataManagerTests: XCTestCase {
    private var dataManager: DataManager!
    override func setUp() {
        super.setUp()
        dataManager = DataManager.shared
        dataManager.deleteToken()
    }
    override func tearDown() {
        dataManager.deleteToken()
        super.tearDown()
    }
    func testSaveAndGetToken() {
        dataManager.saveToken("abc123")
        XCTAssertEqual(dataManager.getToken(), "abc123")
    }
    func testGetTokenWhenEmpty() {
        dataManager.deleteToken()
        XCTAssertNil(dataManager.getToken())
    }
    func testHasValidTokenTrue() {
        dataManager.saveToken("valid")
        XCTAssertTrue(dataManager.hasValidToken())
    }
    func testHasValidTokenFalseWhenNil() {
        dataManager.deleteToken()
        XCTAssertFalse(dataManager.hasValidToken())
    }
    func testHasValidTokenFalseWhenEmpty() {
        dataManager.saveToken("")
        XCTAssertFalse(dataManager.hasValidToken())
    }
    func testDeleteToken() {
        dataManager.saveToken("toDelete")
        dataManager.deleteToken()
        XCTAssertNil(dataManager.getToken())
    }
    func testDeleteTokenWhenAlreadyEmpty() {
        dataManager.deleteToken()
        XCTAssertNil(dataManager.getToken())
    }
}

