//
//  SettingsView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 24/01/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var coordinator: NavigationCoordinator
    var body: some View {
        
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            ScrollView{
                VStack(spacing : 40) {
                    headerView
                }.padding()
                Spacer(minLength: 60)
            }
            
        }
    }
    
    //MARK: - Header View
    @ViewBuilder
    var headerView: some View {
        HeaderView(
            title: "Settings",
            showBackButton: true,
            backButtonAction: {
                print("Back button tapped")
                coordinator.pop()
            }
        )
    }
}

#Preview {
    SettingsView(coordinator: NavigationCoordinator())
}
