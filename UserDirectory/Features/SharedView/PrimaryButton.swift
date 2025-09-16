//
//  PrimaryButton.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//
import SwiftUI

struct PrimaryButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(Typography.body(.large))
            .fontWeight(.semibold)
            .kerning(0.5)
            .foregroundColor(.white)
            .padding(.vertical, Spacing.medium)
            .padding(.horizontal, Spacing.extraLarge)
            .frame(maxWidth: .infinity)
            .background(LinearGradient.primaryGradient)
            .clipShape(Capsule())
    }
}

#Preview {
    PrimaryButton(title: "Like")
        .padding()
}
