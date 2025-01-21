//
//  TrackizerApp.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 20/01/25.
//

import SwiftUI

@main
struct TrackizerApp: App {
    @StateObject private var coordinator = NavigationCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationWrapperView()
                .environmentObject(coordinator).ignoresSafeArea()
        }
    }
}
