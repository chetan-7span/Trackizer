//
//  ErrorViewModifier.swift
//  RetailApp
//
//

import SwiftUI

private struct ErrorViewModifier: ViewModifier {

    var shouldShow: Bool
    var errorString: String
    var accessibilityId: String

    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
            if shouldShow {
                Text(errorString)
                    .foregroundColor(Color.red)
                    //.font(DesignSystem.Fonts.getFontWith(for: .regular, size: .basic))
                    .font(Font.preferredFontStyle(.footnote, .regular))
                    .accessibilityIdentifier(accessibilityId)
            }

        }
    }
}

public extension View {
    func error(shouldShow: Bool, text: String, accessibilityId: String) -> some View {
        modifier(ErrorViewModifier(shouldShow: shouldShow,
                                   errorString: text,
                                   accessibilityId: accessibilityId))
    }
}
