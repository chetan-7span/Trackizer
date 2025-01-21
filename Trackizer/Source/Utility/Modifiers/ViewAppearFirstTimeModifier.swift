//
//  ViewAppearFirstTimeModifier.swift
//  FB
//
//

import SwiftUI

struct ViewAppearFirstTimeModifier: ViewModifier {
    @State private var didAppearFirstTime = false
    private let action: (() -> Void)?
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didAppearFirstTime == false {
                didAppearFirstTime = true
                action?()
            }
        }
    }
}

public extension View {
    func onFirstAppear(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewAppearFirstTimeModifier(perform: action))
    }
}
