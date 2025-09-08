//
//  ApprovalDashboardView.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftUI

struct FamilyPayment: Identifiable {
    let id = UUID()
    let fileNo: String
    let name: String
    let month: String
    let amount: Double
    var isPaid: Bool
    var isApproved: Bool
}

struct ApprovalDashboardView: View {
    @State private var payments: [FamilyPayment] = [
        FamilyPayment(fileNo: "A100", name: "Rina Kumari", month: "June", amount: 7500, isPaid: false, isApproved: false),
        FamilyPayment(fileNo: "A102", name: "Vinod Mahto", month: "June", amount: 7500, isPaid: false, isApproved: false),
        FamilyPayment(fileNo: "A103", name: "Sita Kumari", month: "June", amount: 7500, isPaid: false, isApproved: false),
        // Add more entries as needed
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach($payments) { $payment in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(payment.fileNo)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(payment.month)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        Text(payment.name)
                            .font(.headline)

                        HStack {
                            Text("Amount: ₹\(Int(payment.amount))")
                            Spacer()
                            Text(payment.isPaid ? "Paid" : "Not Paid")
                                .foregroundColor(payment.isPaid ? .green : .red)
                        }

                        Button(action: {
                            payment.isApproved.toggle()
                        }) {
                            Text(payment.isApproved ? "Approved" : "Approve")
                                .font(.subheadline)
                                .padding(.horizontal)
                                .padding(.vertical, 6)
                                .background(payment.isApproved ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Approval Dashboard")
        }
    }
}

#Preview {
    ApprovalDashboardView()
}
