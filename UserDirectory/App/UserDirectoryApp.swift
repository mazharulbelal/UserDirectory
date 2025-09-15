//
//  UserDirectoryApp.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

@main
struct UserDirectoryApp: App {
    
    @ObservedObject private var authRouter = AuthFlowRouter()
    @ObservedObject private var homeRouter = HomeFlowRouter()
    @StateObject private var dataManager = DataManager.shared
    
    private func auth() -> some View {
        NavigationStack(path: $authRouter.navPaths) {
            LoginView()
                .navigationDestination(for: AuthFlow.self) { $0.destinationView }
        }
        .environmentObject(authRouter)
    }
    
    private func home() -> some View {
        NavigationStack(path: $homeRouter.navPaths) {
            UserListView()
                .navigationDestination(for: HomeFlow.self) { $0.destinationView }
        }
        .environmentObject(homeRouter)
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                if dataManager.hasValidToken() {
                    home()
                } else {
                    auth()
                }
            }
            .animation(.smooth, value: dataManager.token)
        }
    }
}
