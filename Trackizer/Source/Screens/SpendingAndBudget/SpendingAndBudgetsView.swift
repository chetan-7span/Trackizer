//
//  SpendingAndBudgetsView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct SpendingAndBudgetsView: View {
    @ObservedObject var coordinator: NavigationCoordinator
    let categories = [
        (DesignSystem.Images.autoTransport, "Auto & Transport", 25.99, 400.0, Color.green),
        (DesignSystem.Images.entertainment, "Entertainment", 50.99, 600.0, Color.orange),
        (DesignSystem.Images.security, "Security", 5.99, 600.0, Color.purple)
    ]
    var body: some View {
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            VStack {
                headerView.padding(.bottom,20)
                
                BudgetProgressView(
                    budget: 2000,
                    progressSegments: [
                        (amount: 300, color: .mint),
                        (amount: 500, color: .orange),
                        (amount: 700, color: .purple)
                    ]
                )
                .padding(.bottom,-50)
                
                yourBudgetAreOnTrack
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(categories, id: \.1) { category in
                            CategoryRow(icon: category.0, title: category.1, spent: category.2, total: category.3, progressColor: category.4)
                        }
                    }
                    .padding(.vertical)
                }
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
    
    var yourBudgetAreOnTrack: some View {
        HStack{
            Text("Your budgets are on track  👍")
                .padding()
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(DesignSystem.Colors.white)
        }
        .frame(maxWidth:.infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(DesignSystem.Colors.grey50, lineWidth: 1)
                .foregroundColor(DesignSystem.Colors.grey30)
        )
        
    }
    
}

#Preview {
    SpendingAndBudgetsView(coordinator: NavigationCoordinator())
}
