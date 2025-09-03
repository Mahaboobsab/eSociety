//
//  PlannedActivitiesGraphView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

// MARK: - Data Model
struct ActivityDataPoint: Identifiable {
    let id = UUID()     // Unique identifier for ForEach
    let month: String   // Month name
    let value: Double   // Value (planned/actual activities)
}

// MARK: - Planned vs Actual Graph View
struct PlannedActivitiesGraphView: View {
    
    // Sample dataset for planned activities
    let plannedData: [ActivityDataPoint] = [
        .init(month: "Jan", value: -200),
        .init(month: "Feb", value: 400),
        .init(month: "Mar", value: 300),
        .init(month: "Apr", value: 100),
        .init(month: "May", value: -100)
    ]
    
    // Sample dataset for actual activities
    let actualData: [ActivityDataPoint] = [
        .init(month: "Jan", value: -300),
        .init(month: "Feb", value: 100),
        .init(month: "Mar", value: -50),
        .init(month: "Apr", value: 500),
        .init(month: "May", value: 200)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Title
            Text("Planned vs Actual Activities")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            GeometryReader { geo in
                let height = geo.size.height    // Available height
                let width = geo.size.width      // Available width
                let maxValue = 1000.0           // Max scale for graph
                let minValue = -1000.0          // Min scale for graph
                
                ZStack {
                    // Background border
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                    
                    // X-axis (horizontal line at center)
                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 1)
                    }
                    
                    // Line for planned data (yellow)
                    LineGraph(data: plannedData, color: .yellow,
                              max: maxValue, min: minValue,
                              width: width, height: height)
                    
                    // Line for actual data (purple)
                    LineGraph(data: actualData, color: .purple,
                              max: maxValue, min: minValue,
                              width: width, height: height)
                    
                    // Month labels at bottom
                    HStack {
                        ForEach(plannedData) { point in
                            Text(point.month)
                                .font(.caption)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.top, height - 20)
                }
            }
            .frame(height: 200) // Fixed graph height
        }
        .padding()
    }
}

// MARK: - Line Graph (Reusable subview)
struct LineGraph: View {
    let data: [ActivityDataPoint] // Data points
    let color: Color              // Line color
    let max: Double               // Max value for scale
    let min: Double               // Min value for scale
    let width: CGFloat            // Graph width
    let height: CGFloat           // Graph height
    
    var body: some View {
        Path { path in
            for (index, point) in data.enumerated() {
                // Calculate X based on index
                let x = CGFloat(index) / CGFloat(data.count - 1) * width
                // Calculate Y by mapping value into graph height
                let y = (1 - CGFloat((point.value - min) / (max - min))) * height
                
                if index == 0 {
                    path.move(to: CGPoint(x: x, y: y)) // Start path
                } else {
                    path.addLine(to: CGPoint(x: x, y: y)) // Draw line
                }
            }
        }
        .stroke(color, lineWidth: 2) // Draw line with color
    }
}

