//
//  ClearTextButtonViewModifer.swift
//  RetailApp
//
//

import SwiftUI

private struct ClearTextButtonViewModifer: ViewModifier {

    struct Constants {
        static let contentTrailingPadding = 26.0
        static let horizontalPadding = 18.0
        static let hiddenOpacity = 0.0
        static let visibleOpacity = 1.0
    }

    @Binding var text: String
    var isFocused: Bool
    var accessibilityId: String

    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
                .padding(.trailing, Constants.contentTrailingPadding)
            HStack {
                Spacer()
                DesignSystem.Images.clearCircleFilledImage
                    .accessibilityIdentifier(accessibilityId)
                    .onTapGesture {
                        text.removeAll()
                    }
            }
            .padding(.horizontal, Constants.horizontalPadding)
            .opacity(isFocused && text.count > 0 ? Constants.visibleOpacity : Constants.hiddenOpacity)
        }
    }
}

public extension View {
    func clearTextButton(text: Binding<String>, isFocused: Bool, accessibilityId: String) -> some View {
        modifier(ClearTextButtonViewModifer(text: text,
                                            isFocused: isFocused,
                                            accessibilityId: accessibilityId))
    }
}

