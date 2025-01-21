//
//  HeaderLogoView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import SwiftUI

struct HeaderLogoView: View {
    var body: some View {
        logoView
    }
    //MARK: - Logo view
    @ViewBuilder
    var logoView : some View {
        DesignSystem.Images.headerLogo
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 30)
    }
}

#Preview {
    HeaderLogoView()
}
