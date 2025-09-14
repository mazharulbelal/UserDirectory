//
//  PasswordTextField.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String
    @Binding var isVisible: Bool
    var body: some View {
        HStack {
            AppSystemImage.lock.image
                .foregroundColor(.gray)
            Group {
                if isVisible {
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
                }
            }
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isVisible.toggle()
                }
            }) {
                (isVisible ? AppSystemImage.eyeslash.image : AppSystemImage.eyeFill.image)
                    .foregroundColor(isVisible ? .red : .gray)
            }
        }
        .padding()
        .background(.white.opacity(0.9))
        .cornerRadius(16)
        .shadow(radius: 3)
    }
}
