//
//  BackgroundImageViewModifier.swift
//  FB
//
//

import SwiftUI

struct BackgroundImageViewModifier: ViewModifier {
    let image: Image?

    func body(content: Content) -> some View {
        if let image = image {
            content
                .background(image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                )
        } else {
            content
        }
    }
}

extension View {
    func backgroundImageStyle(image: Image? = nil) -> some View {
        modifier(BackgroundImageViewModifier(image: image))
    }
}
