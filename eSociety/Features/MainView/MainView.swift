//
//  MainView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//


import SwiftUI

import SwiftUI

// MARK: - MainView
/// Main app screen with navigation buttons to different sections.
struct MainView: View {
    
    // MARK: - Dashboard Buttons Data
    private let buttons: [DashboardButton] = [
        .init(title: "Dashboard", systemImage: "rectangle.grid.2x2"),
        .init(title: "Families", systemImage: "person.3"),
        .init(title: "Payments", systemImage: "creditcard"),
        .init(title: "Activities", systemImage: "figure.walk"),
        .init(title: "Reports", systemImage: "doc.plaintext")
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationView { // Navigation container
            VStack(spacing: 24) {
                
                // Loop through buttons and create navigation links
                ForEach(buttons) { button in
                    NavigationLink(destination: destinationView(for: button.title)) {
                        BigDashboardButton(button: button) // Custom button view
                    }
                }
                
                Spacer() // Push buttons to top
            }
            .padding()
            .navigationTitle("Dashboard") // Screen title
        }
    }
    
    // MARK: - Navigation Destination Resolver
    
    /// Purpose of @ViewBuilder:
    /// - `@ViewBuilder` is a result builder provided by SwiftUI.
    /// - It allows you to return multiple views conditionally without wrapping them
    ///   in a single container like `VStack` or `Group`.
    /// - Without it, SwiftUI would expect exactly one view to be returned from the function.
    ///
    @ViewBuilder
    private func destinationView(for title: String) -> some View {
        switch title {
        case "Families":
            FamilyListView()   // Navigate to Families screen
        case "Dashboard":
            DashboardView()    // Navigate to Dashboard screen
        default:
            Text("\(title) Screen") // Placeholder for other screens
        }
    }
}

// MARK: - DashboardButton Model
struct DashboardButton: Identifiable {
    let id = UUID()       // Unique identifier for ForEach
    let title: String     // Button title
    let systemImage: String // SF Symbol icon name
}

// MARK: - BigDashboardButton View
/// Custom button view used in MainView for navigation
struct BigDashboardButton: View {
    let button: DashboardButton
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            Image(systemName: button.systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
            
            // Title
            Text(button.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer() // Push content to left
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 70) // Full width button
        .background(Color.black)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2) // Subtle shadow
    }
}

// MARK: - Preview
#Preview {
    MainView()
}
