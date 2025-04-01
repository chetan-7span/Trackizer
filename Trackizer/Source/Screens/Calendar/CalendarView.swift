//
//  CalendarView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct CalendarView: View {
    
    @ObservedObject var coordinator: NavigationCoordinator
    @State private var selectedDate = 8
    @State private var selectedMonth = "January"
    private let dates = [8, 9, 10, 11, 12, 13, 14]
    private let monthOptions = ["January", "February", "March"]
    let items = [
        ("Spotify", "$5.99", DesignSystem.Images.spotifyLogo),
        ("Netflix", "$9.99", DesignSystem.Images.netflixLogo),
        ("YouTube", "Free", DesignSystem.Images.youTubeLgoo),
        ("MS One Drive", "$12.99", DesignSystem.Images.oneDriveLogo)
    ]
    
    // Define two columns with flexible width
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            VStack(alignment: .leading) {
                headerView
                titleView
                dropDownRow
                calendarView.padding(.vertical)
                upcomingBills.padding(.vertical)
                subscriptionsCard
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
    
    //MARK: - Title view
    @ViewBuilder
    var titleView: some View {
        Text("Subs\nSchedule")
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(.white)
            .padding(.top, 20)
    }
    
    //MARK: - DropDown row
    @ViewBuilder
    var dropDownRow: some View {
        HStack {
            Text("3 subscriptions for today")
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
            // Month Dropdown
            // Month Dropdown Properly Positioned
            Menu {
                ForEach(monthOptions, id: \.self) { month in
                    Button(month) {
                        selectedMonth = month
                    }
                }
            } label: {
                HStack(spacing: 5) {
                    Text(selectedMonth)
                        .foregroundColor(.white)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(Color.white.opacity(0.05))
                .gradientTrimOverlay()
                .cornerRadius(15)
            }
            .padding(.trailing, 10)
            
        }
    }
    
    //MARK: - Calender view
    @ViewBuilder
    var calendarView: some View {
        // Calendar Scroll
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(dates, id: \.self) { date in
                    VStack {
                        Text(String(format: "%02d", date))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(selectedDate == date ? .white : .gray)
                        
                        Text(getWeekday(for: date))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(width: 50, height: 70)
                    .background(selectedDate == date ? Color.purple.opacity(0.7) : Color.gray.opacity(0.3))
                    .cornerRadius(15)
                    .gradientTrimOverlay()
                    
                    .onTapGesture {
                        selectedDate = date
                    }
                }
            }
        }
    }
    
    //MARK: - Upcoming bills
    @ViewBuilder
    var upcomingBills: some View {
        // Upcoming Bills
        HStack {
            Text("January\n01.08.2022")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("$24.98\nin upcoming bills")
                .font(.title3)
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
        }
    }
    
    //MARK: - Subscriptions card
    @ViewBuilder
    var subscriptionsCard: some View {
        // Subscription Cards
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(items, id: \.0) { item in
                    SubscriptionCardView(name: item.0, price: item.1, icon: item.2)
                    .gradientTrimOverlay()
                }
            }
            .padding()
        }
    }
    // Helper function to get weekday
    func getWeekday(for date: Int) -> String {
        let weekdays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
        return weekdays[(date - 8) % 7]  // Dummy calculation for demo purposes
    }
}

#Preview {
    CalendarView(coordinator: NavigationCoordinator())
}

struct SubscriptionCardView: View {
    var name: String
    var price: String
    var icon: Image
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            icon
                .resizable()
                .frame(width: 40, height: 40)
            
            Text(name)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(price)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading) // Aligns VStack to leading
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}
