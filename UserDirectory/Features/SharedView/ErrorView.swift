//
//  ErrorView.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 15/9/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let color: Color
    let retryAction: (() -> Void)?
    init(message: String, color: Color = .yellow, retryAction: (() -> Void)? = nil) {
        self.message = message
        self.color = color
        self.retryAction = retryAction
    }
    var body: some View {
        VStack(spacing: Spacing.medium) {
            AppSystemImage.info.image
                .foregroundColor(.yellow)
                .font(Typography.body(.medium))
            Text(message)
                .foregroundColor(.gray)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            if let retry = retryAction {
                Button(action: retry) {
                    Text("Retry")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .padding(12)
    }
}

#Preview {
    VStack(spacing: 16) {
        ErrorView(message: "Network is slow. Please try again.") {
            print("Retry tapped")
        }
        ErrorView(message: "Failed to load data. Please check your internet connection.")
    }
    .padding()
}
