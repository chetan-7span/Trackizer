//
//  HostingController.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//

import SwiftUI

class HostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false) // Ensure nav bar is hidden
        view.backgroundColor = UIColor.clear // Prevent default background color
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        additionalSafeAreaInsets = .zero // Remove any additional insets
    }
}
