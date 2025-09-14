//
//  ImageView.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct ImageView: View {
    var imageString: String?
    var body: some View {
        AsyncImage(url: URL(string: imageString ?? "")) { phase in
            switch phase {
            case .empty:
                ShimmerView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(8)
            case .failure:
                ShimmerView()
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct ShimmerView: View {
    @State private var phase: CGFloat = 0
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient(
                gradient: Gradient(colors: [.gray.opacity(0.3), .gray.opacity(0.1), .gray.opacity(0.3)]),
                startPoint: .leading,
                endPoint: .trailing
            ))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .mask(
                RoundedRectangle(cornerRadius: 8)
            )
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}
