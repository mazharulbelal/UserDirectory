//
//  UserDetailsView.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    @State private var appear = false
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: Spacing.large) {
                // MARK: - Avatar
                ImageView(imageString: user.avatar)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 3))
                    .shadow(radius: 8)
                    .scaleEffect(appear ? 1 : 0.8)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: appear)
                // MARK: - Name
                Text("ddd")
                    .font(Typography.heading(.xxLarge))
                    .fontWeight(.semibold)
                    .foregroundColor(.primaryTextColor)
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 20)
                    .animation(.easeOut(duration: 0.5).delay(0.1), value: appear)
                // MARK: - Email
                VStack(spacing: Spacing.small) {
                    InfoCard(icon: .idCard, title: "User ID", value: user.id.description, color: .purple)
                    InfoCard(icon: .envelope, title: "Email", value: user.email, color: .blue)
                }
                .padding(.horizontal, Spacing.pageHorizontalPadding)

                .opacity(appear ? 1 : 0)
                .offset(y: appear ? 0 : 20)
                .animation(.easeOut(duration: 0.5).delay(0.3), value: appear)
                Spacer()
            }
            .padding(.top, 80)
            .padding(.horizontal, Spacing.pageHorizontalPadding)
        }
        .onAppear { appear = true }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    UserDetailsView(user: mockUsers.first!)
//}
