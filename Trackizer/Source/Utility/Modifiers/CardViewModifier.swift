//
//  CardViewModifier.swift
//  FB
//
//

import SwiftUI

struct CardViewModifier: ViewModifier {
    var cornerRadius: CGFloat
    var backgroundColor: Color
    var hasShadow: Bool
    var shadowColor: Color
    var shadowRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(
                color: hasShadow ? shadowColor : .clear,
                radius: hasShadow ? shadowRadius : 0.0,
                x: 0,
                y: 0
            )
    }
}

extension View {
    func cardStyle(cornerRadius: CGFloat = 0,
                   backgroundColor: Color = .clear,
                   hasShadow: Bool = false,
                   shadowColor: Color = .clear,
                   shadowRadius: CGFloat = 0) -> some View {
        modifier(CardViewModifier(cornerRadius: cornerRadius,
                                  backgroundColor: backgroundColor,
                                  hasShadow: hasShadow,
                                  shadowColor: shadowColor,
                                  shadowRadius: shadowRadius))
    }
}
