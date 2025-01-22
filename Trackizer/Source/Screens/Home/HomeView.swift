//
//  HomeView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            // Background
            AppBackgroundView(useWelcomeBackground: false)
            ScrollView{
                VStack(spacing:20){
                    // Header Section
                    HStack {
                        Spacer()
                        Button(action: {
                            // Settings action
                        }) {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    // Circular Progress Section
                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .trim(from: 0, to: 0.75)
                                .stroke(LinearGradient(
                                    gradient: Gradient(colors: [Color.orange, Color.red]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                ), lineWidth: 15)
                                .frame(width: 150, height: 150)
                                .rotationEffect(.degrees(-90))
                            
                            VStack(spacing: 4) {
                                Text("TRACKIZER")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text("$1,235")
                                    .foregroundColor(.white)
                                    .font(.system(size: 36, weight: .bold))
                                
                                Text("This month bills")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }
                        
                        Button(action: {
                            // See your budget action
                        }) {
                            Text("See your budget")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(red: 0.2, green: 0.2, blue: 0.3))
                                )
                        }
                    }
                    
                    Spacer()
                    
                    // Stats Section
                    HStack(spacing: 20) {
                        statCard(title: "Active subs", value: "12")
                        statCard(title: "Highest subs", value: "$19.99")
                        statCard(title: "Lowest subs", value: "$5.99")
                    }
                    
                    
                    // Tabs Section
                    tabSection
                    // Subscription List
                    VStack(spacing: 15) {
                        subscriptionItem(icon: DesignSystem.Images.spotifyLogo, name: "Spotify", price: "$5.99")
                        subscriptionItem(icon: DesignSystem.Images.youTubeLgoo, name: "YouTube Premium", price: "$18.99")
                        subscriptionItem(icon: DesignSystem.Images.oneDriveLogo, name: "Microsoft OneDrive", price: "$29.99")
                    }
                    Spacer()
                }
                .padding()
                Spacer(minLength: 60)
            }
        }
    }
    
    // MARK: - Components
    
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
    func statCard(title: String, value: String) -> some View {
        VStack {
            Text(title)
                .foregroundColor(DesignSystem.Colors.grey40)
                .font(.body)
            
            Text(value)
                .foregroundColor(DesignSystem.Colors.white)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(DesignSystem.Colors.grey.opacity(0.40))
        .cornerRadius(10)
    }
    
    func subscriptionItem(icon: Image, name: String, price: String) -> some View {
        HStack(spacing:16) {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            Text(name)
                .foregroundColor(.white)
                .font(.headline)
            
            Spacer()
            
            Text(price)
                .foregroundColor(.white)
                .font(.headline)
        }
        .padding()
        .background(DesignSystem.Colors.appBg)
        //        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 20) // Add a border with rounded corners
                .stroke(DesignSystem.Colors.grey50, lineWidth: 1)
        )
    }
}

#Preview {
    HomeView()
}
