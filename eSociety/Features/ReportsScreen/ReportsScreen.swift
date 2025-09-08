//
//  ReportsScreen.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftUI

struct ReportItem: Identifiable {
    let id = UUID()
    let fileNo: String
    let familyName: String
    let month: String
    let amount: Double
    let isPaid: Bool
    let isApproved: Bool
}

struct ReportsScreen: View {
    @State private var reports: [ReportItem] = [
        ReportItem(fileNo: "A100", familyName: "Rina Kumari", month: "June", amount: 7500, isPaid: false, isApproved: false),
        ReportItem(fileNo: "A102", familyName: "Vinod Mahto", month: "June", amount: 7500, isPaid: true, isApproved: true),
        ReportItem(fileNo: "A103", familyName: "Sita Kumari", month: "June", amount: 7500, isPaid: false, isApproved: false),
        // Add more entries as needed
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(reports) { report in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(report.fileNo)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(report.month)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        Text(report.familyName)
                            .font(.headline)

                        HStack {
                            Text("Amount: ₹\(Int(report.amount))")
                            Spacer()
                            Text(report.isPaid ? "Paid" : "Not Paid")
                                .foregroundColor(report.isPaid ? .green : .red)
                        }

                        Text(report.isApproved ? "Approved" : "Pending Approval")
                            .font(.subheadline)
                            .foregroundColor(report.isApproved ? .green : .orange)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Reports")
        }
    }
}

#Preview {
    ReportsScreen()
}
