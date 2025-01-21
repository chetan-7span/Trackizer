//
//  NavigationCoordinator.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import Foundation
import SwiftUI

class NavigationCoordinator: ObservableObject {
    private weak var navigationController: UINavigationController?

    func setNavigationController(_ controller: UINavigationController) {
        navigationController = controller
        if let navigationController = navigationController {
            print("NavigationController successfully set: \(navigationController)")
        } else {
            print("Failed to set NavigationController.")
        }
    }

    func push<Content: View>(_ view: Content) {
        guard let navigationController = navigationController else {
            print("Error: NavigationController is nil during push")
            return
        }
        let viewController = UIHostingController(rootView: view)
        navigationController.pushViewController(viewController, animated: true)
    }

    func pop() {
        guard let navigationController = navigationController else {
            print("Error: NavigationController is nil during pop")
            return
        }
        navigationController.popViewController(animated: true)
    }
}
