//
//  BudgetProgressView.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 18/02/25.
//

import SwiftUI

struct BudgetProgressView: View {
    let budget: Double
    let progressSegments: [(amount: Double, color: Color)]
    let spacingDegrees: Double = 10 // Space between segments
    
    // Compute segment angles correctly
    var segmentAngles: [(start: Double, end: Double, color: Color)] {
        var angles: [(start: Double, end: Double, color: Color)] = []
        let totalSpacing = Double(progressSegments.count - 1) * spacingDegrees
        let availableDegrees = 180 - totalSpacing // Degrees left after spacing
        
        var currentAngle: Double = 180 // Start from the bottom
        
        for (index, segment) in progressSegments.enumerated() {
            let amount = index == 0 ? segment.amount - totalSpacing : segment.amount
            let segmentAngle = (amount / budget) * availableDegrees // FIXED: Now based on budget
            
            if index > 0 {
                currentAngle += spacingDegrees // Add spacing after first segment
            }
            
            let endAngle = currentAngle + segmentAngle
            angles.append((start: currentAngle, end: endAngle, color: segment.color))
            currentAngle = endAngle
            
            print("start : \(currentAngle)")
            print("end : \(endAngle)")
        }
        
        
        return angles
    }
    
    var body: some View {
        
        ZStack {
            // Background Circle
            Circle()
                .trim(from: 0.50, to: 1)
                .stroke(
                    DesignSystem.Colors.grey.opacity(0.4),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
            
            // Render precomputed segments
            ForEach(segmentAngles, id: \.start) { segment in
                
                ArcSegment(startAngle: segment.start, endAngle: segment.end, color: segment.color)
            }
            
            // Center Text
            VStack(spacing: 10) {
                let totalSpent = progressSegments.reduce(0) { $0 + $1.amount }
                
                Text("$\(String(format: "%.2f", totalSpent))")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Text("of $\(Int(budget)) budget")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(.top,-60)
        }
        .frame(width: 200, height: 200)
        
    }
}

struct ArcSegment: View {
    var startAngle: Double
    var endAngle: Double
    var color: Color
    var glow: Bool = true
    
    var body: some View {
        Circle()
            .trim(from: CGFloat(startAngle / 360), to: CGFloat(endAngle / 360))
            .stroke(color, style: StrokeStyle(lineWidth: 12, lineCap: .round))
            .shadow(color: glow ? color.opacity(0.7) : .clear, radius: glow ? 10 : 0)
    }
}

#Preview {
    BudgetProgressView(
        budget: 2000,
        progressSegments: [
            (amount: 200, color: .mint),
            (amount: 300, color: .orange),
            (amount: 400, color: .purple)
        ]
    )
}
