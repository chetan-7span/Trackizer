//
//  AddSubscriptionView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 03/03/25.
//

import SwiftUI

struct AddSubscriptionView: View {
    @ObservedObject var coordinator: NavigationCoordinator
    @State private var description: String = ""
    @State private var price: Double = 5.99
    @State private var selectedIndex = 1 // Default middle item
    
    let subscriptionApps = [
        DesignSystem.Images.spotifyLogo, // Left app icon (replace with actual asset name)
        DesignSystem.Images.oneDriveLogo,  // Center app icon (current selection)
        DesignSystem.Images.netflixLogo  // Right app icon (replace with actual asset name)
    ]
    
    var body: some View {
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            VStack {
                headerView
                titleView
                carouselView
                Spacer().frame(height: 30)
                descriptionView
                Spacer().frame(height: 30)
                priceView
                Spacer()
                bottonView
            }.padding()
        }
    }
    
    //MARK: - Header View
    @ViewBuilder
    var headerView: some View {
        HeaderView(
            title: "New",
            showBackButton: true,
            backButtonAction: {
                print("Back button tapped")
                coordinator.pop()
            }
        )
    }
    
    // MARK: - Title
    @ViewBuilder
    var titleView: some View {
        Text("Add new\nsubscription")
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.bottom,30)
        Spacer().frame(height: 10)
    }
    // MARK: - Carousel Slider
    @ViewBuilder
    var carouselView: some View {
        CarouselView(items:  [
            CarouselItem(name: "Spotify", imageName: DesignSystem.Images.spotifyLogo),
            CarouselItem(name: "Netflix", imageName: DesignSystem.Images.netflixLogo),
            CarouselItem(name: "One Drive", imageName: DesignSystem.Images.oneDriveLogo)
        ]
        )
    }
    
    // MARK: - Description Input
    @ViewBuilder
    var descriptionView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Description")
                .foregroundColor(.gray)
                .font(.footnote)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.1))
                .frame(height: 45)
                .overlay(
                    TextField("", text: $description)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                )
        }
    }
    
    // MARK: - Price Section
    @ViewBuilder
    var priceView: some View {
        Text("Monthly price")
            .foregroundColor(.gray)
            .font(.footnote)
        
        HStack {
            Button(action: {
                if price > 0 { price -= 1 }
            }) {
                Image(systemName: "minus")
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 50)
                    .background(Color.white.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Text("$\(String(format: "%.2f", price))")
                .foregroundColor(.white)
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            Button(action: {
                price += 1
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 50)
                    .background(Color.white.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
    
    //MARK: - Botton view
    @ViewBuilder
    var bottonView : some View {
        CustomButton(
            title: "Add this platform",
            icon: nil, // No icon
            backgroundColor: DesignSystem.Colors.orange,
            foregroundColor: .white,
            shadowColor: DesignSystem.Colors.orange
        ) {
            coordinator.push(SignUpView(coordinator: coordinator))
        }
    }
}


#Preview {
    AddSubscriptionView(coordinator: NavigationCoordinator())
}




