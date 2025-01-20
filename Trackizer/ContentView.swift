//
//  ContentView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 20/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.black)
            VStack(spacing: 16) {
                // Example 1: Apple Button
                CustomButton(
                    title: "Sign up with Apple",
                    icon: Image(systemName: "applelogo"),
                    backgroundColor: .black,
                    foregroundColor: .white,
                    shadowColor: .black
                ) {
                    print("Sign up with Apple tapped")
                }
                
                // Example 2: Google Button
                CustomButton(
                    title: "Sign up with Google",
                    icon: Image(systemName: "g.circle"), // Replace with a custom Google icon if needed
                    backgroundColor: .white,
                    foregroundColor: .black,
                    shadowColor: .gray
                ) {
                    print("Sign up with Google tapped")
                }
                
                // Example 3: Facebook Button
                CustomButton(
                    title: "Sign up with Facebook",
                    icon: Image(systemName: "f.circle"), // Replace with a custom Facebook icon if needed
                    backgroundColor: .blue,
                    foregroundColor: .white,
                    shadowColor: .blue
                ) {
                    print("Sign up with Facebook tapped")
                }
                
                // Example 4: Email Button
                CustomButton(
                    title: "Sign up with E-mail",
                    icon: nil, // No icon
                    backgroundColor: .orange,
                    foregroundColor: .white,
                    shadowColor: .orange
                ) {
                    print("Sign up with E-mail tapped")
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
