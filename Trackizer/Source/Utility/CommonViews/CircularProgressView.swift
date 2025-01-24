//
//  CircularProgressView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 23/01/25.
//

import SwiftUI

struct SemiCircularProgressView: View {
    var progress: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.30, to: 1)
                .stroke(
                    DesignSystem.Colors.grey.opacity(0.4),
                    style: StrokeStyle(lineWidth: 15, lineCap: .round)
                )
                .rotationEffect(.degrees(35))
            Circle()//0.25 + progress * 0.5
                .trim(from: 0.30, to: 0.30+progress*0.7)
                .stroke(
                    RadialGradient(colors: DesignSystem.Colors.twoColors, center: .center, startRadius: 0, endRadius: 150),
                    style: StrokeStyle(lineWidth: 15, lineCap: .round)
                )
                .shadow(color: DesignSystem.Colors.orange, radius: 15, x: 0, y: 5)
                .rotationEffect(.degrees(35))
                
            
            VStack {
                HeaderLogoView().padding(.top,-30)
                Text("$1,235")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("This month bills")
                    .font(.system(size: 12))
                    .foregroundColor(DesignSystem.Colors.grey40)
            }
        }//.padding()
    }
}

struct ContentView: View {
    var body: some View {
        SemiCircularProgressView(progress: 1) // Set progress (e.g., 75%)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.edgesIgnoringSafeArea(.all)) // Background color
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
