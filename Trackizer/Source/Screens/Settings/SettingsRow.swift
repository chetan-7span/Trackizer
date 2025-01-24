//
//  SettingsRow.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 24/01/25.
//

import SwiftUI

// MARK: - Reusable Section Component
struct SettingsSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        Section(header: Text(title).foregroundColor(.white).font(.system(size: 14)).fontWeight(.semibold)) {
            content
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(DesignSystem.Colors.grey.opacity(0.2))
    }
}

// MARK: - Reusable Row Component
struct SettingsRow: View {
    let title: String
    let subtitle: String?
    let isToggle: Bool
    let icon: Image
    
    @State private var toggleState = false
    
    init(title: String, subtitle: String? = nil, isToggle: Bool = false, icon: Image) {
        self.title = title
        self.subtitle = subtitle
        self.isToggle = isToggle
        self.icon = icon
    }
    
    var body: some View {
        HStack {
            icon.resizable().scaledToFit().frame(width: 20, height: 20).padding(.trailing)
            Text(title).foregroundColor(.white).font(.system(size: 14)).fontWeight(.semibold)
            
            Spacer()
            
            if let subtitle = subtitle {
                Text(subtitle).font(.subheadline).foregroundColor(.gray)
            }
            
            if isToggle {
                Toggle("", isOn: $toggleState)
                    .labelsHidden()
            } else {
                DesignSystem.Images.icnBack
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12)
                    .rotationEffect(.degrees(180))
            }
        }.padding(.leading).padding(.trailing)
    }
}
