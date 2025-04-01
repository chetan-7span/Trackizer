//
//  CategoryRow.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 18/02/25.
//

import SwiftUI

struct CategoryRow: View {
    var icon: Image
    var title: String
    var spent: Double
    var total: Double
    var progressColor: Color

    var body: some View {
        VStack{
            HStack(alignment: .top) {
                icon
                    .foregroundColor(progressColor)
                    .font(.title2)
                    .frame(width: 35, height: 35)
                    .padding(.trailing,20)
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("$\(String(format: "%.2f", total - spent)) left to spend")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text("$\(String(format: "%.2f", spent))")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("of $\(Int(total))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            ProgressView(value: spent, total: total)
                .accentColor(progressColor)
                .scaleEffect(x: 1, y: 2, anchor: .center)
                .padding(.top,10)
            
        }
        .padding()
        .background(DesignSystem.Colors.grey.opacity(0.20))
        .cornerRadius(16)
        .gradientTrimOverlay()
    }
}

#Preview {
    CategoryRow(icon: DesignSystem.Images.entertainment, title: "Entertainment", spent: 50.99, total: 600.0, progressColor: .orange)
}
