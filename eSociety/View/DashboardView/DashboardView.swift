//
//  DashboardView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    HStack(spacing: 16) {
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
                                .offset(x: -12, y: 12)
                        }
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
                                .offset(x: -12, y: 12)
                        }
                    }
                    .padding(.horizontal, 25)
                    
                    HStack {
                        PlannedActivitiesGraphView()
                    }
                    .padding(.horizontal, 16)
                    
                    HStack {
                        YoYSpendingView()
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.vertical, 24)
            }
            .navigationTitle("Dashboard")
        }
    }
}

#Preview {
    DashboardView()
}
