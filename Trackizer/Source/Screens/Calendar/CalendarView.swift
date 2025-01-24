//
//  CalendarView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 22/01/25.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack{
            HeaderView(title: "Calendar",showSettingsButton: true) {
                print("Setting Tapped")
            }
            Spacer()
        }
    }
}

#Preview {
    CalendarView()
}
