//
//  WelcomeView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 20/01/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack{
                backgrundView
                VStack(spacing: 20) {
                    logoView.padding(.top,50)
                    Spacer()
                    bottomButtons
                }
                .padding()
            }

        }
    }
    
    //MARK: - Background view
    @ViewBuilder
    var backgrundView : some View {
        Image("WelcomeBg")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
    
    //MARK: - Logo view
    @ViewBuilder
    var logoView : some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 30)
    }
    
    //MARK: - Bottom Buttons
    @ViewBuilder
    var bottomButtons : some View {
        CustomButton(
            title: "Get started",
            icon: nil, // No icon
            backgroundColor: DesignSystem.Colors.orange,
            foregroundColor: .white,
            shadowColor: DesignSystem.Colors.orange
        ) {
            print("Get started tapped")
        }
        .padding(.bottom,50)
    }
}

#Preview {
    WelcomeView()
}
