//
//  SignUpView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var coordinator: NavigationCoordinator
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var isRememberMe: Bool = false
    @State private var strengthLevel: Int = 0
    @State private var strengthColor: Color = .red
    
    var body: some View {
        ZStack{
            AppBackgroundView(useWelcomeBackground: false)
            VStack(spacing: 20) {
                HeaderLogoView()
                Spacer()
                inputFields
                passwordValidationView
                getStartedButton
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
                .onChange(of: password) { newValue in
                    evaluatePasswordStrength(password: newValue)
                }
        }
    }
    
    //MARK: - Password validation view
    @ViewBuilder
    var passwordValidationView : some View {
        VStack(alignment: .leading,spacing: 20) {
            // Rectangles to show strength
            HStack(spacing: 4) {
                ForEach(0..<4) { index in
                    Rectangle()
                        .fill(index < strengthLevel ? strengthColor : Color.gray.opacity(0.3))
                        .frame(height: 10)
                        .cornerRadius(2)
                }
            }
            .animation(.easeInOut, value: strengthLevel)
            Text("Use 8 or more characters with a mix of letters, numbers & symbols.")
                .foregroundColor(DesignSystem.Colors.grey50)
                .multilineTextAlignment(.leading)
        }.padding(.top)
    }
    
    //MARK: - Get started Button
    @ViewBuilder
    var getStartedButton : some View {
        VStack(spacing: 20){
            CustomButton(
                title: "Get started, it’s free!",
                icon: nil, // No icon
                backgroundColor: DesignSystem.Colors.orange,
                foregroundColor: .white,
                shadowColor: DesignSystem.Colors.orange
            ) {
                
            }
        }.padding(.top)
    }
    //MARK: - Bottom view
    @ViewBuilder
    var bottomView : some View {
        VStack(spacing: 20){
            Text("Do you have already an account?")
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            CustomButton(
                title: "Sign in",
                icon: nil, // No icon
                backgroundColor: DesignSystem.Colors.white.opacity(0.10),
                foregroundColor: .white,
                shadowColor: DesignSystem.Colors.white.opacity(0.10)
            ) {
                coordinator.push(LoginView())
            }
            
        }
    }
    
    //MARK: - Methods
    func evaluatePasswordStrength(password: String) {
        let lengthCriteria = password.count >= 8
        let uppercaseCriteria = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let lowercaseCriteria = password.rangeOfCharacter(from: .lowercaseLetters) != nil
        let numberCriteria = password.rangeOfCharacter(from: .decimalDigits) != nil
        let specialCharacterCriteria = password.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
        
        // Calculate strength level (0 to 4)
        var points = 0
        if lengthCriteria { points += 1 }
        if uppercaseCriteria { points += 1 }
        if numberCriteria { points += 1 }
        if specialCharacterCriteria { points += 1 }
        
        strengthLevel = points
        
        // Update color and description
        switch strengthLevel {
        case 4:
            strengthColor = .green
        case 3:
            strengthColor = .orange
        case 2:
            strengthColor = .yellow
        default:
            strengthColor = .red
        }
    }
}

#Preview {
    SignUpView(coordinator: NavigationCoordinator())
}
