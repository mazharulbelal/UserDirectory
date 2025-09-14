//
//  FontSize.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

// MARK: - FontSize Enum

enum FontSize {
    case xSmall, small, medium, large, xLarge, xxLarge, xxxLarge
    case accessibility1, accessibility2, accessibility3, accessibility4, accessibility5
    var scaleFactor: CGFloat {
        switch self {
        case .xSmall: pow(0.7, 3)
        case .small: pow(0.7, 2)
        case .medium: 0.7
        case .large: 1
        case .xLarge: pow(1 / 0.8, 1)
        case .xxLarge: pow(1 / 0.8, 2)
        case .xxxLarge: pow(1 / 0.8, 3)
        case .accessibility1: pow(1 / 0.8, 4)
        case .accessibility2: pow(1 / 0.8, 5)
        case .accessibility3: pow(1 / 0.8, 6)
        case .accessibility4: pow(1 / 0.8, 7)
        case .accessibility5: pow(1 / 0.8, 8)
        }
    }
    func scaled(_ baseSize: CGFloat) -> CGFloat {
        baseSize * scaleFactor
    }
}

enum Typography {
    private static let isiPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    private static let baseHeading: CGFloat = isiPad ? 28 : 24
    private static let baseBody: CGFloat = isiPad ? 18 : 16
    private static let baseCaption: CGFloat = isiPad ? 14 : 12
    static func heading(_ size: FontSize = .large) -> Font {
        .system(size: size.scaled(baseHeading), weight: .semibold)
    }
    static func body(_ size: FontSize = .large) -> Font {
        .system(size: size.scaled(baseBody), weight: .regular)
    }
    static func caption(_ size: FontSize = .large) -> Font {
        .system(size: size.scaled(baseCaption), weight: .regular)
    }
}
