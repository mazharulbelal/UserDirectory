//
//  DataManager.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 15/9/25.
//

import Combine
import Foundation
import Security

protocol DataManagerProtocol {
    func saveToken(_ token: String)
    func getToken() -> String?
    func hasValidToken() -> Bool
    func deleteToken()
}
final class DataManager: DataManagerProtocol, ObservableObject {
    static let shared = DataManager()
    @Published private(set) var token: String? = nil
    private let tokenKey = "userToken"
    private init() {
        token = getToken()
    }
    func saveToken(_ token: String) {
        let data = Data(token.utf8)
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: tokenKey,
            kSecValueData as String: data
        ]
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
        self.token = token
    }
    func getToken() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: tokenKey,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status == errSecSuccess,
              let data = item as? Data,
              let token = String(data: data, encoding: .utf8) else { return nil }
        return token
    }
    func hasValidToken() -> Bool {
        guard let token = token else { return false }
        return !token.isEmpty
    }
    func deleteToken() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: tokenKey
        ]
        SecItemDelete(query as CFDictionary)
        // Update published token for runtime route change
        self.token = nil
    }
}
