//
//  User.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

// MARK: - Mock Data
struct User: Identifiable {
    let id: Int
    let fullName: String
    let email: String
    let avatar: String
}

let mockUsers: [User] = [
    .init(id: 1, fullName: "George Bluth", email: "george.bluth@reqres.in", avatar: "https://reqres.in/img/faces/1-image.jpg"),
    .init(id: 2, fullName: "Janet Weaver", email: "janet.weaver@reqres.in", avatar: "https://reqres.in/img/faces/2-image.jpg"),
    .init(id: 3, fullName: "Emma Wong", email: "emma.wong@reqres.in", avatar: "https://reqres.in/img/faces/3-image.jpg"),
    .init(id: 4, fullName: "Eve Holt", email: "eve.holt@reqres.in", avatar: "https://reqres.in/img/faces/4-image.jpg")
]
