//
//  GradientTrimOverlay.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 18/02/25.
//

import SwiftUI

import SwiftUI

// Custom Modifier for the overlay
struct GradientTrimOverlay: ViewModifier {
    var cornerRadius: CGFloat = 15
    var startPoint: UnitPoint = .topLeading
    var endPoint: UnitPoint = .bottomTrailing

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .trim(from: 0, to: 1)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [DesignSystem.Colors.grey50, .clear]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
    }
}

// Extension to make applying the modifier easier
extension View {
    func gradientTrimOverlay(cornerRadius: CGFloat = 15,
                              startPoint: UnitPoint = .topLeading,
                              endPoint: UnitPoint = .bottomTrailing,
                              trimStart: CGFloat = 0,
                              trimEnd: CGFloat = 0.685) -> some View {
        self.modifier(GradientTrimOverlay(
            cornerRadius: cornerRadius,
            startPoint: startPoint,
            endPoint: endPoint
        ))
    }
}

