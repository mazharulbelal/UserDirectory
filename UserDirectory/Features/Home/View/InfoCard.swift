//
//  InfoCard.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//
import SwiftUI

struct InfoCard: View {
    let icon: AppSystemImage
    let title: String
    let value: String
    let color: Color
    var body: some View {
        HStack {
            // MARK: - Colored side bar & icon
            ZStack {
                Rectangle()
                    .fill(color)
                    .frame(width: 5)
                    .cornerRadius(2.5)
                    .frame(height: 100)
                icon.image
                    .foregroundColor(color)
                    .font(.subheadline)
                    .frame(width: 28, height: 28)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .offset(x: 8)
            }
            // MARK: - Texts
            VStack(alignment: .leading, spacing: 1) {
                Text(title.uppercased())
                    .font(Typography.caption(.large))
                    .foregroundColor(.secondaryTextColor)
                    .tracking(0.5)
                Text(value)
                    .font(Typography.body(.large))
                    .fontWeight(.semibold)
                    .foregroundColor(.secondaryText)
            }
            .padding(.leading, 10)
            Spacer()
        }
        .padding(.vertical, Spacing.small)
        .padding(.trailing, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .animation(.easeOut(duration: 0.35), value: value)
    }
}
