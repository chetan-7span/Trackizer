//
//  LoginView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import SwiftUI

struct LoginView: View  {
    @ObservedObject var coordinator: NavigationCoordinator
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var isRememberMe: Bool = false
    var body: some View {
        ZStack{
            AppBackgroundView(useWelcomeBackground: false)
            VStack(spacing: 20) {
                HeaderView(appLogo: DesignSystem.Images.headerLogo)
                Spacer()
                inputFields
                remeberMeAndForgotPassword
                signInButton
                Spacer()
                bottomView
            }.padding()
        }
    }
    
    //MARK: - Password Inputfiled view
    @ViewBuilder
    var inputFields : some View {
        VStack(spacing: 20) {
            InputFieldView(text: $email, placeholder: "Email", errorMessage: .constant(""), title: "Email Address", accessibilityIdPrefix: "")
            PasswordInputFiled(text: $password, placeholder: "Password", title: "Password", accessibilityIdPrefix: "")
            
        }
    }
    
    //MARK: - Rember me and forgot password
    @ViewBuilder
    var remeberMeAndForgotPassword : some View {
        HStack(alignment: .center, spacing: 10) {
            (isRememberMe ? DesignSystem.Images.checkedBox : DesignSystem.Images.unCheckedBox)
                .resizable()
                .scaledToFit()
                .frame(width: 24,height: 24)
                .onTapGesture {
                    isRememberMe.toggle()
                }
            Text("Remember me")
                .font(.body)
                .foregroundColor(DesignSystem.Colors.grey50)
            Spacer()
            Text("Forgot Password?")
                .foregroundColor(DesignSystem.Colors.grey50)
                .onTapGesture {
                    print("Forgot Password Tapped")
                }
        }
    }
    
    //MARK: - Sign In Button
    @ViewBuilder
    var signInButton : some View {
        VStack(spacing: 20){
            CustomButton(
                title: "Sign In",
                icon: nil, // No icon
                backgroundColor: DesignSystem.Colors.orange,
                foregroundColor: .white,
                shadowColor: DesignSystem.Colors.orange
            ) {
                coordinator.push(CustomTabBar(coordinator: coordinator))
            }
        }.padding(.top)
    }
    //MARK: - Bottom view
    @ViewBuilder
    var bottomView : some View {
        VStack(spacing: 20){
            Text("If you don't have an account yet?")
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            CustomButton(
                title: "Sign Up",
                icon: nil, // No icon
                backgroundColor: DesignSystem.Colors.white.opacity(0.10),
                foregroundColor: .white,
                shadowColor: DesignSystem.Colors.white.opacity(0.10)
            ) {
                coordinator.push(SignUpView(coordinator: coordinator))
            }
            
        }
    }
}

#Preview {
    LoginView(coordinator: NavigationCoordinator())
}
