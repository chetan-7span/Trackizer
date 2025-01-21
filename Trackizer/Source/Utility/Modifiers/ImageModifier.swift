//
//  ImageModifier.swift
//  FB
//
//
import Foundation
import UIKit
import SwiftUI

struct ImageModifier: ViewModifier {
    var size: CGSize
    var cornerRadius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: size.width, height: size.height)
            //.cornerRadius(cornerRadius, corners: corners)
    }
}

extension View {
    func imageStyle(size: CGSize,
                    cornerRadius: CGFloat = 0,
                    corners: UIRectCorner = .allCorners) -> some View {
        modifier(ImageModifier(size: size,
                               cornerRadius: cornerRadius,
                               corners: corners))
    }
}

