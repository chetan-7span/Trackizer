//
//  TitleViewModifier.swift
//  RetailApp
//
//

import SwiftUI

private struct TitleViewModifier: ViewModifier {

    struct Constants {
        static let verticalSpacing = 8.0
        static let lineSpacing = 5.0
    }

    var title: String
    var accessibilityId: String

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineSpacing(Constants.lineSpacing)
                .foregroundColor(DesignSystem.Colors.grey50)
                .font(Font.preferredFontStyle(.body, .medium))
                .accessibilityIdentifier(accessibilityId)
            content
        }
    }
}

public extension View {
    func title(text: String, accessibilityId: String) -> some View {
        modifier(TitleViewModifier(title: text, accessibilityId: accessibilityId))
    }
}
