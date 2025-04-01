//
//  CustomTabBar.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

import SwiftUI

struct CustomTabBar: View {
    @ObservedObject var coordinator: NavigationCoordinator
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, grid, add, calendar, wallet
    }
    
    var body: some View {
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            VStack{
                Spacer(minLength: 44)
                switch selectedTab {
                case .home:
                    HomeView(coordinator: coordinator)
                case .grid:
                    SpendingAndBudgetsView(coordinator: coordinator)
                case .calendar:
                    CalendarView(coordinator: coordinator)
                case .wallet:
                    CreditCardsView(coordinator: coordinator)
                case .add:
                    CreditCardsView(coordinator: coordinator)//AddView() // If you want a separate view for "Add"
                }
                Spacer()
                
                tabBar
                    .padding(.top,-80)
                    .padding(.bottom,30)
                
            }
        }.ignoresSafeArea()
    }
    
    //MARK: - Tab Bar
    @ViewBuilder
    var tabBar: some View {
        ZStack {
            DesignSystem.Images.tabbarBg
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .edgesIgnoringSafeArea(.all)
            HStack(spacing: 50) {
                HStack(spacing: 20) {
                    TabButton(icon: "house", isSelected: selectedTab == .home) {
                        selectedTab = .home
                    }
                    
                    TabButton(icon: "square.grid.2x2", isSelected: selectedTab == .grid) {
                        selectedTab = .grid
                    }
                }
                Spacer()
                HStack(spacing: 20) {
                    TabButton(icon: "calendar", isSelected: selectedTab == .calendar) {
                        selectedTab = .calendar
                    }
                    
                    TabButton(icon: "creditcard", isSelected: selectedTab == .wallet) {
                        selectedTab = .wallet
                    }
                }
            }
            .padding(.horizontal, 20)
            // Central Add Button
            Button(action: {
                // Add button action here
                coordinator.push(AddSubscriptionView(coordinator: coordinator))
            }) {
                ZStack {
                    Circle()
                        .fill(DesignSystem.Colors.orange)
                        .frame(width: 60, height: 60)
                        .shadow(color:DesignSystem.Colors.orange, radius: 8, x: 0, y: 5)
                    
                    Image(systemName: "plus")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .offset(y: -20) // Elevate above the tab bar
        }.background(.clear)
    }
}

struct TabButton: View {
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(isSelected ? DesignSystem.Colors.white : DesignSystem.Colors.grey30)
                .frame(maxWidth: .infinity)
        }
    }
}


#Preview {
    CustomTabBar(coordinator: NavigationCoordinator())
}
