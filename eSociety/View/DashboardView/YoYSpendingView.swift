//
//  YoYSpendingView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

struct YoYSpendingView: View {
    struct SpendingData: Identifiable {
        let id = UUID()
        let month: String
        let year2024: Double
        let year2025: Double
    }

    let data: [SpendingData] = [
        .init(month: "Jan", year2024: 1200, year2025: 1500),
        .init(month: "Feb", year2024: 1100, year2025: 1300),
        .init(month: "Mar", year2024: 1400, year2025: 1250),
        .init(month: "Apr", year2024: 1000, year2025: 1600),
        .init(month: "May", year2024: 1350, year2025: 1400)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Year-over-Year Spending")
                .font(AppFont.robotoBold(size: 22))
                .padding(.horizontal)

            VStack {
                GeometryReader { geo in
                    let maxSpending = data.flatMap { [$0.year2024, $0.year2025] }.max() ?? 1
                    let barWidth = geo.size.width / CGFloat(data.count * 2 + 1)
                    let maxBarHeight = geo.size.height / 2 // Each bar gets max half height
                    
                    HStack(alignment: .bottom, spacing: barWidth / 2) {
                        ForEach(data) { item in
                            VStack(spacing: 4) {
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: barWidth,
                                           height: CGFloat(item.year2024 / maxSpending) * maxBarHeight)
                                
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: barWidth,
                                           height: CGFloat(item.year2025 / maxSpending) * maxBarHeight)
                                
                                Text(item.month)
                                    .font(.caption)
                                    .frame(height: 20)
                            }
                        }
                    }
                }
                .frame(height: 200)
            }
            .padding(8)
            .background(
                Rectangle()
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}
