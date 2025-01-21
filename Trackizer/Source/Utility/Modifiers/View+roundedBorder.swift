//
//  View+roundedBorder.swift
//  SNBCommon
//
//

import SwiftUI

public extension View {
    func roundedBorder(
        cornerRadius: CGFloat = 10.0,
        backgroundColor: Color = Color.clear,
        borderColor: Color = Color.gray
    ) -> some View {
        background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(borderColor, lineWidth: 1)
            }
    }
}
