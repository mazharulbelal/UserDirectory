//
//  LoginView.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct LoginView: View {
    @State private var isPasswordVisible = false
    @State private var isLoading = false
    @EnvironmentObject private var router: AuthFlowRouter
    @StateObject private var repo = AuthViewModel()
    @State private var email: String = "eve.holt@reqres.in"
    @State private var password: String = "cityslicka"
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: Spacing.medium) {
                LoginHeader()
                EmailTextField(email: $email)
                PasswordTextField(password: $password, isVisible: $isPasswordVisible)
                switch repo.loginState {
                case .idle:
                    PrimaryButton(title: "Login")
                        .onTapGesture {
                            repo.login(email: email, password: password)
                        }
                case .failure(let error):
                    ErrorView(message: error) {
                        repo.login(email: email, password: password)
                    }
                    .padding()
                case .loading:
                   Loader()
                case .success(_):
                    Loader(message: "Logging you in…")
                }
                forgotPasswordButton()
                Spacer()
                createAccountSection()
            }
            .padding(.horizontal, Spacing.pageHorizontalPadding)
            .padding(.top, Spacing.pageTopPadding)
        }
    }
    @ViewBuilder
    func forgotPasswordButton() -> some View {
        Button(action: {
            router.navigate(to: .recover)
        }) {
            Text("Forgot Password?")
                .font(Typography.body(.large))
                .foregroundColor(.primaryTextColor.opacity(0.8))
        }
        .padding(.top, Spacing.small)
    }
    @ViewBuilder
    func createAccountSection() -> some View {
        HStack {
            Text("Don't have an account?")
                .foregroundColor(.primaryTextColor.opacity(0.8))
                .font(.footnote)
            Button(action: {
                router.navigate(to: .createUser)
            }) {
                Text("Create Account")
                    .foregroundColor(.primaryTextColor)
                    .font(Typography.body(.large))
            }
        }
        .padding(.bottom, Spacing.medium)
    }
}

#Preview {
    LoginView()
}
