//
//  SystemImage.swift
//  UserDirectory
//
//  Created by Md Mazharul Islam on 14/9/25.
//

import SwiftUI

enum AppSystemImage: String {
    case eyeslash = "eye.slash.fill"
    case eyeFill = "eye.fill"
    case lock = "lock.fill"
    case envelope = "envelope"
    case message = "message.fill"
    case idCard = "person.fill"
    case  info = "info.circle.fill"
    var image: Image {
        Image(systemName: rawValue)
    }
}
