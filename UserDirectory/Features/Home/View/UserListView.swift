//
//  UserListView.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject private var router: HomeFlowRouter
    @StateObject private var viewModel = UserViewModel()
    var body: some View {
        ZStack {
            BackgroundView()
            switch viewModel.usersState {
            case .idle:
                ErrorView(message: "No user available")
            case .loading:
                Loader(message: "Fetching users..")
            case .success(let value):
                List(value.data) { user in
                    UserRow(user: user)
                        .padding(Spacing.small)
                        .listRowBackground(Color.clear)
                        .onTapGesture {
                            router.navigate(to: .userDetails(user: user))
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    viewModel.getUser()
                }
            case .failure(let message):
                ErrorView(message: message)
            }
        }
        .onAppear () {
            viewModel.getUser()
        }
        .navigationTitle("Users")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    DataManager.shared.deleteToken()
                    router.navPaths.removeAll()
                }) {
                    Text("Logout")
                        .font(Typography.body(.medium))
                        .padding(Spacing.small)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        UserListView()
    }
}
