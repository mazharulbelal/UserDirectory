//
//  RecoverView.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

struct RecoverView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack{
                Text("Reset your password")
                    .font(Typography.body(.xxLarge))
                    .foregroundColor(.primaryText)
            }
        }
    }
}

#Preview {
    RecoverView()
}
