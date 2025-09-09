//
//  ActivitiesScreen.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftUI

struct ActivitiesScreen: View {
    @StateObject private var viewModel = ActivitiesViewModel()
    
    // Alert & Toast Bindings
    @State private var toastMessage: String? = nil
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        BaseView(
            isLoading: viewModel.isLoading,
            toastMessage: $toastMessage,
            showAlert: $showAlert,
            alertTitle: $alertTitle,
            alertMessage: $alertMessage
        ) {
            NavigationView {
                List(viewModel.activities) { activity in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(activity.title)
                            .font(.headline)
                        Text("📅 \(activity.activityDate) • 📍 \(activity.location)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(activity.isCompleted ? "✅ Completed" : "🕒 Upcoming")
                            .font(.subheadline)
                            .foregroundColor(activity.isCompleted ? .green : .orange)
                    }
                    .padding(.vertical, 8)
                }
                .navigationTitle("Activities")
            }
        }
        .task {
            await loadData()
        }
    }
    
    // MARK: - Load Activities with Error Handling
    private func loadData() async {
        await viewModel.loadActivities()
        
        if let error = viewModel.errorMessage {
            alertTitle = "Error"
            alertMessage = error
            showAlert = true
        } else {
            toastMessage = "✅ Activities loaded successfully"
        }
    }
}


#Preview {
    ActivitiesScreen()
}
