//
//  UserDirectoryApp.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

@main
struct UserDirectoryApp: App {
    @ObservedObject private var router = AuthFlowRouter()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPaths) {
                LoginView()
                    .navigationDestination(for: AuthFlow.self) { destination in
                        destination.destinationView
                    }
            }
            .environmentObject(router)
        }
    }
}
