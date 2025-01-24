//
//  CalendarView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var coordinator: NavigationCoordinator
    var body: some View {
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            VStack {
                headerView
                Spacer()
            }.padding()
        }
    }
    
    //MARK: - Header View
    @ViewBuilder
    var headerView: some View {
        HeaderView(
            title: "Calendar",
            showSettingsButton: true,
            settingsAction: {
                print("Settings button tapped")
                coordinator.push(SettingsView(coordinator: coordinator))
            }
        )
    }
}

#Preview {
    CalendarView(coordinator: NavigationCoordinator())
}
