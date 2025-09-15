//
//  Router.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//
import Combine
import Foundation
import SwiftUI

protocol NavigationDestination {
    associatedtype Destination: View
    var title: String { get }
    @ViewBuilder
    var destinationView: Destination { get }
}

final class Router<Destination: NavigationDestination>: ObservableObject {
    @Published var navPaths: [Destination] = []
    @Published var root: RootFlow = .auth
    func navigate(to destination: Destination) {
        navPaths.append(destination)
    }
    enum RootFlow{
        case auth
        case home
    }
    func navigateBack() {
        guard !navPaths.isEmpty else { return }
        navPaths.removeLast()
    }
    func navigateToRoot() {
        navPaths.removeLast(navPaths.count)
    }
}

enum HomeFlow: NavigationDestination, Hashable {
    case userList
    case userDetails(user: User)
    var title: String {
        switch self {
        case .userList:
            return "First Screen - Overview of Music"
        case .userDetails:
            return "Second Screen - Explore Genres"
        }
    }
    var destinationView: some View {
        switch self {
        case .userList: UserListView()
        case .userDetails(let user): UserDetailsView(user: user)
        }
    }
}

enum AuthFlow: NavigationDestination {
    case login
    case createUser
    case recover
    var title: String {
        switch self {
        case .login:
            return "Login"
        case .createUser:
            return "Create Account"
        case .recover:
            return "Recover Password"
        }
    }
    var destinationView: some View {
        switch self {
        case .login: LoginView()
        case .createUser: CreateUserView()
        case .recover: RecoverView()
        }
    }
}

typealias HomeFlowRouter = Router<HomeFlow>
typealias AuthFlowRouter = Router<AuthFlow>
