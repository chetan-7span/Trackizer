//
//  SettingsView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 24/01/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            AppBackgroundView(useWelcomeBackground: false)
            backgrundView.ignoresSafeArea()
            ScrollView{
                VStack(spacing : 40) {
                    headerView
                    cardsView.padding(.top)
                    subscriptionsView
                    dottedBorderButton.padding(.top)
                }.padding()
                Spacer(minLength: 60)
            }
            
        }
    }
}

#Preview {
    SwiftUIView()
}
