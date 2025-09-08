//
//  ActivitiesScreen.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let location: String
    let isCompleted: Bool
}

struct ActivitiesScreen: View {
    @State private var activities: [Activity] = [
        Activity(title: "Yoga Session", date: "Sept 10, 2025", location: "Community Hall", isCompleted: false),
        Activity(title: "Tree Plantation Drive", date: "Sept 12, 2025", location: "Park Area", isCompleted: true),
        Activity(title: "Cultural Night", date: "Sept 15, 2025", location: "Main Lawn", isCompleted: false)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(activities) { activity in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(activity.title)
                            .font(.headline)
                        Text("📅 \(activity.date) • 📍 \(activity.location)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(activity.isCompleted ? "✅ Completed" : "🕒 Upcoming")
                            .font(.subheadline)
                            .foregroundColor(activity.isCompleted ? .green : .orange)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Activities")
        }
    }
}

#Preview {
    ActivitiesScreen()
}
