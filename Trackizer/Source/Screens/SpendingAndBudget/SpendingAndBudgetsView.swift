//
//  SpendingAndBudgetsView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct SpendingAndBudgetsView: View {
    @ObservedObject var coordinator: NavigationCoordinator
    var body: some View {
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            VStack {
                headerView.padding(.bottom,20)
                
                BudgetProgressView(
                    budget: 2000,
                    progressSegments: [
                        (amount: 1000, color: .mint),
                        (amount: 500, color: .orange),
                        (amount: 500, color: .purple)
                    ]
                )
                Spacer()
            }.padding()
        }
    }
    
    //MARK: - Header View
    @ViewBuilder
    var headerView: some View {
        HeaderView(
            title: "Spending & Budgets",
            showSettingsButton: true,
            settingsAction: {
                print("Settings button tapped")
                coordinator.push(SettingsView(coordinator: coordinator))
            }
        )
    }
}

#Preview {
    SpendingAndBudgetsView(coordinator: NavigationCoordinator())
}
