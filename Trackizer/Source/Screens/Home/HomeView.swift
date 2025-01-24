//
//  HomeView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var coordinator: NavigationCoordinator
    @State private var selectedTab = 0
    @State private var progress = 0.0
    var body: some View {
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            backgrundView
            VStack{
                headerView
                
                SemiCircularProgressView(progress: progress)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)) {
                            progress = 0.7
                        }
                    }
                VStack(spacing:30){
                    seeYourBudgetButton
                    subcriptionsViews
                }.padding(.top,-80)
                
                ScrollView{
                    VStack(spacing:20){
                        tabSection.padding(.top,40)
                        
                        if selectedTab == 0{
                            yourSubscriptionView
                        }else{
                            upcomingBillsView
                        }
                    }
                    Spacer(minLength: 60)
                }
            }.padding()
        }
    }
    
    // MARK: - Components
    var headerView : some View {
        HeaderView(
            showSettingsButton: true,
            settingsAction: {
                coordinator.push(SettingsView(coordinator: coordinator))
            }
        )
    }
    var backgrundView : some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Color(DesignSystem.Colors.grey70)
                    .frame(height: geometry.size.height * 0.64)
                    .cornerRadius(24)
                Color(DesignSystem.Colors.appBg)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    @ViewBuilder
    var seeYourBudgetButton: some View {
        Button(action: {
            
        }) {
            Text("See your budget")
                .foregroundColor(.white)
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(
                    Capsule()
                        .fill(DesignSystem.Colors.grey.opacity(0.40))
                )
                .overlay(
                    Capsule()
                        .trim(from: 0, to: 1)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [DesignSystem.Colors.grey50, .clear]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        }
    }
    
    @ViewBuilder
    var subcriptionsViews: some View {
        HStack(spacing:10) {
            statCard(title: "Active subs", value: "12", color: DesignSystem.Colors.orange)
            statCard(title: "Highest subs", value: "$19.99",color: DesignSystem.Colors.purple)
            statCard(title: "Lowest subs", value: "$5.99",color: DesignSystem.Colors.skyBlue)
        }
    }
    @ViewBuilder
    var tabSection: some View {
        HStack(spacing: 0) {
            Button(action: {
                selectedTab = 0
            }) {
                Text("Your subscriptions")
                    .foregroundColor(selectedTab == 0 ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(selectedTab == 0 ? Color.white.opacity(0.10) : Color.clear)
                    .cornerRadius(15)
            }
            
            Button(action: {
                selectedTab = 1
            }) {
                Text("Upcoming bills")
                    .foregroundColor(selectedTab == 1 ? DesignSystem.Colors.white : DesignSystem.Colors.grey50)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(selectedTab == 1 ? Color.white.opacity(0.10) : Color.clear)
                    .cornerRadius(15)
            }
        }
        .padding(10)
        .background(Color.black)
        .cornerRadius(20)
    }
    
    var yourSubscriptionView : some View{
        VStack(spacing: 15) {
            subscriptionItem(icon: DesignSystem.Images.spotifyLogo, name: "Spotify", price: "$5.99", date: nil)
            subscriptionItem(icon: DesignSystem.Images.youTubeLgoo, name: "YouTube Premium", price: "$18.99", date: nil)
            subscriptionItem(icon: DesignSystem.Images.oneDriveLogo, name: "Microsoft OneDrive", price: "$29.99", date: nil)
        }
    }
    
    var upcomingBillsView : some View{
        VStack(spacing: 15) {
            subscriptionItem(icon: nil, name: "Spotify", price: "$5.99", date: "Jun\n25")
            subscriptionItem(icon: nil, name: "YouTube Premium", price: "$18.99", date: "Jun\n25")
            subscriptionItem(icon: nil, name: "Microsoft OneDrive", price: "$29.99", date: "Jun\n25")
        }
    }
    
    func statCard(title: String, value: String,color: Color) -> some View {
        ZStack {
            DesignSystem.Colors.grey.opacity(0.40)
                .cornerRadius(15)
            
            VStack(spacing: 5){
                Text(title)
                    .foregroundColor(DesignSystem.Colors.grey40)
                    .font(.system(size: 12))
                Text(value)
                    .foregroundColor(DesignSystem.Colors.white)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }
            VStack {
                Rectangle()
                    .fill(color)
                    .frame(width: 50, height: 1)
                    .cornerRadius(2)
                    .offset(y: -28)
            }
        }
        .frame(height: 55)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .trim(from: 0, to: 0.685)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [DesignSystem.Colors.grey50, .clear]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
    }
    
    func subscriptionItem(icon: Image?, name: String, price: String,date : String?) -> some View {
        HStack(spacing:16) {
            if icon == nil {
                ZStack {
                    Color(DesignSystem.Colors.grey70)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    Text(date ?? "NA")
                        .font(.system(size: 14))
                        .foregroundColor(DesignSystem.Colors.grey40)
                        .multilineTextAlignment(.center)
                }
            }else {
                icon!
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            
            Text(name)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer()
            
            Text(price)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding(12)
        .background(DesignSystem.Colors.appBg)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(DesignSystem.Colors.grey50, lineWidth: 1)
        )
    }
}

#Preview {
    HomeView(coordinator: NavigationCoordinator())
}
