//
//  HomeView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var progress = 0.0
    var body: some View {
        ZStack {
            // Background
            AppBackgroundView(useWelcomeBackground: false)
            ScrollView{
                ZStack{
                    backgrundView
                    VStack{
                        Spacer(minLength: 44)
                        headerView
                        SemiCircularProgressView(progress: progress)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1)) {
                                    progress = 0.7
                                }
                            }
                        VStack(spacing:20){
                            seeYourBudgetButton
                            HStack(spacing:10) {
                                statCard(title: "Active subs", value: "12", color: DesignSystem.Colors.orange)
                                statCard(title: "Highest subs", value: "$19.99",color: DesignSystem.Colors.purple)
                                statCard(title: "Lowest subs", value: "$5.99",color: DesignSystem.Colors.skyBlue)
                            }
                            
                            tabSection.padding(.top,40)
                            
                            if selectedTab == 0{
                                yourSubscriptionView
                            }else{
                                upcomingBillsView
                            }
                            
                            
                        }.padding(.top,-120)
                        
                        Spacer()
                    }
                    .padding()
                }
                Spacer(minLength: 60)
            }
        }.ignoresSafeArea()
    }
    
    // MARK: - Components
    var headerView : some View {
        // Header Section
        HStack {
            Spacer()
            Button(action: {
                // Settings action
            }) {
                DesignSystem.Images.settings
            }
        }
    }
    var backgrundView : some View {
        GeometryReader { geometry in
            // Background layers
            VStack(spacing: 0) {
                // Black background
                Color(DesignSystem.Colors.grey70)
                    .frame(height: geometry.size.height * 0.58)
                    .cornerRadius(24)
                // White background
                Color(DesignSystem.Colors.appBg)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    @ViewBuilder
    var seeYourBudgetButton: some View {
        Button(action: {
            // See your budget action
        }) {
            Text("See your budget")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(
                    Capsule()
                        .fill(DesignSystem.Colors.grey.opacity(0.40))
                )
                .overlay(
                    Capsule()
                        .trim(from: 0, to: 1)  // Create the partial border effect
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
            
            VStack {
                Text(title)
                    .foregroundColor(DesignSystem.Colors.grey40)
                Text(value)
                    .foregroundColor(DesignSystem.Colors.white)
                    .fontWeight(.bold)
            }
            VStack {
                Rectangle()
                    .fill(color) // Replace with your desired color
                    .frame(width: 50, height: 1) // Adjust width and height
                    .cornerRadius(2) // Optional: To round the edges of the line
                    .offset(y: -40) // Adjust the vertical position to align with the card's top
            }
        }
        .frame(height: 80) // Set the size of the card
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .trim(from: 0, to: 0.685)  // Create the partial border effect
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
