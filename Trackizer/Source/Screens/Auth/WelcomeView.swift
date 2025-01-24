//
//  WelcomeView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 20/01/25.
//

import SwiftUI

struct WelcomeView: View {
    let coordinator: NavigationCoordinator
    var body: some View {
        NavigationView {
            ZStack{
                AppBackgroundView(useWelcomeBackground: true)
                VStack{
                    HeaderView(appLogo: DesignSystem.Images.headerLogo)
                    Spacer()
                    descriptionView.padding(.bottom,20)
                    bottomButtons
                }.padding()
            }
        }
    }
    
    //MARK: Description
    @ViewBuilder
    var descriptionView : some View {
        Text("Congue malesuada in ac justo, a tristique leo massa. Arcu leo leo urna risus.")
            .font(.body)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
    //MARK: - Bottom Buttons
    @ViewBuilder
    var bottomButtons : some View {
        VStack(spacing: 20){
            
            CustomButton(
                title: "Get started",
                icon: nil, // No icon
                backgroundColor: DesignSystem.Colors.orange,
                foregroundColor: .white,
                shadowColor: DesignSystem.Colors.orange
            ) {
                coordinator.push(SelectSignUpView(coordinator: coordinator))
            }
            
            CustomButton(
                title: "I have an account",
                icon: nil, // No icon
                backgroundColor: DesignSystem.Colors.white.opacity(0.10),
                foregroundColor: .white,
                shadowColor: DesignSystem.Colors.white.opacity(0.10)
            ) {
                coordinator.push(LoginView(coordinator: coordinator))
            }
            
        }
    }
}

#Preview {
    WelcomeView(coordinator: NavigationCoordinator())
}
