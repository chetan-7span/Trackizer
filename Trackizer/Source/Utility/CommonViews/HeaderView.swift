//
//  HeaderView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 24/01/25.
//

import SwiftUI

struct HeaderView: View {
    var title: String? = nil
    var appLogo: Image? = nil

    var showBackButton: Bool = false
    var backButtonAction: (() -> Void)? = nil
    var showSettingsButton: Bool = false
    var settingsAction: (() -> Void)? = nil

    var body: some View {
        HStack {
            if showBackButton {
                Button(action: {
                    backButtonAction?()
                }) {
                    DesignSystem.Images.icnBack.resizable().scaledToFit().frame(width: 24,height: 24)
                }
                .foregroundColor(DesignSystem.Colors.grey50)
            } else {
                Spacer()
            }
            if let title = title {
                Text(title)
                    .font(.body)
                    .foregroundColor(DesignSystem.Colors.grey50)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            } else if let logo = appLogo {
                logo
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
            }
            if showSettingsButton {
                Button(action: {
                    settingsAction?()
                }) {
                    DesignSystem.Images.settings
                }
            } else {
                Spacer()
            }
        }
    }
}


#Preview {
    HeaderView(appLogo: DesignSystem.Images.headerLogo)

//    HeaderView(
//        title: "Credit Cards",
//        showBackButton: true,
//        backButtonAction: {
//            print("Back button tapped")
//        },
//        showSettingsButton: true,
//        settingsAction: {
//            print("Settings button tapped")
//        }
//    )
}
