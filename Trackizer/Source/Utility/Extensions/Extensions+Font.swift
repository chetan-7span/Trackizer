//
//  Extensions+Font.swift
//  BNPL
//
//

import SwiftUI

public extension Font {
    static func preferredFontStyle(_ style: UIFont.TextStyle, _ weight: UIFont.Weight) -> Font {
        let uiFont = UIFont.preferredFont(forTextStyle: style)
        let descriptor = uiFont.fontDescriptor.addingAttributes([
            .traits: [UIFontDescriptor.TraitKey.weight: weight]
        ])
        let customUIFont = UIFont(descriptor: descriptor, size: uiFont.pointSize)
        return Font(customUIFont)
    }
}
