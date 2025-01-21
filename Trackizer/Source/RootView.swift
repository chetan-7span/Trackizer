//
//  RootView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        WelcomeView(coordinator: coordinator)
    }
}
