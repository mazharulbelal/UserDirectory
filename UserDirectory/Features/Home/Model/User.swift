//
//  User.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

// MARK: - Mock Data
struct User: Identifiable, Decodable, Hashable{
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let avatar: String
    var fullName: String { "\(firstName) \(lastName)" }
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case avatar
    }
}

struct UserResponse: Decodable {
    let data: [User]
}
