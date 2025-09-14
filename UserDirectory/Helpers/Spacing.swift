//
//  Spacing.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

enum Spacing {
    // MARK: - Base Unit (Figma to iOS point scaling)
    private static var scaleFactor: CGFloat {
#if os(iOS)
    return UIDevice.current.userInterfaceIdiom == .pad ? 1.5 : 1.0
#else
    return 1.0
#endif
    }
    // MARK: - Spacing Tokens (Semantic naming)
    static var extraExtraSmall: CGFloat { 4 * scaleFactor }
    static var extraSmall: CGFloat { 8 * scaleFactor }
    static var small: CGFloat { 12 * scaleFactor }
    static var medium: CGFloat { 16 * scaleFactor }
    static var large: CGFloat { 24 * scaleFactor }
    static var extraLarge: CGFloat { 32 * scaleFactor }
    static var extraExtraLarge: CGFloat { 40 * scaleFactor }
    // MARK: - Layout Semantics
    static var pageHorizontalPadding: CGFloat { 20 * scaleFactor }
    static var sectionVerticalSpacing: CGFloat { 32 * scaleFactor }
    static var elementSpacing: CGFloat { 12 * scaleFactor }
    static var pageTopPadding: CGFloat { 80 * scaleFactor }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = 16
    var corners: UIRectCorner = [.topLeft, .bottomRight]

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
