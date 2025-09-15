//
//  CreateUserView.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct CreateUserView: View {
        var body: some View {
            ZStack {
                BackgroundView()
                VStack{
                    Text("Create a user account")
                        .font(Typography.body(.xxLarge))
                        .foregroundColor(.primaryText)
                }
            }
        }
    }

#Preview {
    CreateUserView()
}
