//
//  UserRow.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//
import SwiftUI

struct UserRow: View {
    let user: User
    @State private var isVisible = false
    var body: some View {
        HStack(spacing: 12) {
            ImageView(imageString: user.avatar)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white.opacity(0.8), lineWidth: 2))
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullName)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 80)
        .padding()
        .background(
            LinearGradient(
                colors: [Color.white, Color.black.opacity(0.2)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedCorner(radius: 16, corners: [.topLeft, .bottomRight]))
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
        )
        .opacity(isVisible ? 1 : 0)
        .offset(y: isVisible ? 0 : 15)
        .onAppear {
            withAnimation(.easeOut(duration: 0.4)) { isVisible = true }
        }
    }
}
