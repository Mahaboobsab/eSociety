//
//  YoYSpendingView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

// MARK: - YoYSpendingView
/// A custom bar chart to compare Year-over-Year (YoY) spending.
struct YoYSpendingView: View {
    
    // MARK: - Data Model
    struct SpendingData: Identifiable {
        let id = UUID()       // Unique ID for ForEach
        let month: String     // Month label
        let year2024: Double  // Spending for 2024
        let year2025: Double  // Spending for 2025
    }
    
    // Sample spending dataset
    let data: [SpendingData] = [
        .init(month: "Jan", year2024: 1200, year2025: 1500),
        .init(month: "Feb", year2024: 1100, year2025: 1300),
        .init(month: "Mar", year2024: 1400, year2025: 1250),
        .init(month: "Apr", year2024: 1000, year2025: 1600),
        .init(month: "May", year2024: 1350, year2025: 1400)
    ]
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Title
            Text("Year-over-Year Spending")
                .font(AppFont.robotoBold(size: 22))
                .padding(.horizontal)
            
            // Chart container
            VStack {
                GeometryReader { geo in
                    // Calculate scaling factors
                    let maxSpending = data.flatMap { [$0.year2024, $0.year2025] }.max() ?? 1
                    let barWidth = geo.size.width / CGFloat(data.count * 2 + 1)
                    let maxBarHeight = geo.size.height / 2 // Half height for each bar
                    
                    // Horizontal stack for bars
                    HStack(alignment: .bottom, spacing: barWidth / 2) {
                        ForEach(data) { item in
                            VStack(spacing: 4) {
                                // Bar for 2024 (blue)
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: barWidth,
                                           height: CGFloat(item.year2024 / maxSpending) * maxBarHeight)
                                
                                // Bar for 2025 (green)
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: barWidth,
                                           height: CGFloat(item.year2025 / maxSpending) * maxBarHeight)
                                
                                // Month label
                                Text(item.month)
                                    .font(.caption)
                                    .frame(height: 20)
                            }
                        }
                    }
                }
                .frame(height: 200) // Fixed chart height
            }
            .padding(8)
            .background(
                Rectangle()
                    .stroke(Color.gray, lineWidth: 1) // Chart border
            )
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}
