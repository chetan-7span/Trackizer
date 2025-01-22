//
//  SelectSignUpView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import SwiftUI

struct SelectSignUpView: View {
    @ObservedObject var coordinator: NavigationCoordinator

    var body: some View {
        ZStack{
            AppBackgroundView(useWelcomeBackground: false)
            VStack{
                HeaderLogoView()
                Spacer()
                socialSignUpButtons
                Text("or").font(.title2).foregroundColor(.white).padding(.vertical, 30)
                signUpWithEmailView.padding(.bottom)
                descriptionView
            }.padding()
        }
    }
    
    //MARK:  Social signup buttons
    @ViewBuilder
    var socialSignUpButtons : some View {
        VStack(spacing: 20){
            // Apple Button
            CustomButton(
                title: "Sign up with Apple",
                icon: DesignSystem.Images.appleLogo,
                backgroundColor: .black,
                foregroundColor: .white,
                shadowColor: .black
            ) {
                print("Sign up with Apple tapped")
            }
            
            // Google Button
            CustomButton(
                title: "Sign up with Google",
                icon: DesignSystem.Images.googleLogo,
                backgroundColor: .white,
                foregroundColor: .black,
                shadowColor: .gray
            ) {
                print("Sign up with Google tapped")
            }
            
            // Facebook Button
            CustomButton(
                title: "Sign up with Facebook",
                icon: DesignSystem.Images.facebookLogo,
                backgroundColor: .blue,
                foregroundColor: .white,
                shadowColor: .blue
            ) {
                print("Sign up with Facebook tapped")
            }
        }
    }
    
    //MARK:  SignUpWithEmail
    @ViewBuilder
    var signUpWithEmailView : some View {
        CustomButton(
            title: "Sign up with E-mail",
            icon: nil,
            backgroundColor: DesignSystem.Colors.white.opacity(0.10),
            foregroundColor: DesignSystem.Colors.white,
            shadowColor: DesignSystem.Colors.white.opacity(0.10)
        ) {
            coordinator.push(SignUpView(coordinator: coordinator))
        }
    }
    //MARK: Description
    @ViewBuilder
    var descriptionView : some View {
        Text("By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.")
            .font(.body)
            .foregroundColor(DesignSystem.Colors.grey50)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    SelectSignUpView(coordinator: NavigationCoordinator())
}
