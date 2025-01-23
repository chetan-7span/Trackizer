//
//  AppBackgroundView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import SwiftUI

struct AppBackgroundView: View {
    // Boolean to toggle between backgrounds
    var useWelcomeBackground: Bool
    
    var body: some View {
        if useWelcomeBackground {
            welcomeBackgroundView
        } else {
            backgroundView
        }
    }
    
    //MARK: - Background view
    @ViewBuilder
    var backgroundView : some View {
        ZStack{
            Color(DesignSystem.Colors.appBg)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    //MARK: - Welcome Background view
    @ViewBuilder
    var welcomeBackgroundView : some View {
        Image("WelcomeBg")
            .resizable()
//            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    AppBackgroundView(useWelcomeBackground: false)
}
