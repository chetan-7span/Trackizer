//
//  NavigationWrapperView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import Foundation
import SwiftUI

struct NavigationWrapperView: UIViewControllerRepresentable {
    @EnvironmentObject var coordinator: NavigationCoordinator

    func makeUIViewController(context: Context) -> UINavigationController {
        let rootView = RootView()
            .environmentObject(coordinator) // Pass the coordinator
        let hostingController = UIHostingController(rootView: rootView)
        let navigationController = UINavigationController(rootViewController: hostingController)

        // Hide the navigation bar
        navigationController.setNavigationBarHidden(true, animated: false)

        // Set the navigation controller in the coordinator
        coordinator.setNavigationController(navigationController)

        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No updates needed
    }
}

