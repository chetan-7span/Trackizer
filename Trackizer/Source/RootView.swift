//
//  RootView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        WelcomeView(coordinator: coordinator)
    }
}

struct CustomView: View {
    var body: some View {
        ZStack {
            // Background color for the card
            Color.black
                .cornerRadius(15)
            
            // Text
            Text("Active subs\n12")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.headline)
        }
        .frame(width: 120, height: 80) // Set the size of the card
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .trim(from: 0, to: 1)  // Create the partial border effect
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [DesignSystem.Colors.grey50, .clear]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                )
                .rotationEffect(.degrees(0)) // Rotate for the diagonal effect
        )
    }
}

#Preview{
    CustomView()
}
