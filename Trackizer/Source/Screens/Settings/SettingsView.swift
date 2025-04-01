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
            VStack {
                headerView
                profileView
                settingsList
                Spacer()
               
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
    
    //MARK: Profile view
    @ViewBuilder
    var profileView: some View {
        VStack(alignment: .center) {
            DesignSystem.Images.avatar
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80) // Set width and height for the circle
                .clipShape(Circle())
            
            Text("John Doe")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(DesignSystem.Colors.white)
            Text(verbatim: "j.doe@gmail.com")
                .foregroundColor(DesignSystem.Colors.grey30)
                .padding(.bottom)
            
            
            Button(action: {
                
            }) {
                Text("Edit profile")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(
                        Capsule()
                            .fill(DesignSystem.Colors.grey.opacity(0.40))
                    )
                    .gradientTrimOverlay()
            }
            
        }
    }
    
    //MARK: Setting List
    @ViewBuilder
    var settingsList: some View {
        List {
            generalSectionView
            mySubscriptionsSectionView
            appearanceSectionView
        }
        .scrollContentBackground(.hidden)
//
    }
    
    //MARK: General section view
    @ViewBuilder
    var generalSectionView: some View {
        SettingsSection(title: "General") {
            SettingsRow(title: "Security", subtitle: "FaceID", icon: DesignSystem.Images.faceID)
            SettingsRow(title: "iCloud Sync", isToggle: true, icon: DesignSystem.Images.iCloud)
        }
    }
    
    //MARK: My Subcriptions section view
    @ViewBuilder
    var mySubscriptionsSectionView: some View {
        SettingsSection(title: "My subscriptions") {
            SettingsRow(title: "Sorting", subtitle: "Date", icon: DesignSystem.Images.sorting)
            SettingsRow(title: "Summary", subtitle: "Average", icon: DesignSystem.Images.chart)
            SettingsRow(title: "Default currency", subtitle: "Default", icon: DesignSystem.Images.money)
        }
    }
    
    //MARK: Appearance section view
    @ViewBuilder
    var appearanceSectionView: some View {
        SettingsSection(title: "Appearance") {
            SettingsRow(title: "App icon", subtitle: "Default", icon: DesignSystem.Images.appIcon)
            SettingsRow(title: "Theme", subtitle: "Average", icon: DesignSystem.Images.lightTheme)
        }
    }
}

#Preview {
    SettingsView(coordinator: NavigationCoordinator())
}
