//
//  EmailTextField.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        HStack {
            AppSystemImage.envelope.image
                .foregroundColor(.gray)
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
        }
        .padding()
        .background(.white.opacity(0.9))
        .cornerRadius(16)
        .shadow(radius: 3)
    }
}
