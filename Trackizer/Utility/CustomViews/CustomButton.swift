//
//  CustomButton.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 20/01/25.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let icon: Image? // Optional icon
    let backgroundColor: Color
    let foregroundColor: Color
    let shadowColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                // Add the icon if provided
                if let icon = icon {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(foregroundColor)
                }
                Text(title)
                    .font(.headline)
                    .foregroundColor(foregroundColor)
                    .padding(.horizontal, icon != nil ? 8 : 0) // Add spacing if icon exists
            }
            .padding()
            .frame(maxWidth: .infinity) // Make the button full width
            .background(backgroundColor)
            .clipShape(Capsule())
            .shadow(color: shadowColor.opacity(0.8), radius: 12, x: 0, y: 4) // Add shadow effect
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CustomButton(
        title: "Sign up with E-mail",
        icon: nil, // No icon
        backgroundColor: DesignSystem.Colors.orange,
        foregroundColor: .white,
        shadowColor: .orange
    ) {
        print("Sign up with E-mail tapped")
    }
}
