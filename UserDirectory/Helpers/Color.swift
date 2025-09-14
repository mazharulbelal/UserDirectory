//
//  Color.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

extension LinearGradient {
    static let primaryGradient = LinearGradient(
        colors: [Color.pink, Color.orange],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let primaryGradientBg = LinearGradient(
        gradient: Gradient(colors: [
            .indigo, .purple, .pink
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
extension Color {
    static let secondaryTextColor = Color("SecondaryTextColor")
    static let primaryTextColor = Color("PrimaryTextColor")
    static let appPrimaryColor = Color("AppPrimaryColor")
    static let errorColor = Color("ErrorColor")

}
