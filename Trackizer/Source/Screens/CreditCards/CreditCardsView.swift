//
//  CreditCardsView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct CreditCardsView: View {
    @ObservedObject var coordinator: NavigationCoordinator
    @State var cardHolderName: String = "John Doe"
    @State var cardNumber: String = "**** **** **** 2197"
    @State var expirationDate: String = "08/28"
    
    var body: some View {
        
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            backgrundView.ignoresSafeArea()
            VStack {
                headerView
                ScrollView{
                    VStack(spacing : 40) {
                        cardsView.padding(.top)
                        subscriptionsView
                        dottedBorderButton.padding(.top)
                    }
                    Spacer(minLength: 60)
                }
            }.padding()
        }
    }
    
    //MARK: - Header View
    @ViewBuilder
    var headerView: some View {
        HeaderView(
            title: "Credit Cards",
            showSettingsButton: true,
            settingsAction: {
                print("Settings button tapped")
                coordinator.push(SettingsView(coordinator: coordinator))
            }
        )
    }

    
    //MARK: - Credi Cards View
    @ViewBuilder
    var cardsView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(DesignSystem.Colors.card2)
                .frame(width: 220, height: 340)
                .offset(x:30)
                .rotationEffect(.degrees(10))
            RoundedRectangle(cornerRadius: 20)
                .fill(DesignSystem.Colors.card1)
                .frame(width: 220, height: 340)
                .offset(x:20)
                .rotationEffect(.degrees(5))
            
            (DesignSystem.Images.mainCard)
                .scaledToFit()
                .frame(width: 180, height: 300)
                .shadow(radius: 10)
                .overlay(
                    VStack(alignment: .center, spacing: 10) {
                        DesignSystem.Images.masterCardLogo
                            .resizable()
                            .frame(width: 50, height: 30)
                        Text("Virtual Card")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text(cardHolderName)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Text(cardNumber)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 5)
                        
                        Text(expirationDate)
                            .foregroundColor(.white)
                            .font(.subheadline)
                        DesignSystem.Images.chip
                            .resizable()
                            .frame(width: 40, height: 30)
                            .foregroundColor(.yellow)
                    }
                )
        }
    }
    
    //MARK: - Subscriptions view
    @ViewBuilder
    var subscriptionsView: some View {
        // Subscriptions Section
        VStack {
            Text("Subscriptions")
                .font(.headline)
                .foregroundColor(DesignSystem.Colors.white)
            
            HStack(spacing: 20) {
                DesignSystem.Images.spotifyLogo
                    .resizable()
                    .frame(width: 40, height: 40)
                
                DesignSystem.Images.youTubeLgoo
                    .resizable()
                    .frame(width: 40, height: 40)
                
                DesignSystem.Images.oneDriveLogo
                    .resizable()
                    .frame(width: 40, height: 40)
                DesignSystem.Images.netflixLogo
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .padding(.top, 10)
        }
        .padding(.top, 20)
        
    }
    
    //MARK: - Bottom Background View
    @ViewBuilder
    var backgrundView: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // White background
                Color(DesignSystem.Colors.appBg)
                
                // Black background
                Color(DesignSystem.Colors.grey70)
                    .frame(height: geometry.size.height * 0.23)
                    .cornerRadius(24)
            }
        }
    }
    
    var dottedBorderButton: some View {
        Button(action: {
            // Button action
        }) {
            HStack{
                Text("Add New Card")
                    .padding()
                    .foregroundColor(DesignSystem.Colors.grey30)
                    .cornerRadius(10)
                DesignSystem.Images.icnAdd
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .frame(maxWidth:.infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 3]))
                    .foregroundColor(DesignSystem.Colors.grey30)
            )
        }
    }
    
}

#Preview {
    CreditCardsView(coordinator: NavigationCoordinator())
}
