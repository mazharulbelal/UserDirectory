//
//  LoginModel.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 15/9/25.
//
import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct LoginResponse: Decodable {
    let token: String
}
