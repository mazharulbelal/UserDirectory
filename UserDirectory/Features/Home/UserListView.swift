//
//  UserListView.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject private var router: HomeFlowRouter
    var body: some View {
        ZStack {
            BackgroundView()
            List(mockUsers) { user in
                UserRow(user: user)
                    .padding(Spacing.small)
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        router.navigate(to: .userDetails(user: user))
                    }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Users")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {

                }) {
                    Text("Logout")
                        .font(Typography.body(.xLarge))
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
