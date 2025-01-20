//
//  DesignSystem+Color.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 20/01/25.
//

import Foundation
import UIKit
import SwiftUI
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
    
        let r, g, b, a: UInt64
        switch hex.count {
        case 6: // RGB (6 characters)
            (r, g, b, a) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8: // ARGB (8 characters)
            (r, g, b, a) = (int >> 24 & 0xFF, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }
    
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
public struct DesignSystem {
    public struct Colors {
        static let orange = Color(hex: "#FF7966")
        static let fbBg = Color(hex: "#1771E6")
    }
}
