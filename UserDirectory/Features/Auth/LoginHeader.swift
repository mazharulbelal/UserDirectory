//
//  LoginHeader.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct LoginHeader: View {
    var body: some View {
        VStack(spacing: Spacing.extraSmall) {
            Text("Welcome Back")
                .font(Typography.heading(.xxLarge))
                .foregroundColor(.white)
            Text("Sign in to continue")
                .font(Typography.body(.large))
                .foregroundColor(.white.opacity(0.8))
        }
    }
}
