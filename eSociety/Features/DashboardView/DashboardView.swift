//
//  DashboardView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

// MARK: - DashboardView
/// Main dashboard screen showing summary cards, planned vs actual activities,
/// and year-over-year spending chart.
struct DashboardView: View {
    var body: some View {
        NavigationView { // Enables navigation between screens
            ScrollView { // Allows vertical scrolling
                VStack(spacing: 24) { // Main vertical stack with spacing
                    
                    // MARK: - Summary Cards Row
                    HStack(spacing: 16) {
                        
                        // Total Families card with badge
                        ZStack(alignment: .topTrailing) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Total Families")
                                    .font(AppFont.robotoBold(size: 28))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 100)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                            BadgeView(count: 42) // Example count
                                .offset(x: -12, y: 12) // Position badge
                        }
                        
                        // Defaulters card with badge
                        ZStack(alignment: .topTrailing) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Defaulters")
                                    .font(AppFont.robotoBold(size: 28))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 100)
                                    .background(Color.green)
                                    .cornerRadius(8)
                            }
                            BadgeView(count: 7) // Example count
                                .offset(x: -12, y: 12) // Position badge
                        }
                    }
                    .padding(.horizontal, 25)
                    
                    // MARK: - Planned vs Actual Activities Graph
                    HStack {
                        PlannedActivitiesGraphView()
                    }
                    .padding(.horizontal, 16)
                    
                    // MARK: - Year-over-Year Spending Graph
                    HStack {
                        YoYSpendingView()
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.vertical, 24)
            }
            .navigationTitle("Dashboard") // Screen title
        }
    }
}

// MARK: - Preview
#Preview {
    DashboardView()
}

