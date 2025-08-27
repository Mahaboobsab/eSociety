//
//  MainView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//


import SwiftUI

struct MainView: View {
    private let buttons: [DashboardButton] = [
        .init(title: "Dashboard", systemImage: "rectangle.grid.2x2"),
        .init(title: "Families", systemImage: "person.3"),
        .init(title: "Payments", systemImage: "creditcard"),
        .init(title: "Activities", systemImage: "figure.walk"),
        .init(title: "Reports", systemImage: "doc.plaintext")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                ForEach(buttons) { button in
                    NavigationLink(destination: destinationView(for: button.title)) {
                        BigDashboardButton(button: button)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Dashboard")
        }
    }
    
    @ViewBuilder
    private func destinationView(for title: String) -> some View {
        switch title {
        case "Families":
            FamilyListView()
        case "Dashboard":
            DashboardView()
        default:
            Text("\(title) Screen")
        }
    }
}


struct DashboardButton: Identifiable {
    let id = UUID()
    let title: String
    let systemImage: String
}

struct BigDashboardButton: View {
    let button: DashboardButton
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: button.systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
            
            Text(button.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 70)
        .background(Color.black)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}


#Preview {
    MainView()
}
