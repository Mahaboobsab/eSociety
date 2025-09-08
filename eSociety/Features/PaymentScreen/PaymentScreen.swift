//
//  PaymentScreen.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftUI

struct PaymentScreen: View {
    @State private var selectedFamily: String = ""
    @State private var amount: String = ""
    @State private var paymentMethod: String = "UPI"
    @State private var showConfirmation = false

    let families = ["Meheboob Family", "Khan Family", "Patel Family"]
    let paymentMethods = ["UPI", "Credit Card", "Cash", "Net Banking"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Family")) {
                    Picker("Family", selection: $selectedFamily) {
                        ForEach(families, id: \.self) { family in
                            Text(family)
                        }
                    }
                }

                Section(header: Text("Enter Amount")) {
                    TextField("₹0.00", text: $amount)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Payment Method")) {
                    Picker("Method", selection: $paymentMethod) {
                        ForEach(paymentMethods, id: \.self) { method in
                            Text(method)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Button("Make Payment") {
                        showConfirmation = true
                    }
                    .disabled(selectedFamily.isEmpty || amount.isEmpty)
                }
            }
            .navigationTitle("Payments")
            .alert(isPresented: $showConfirmation) {
                Alert(
                    title: Text("Payment Successful"),
                    message: Text("₹\(amount) paid via \(paymentMethod) for \(selectedFamily)"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
#Preview {
    PaymentScreen()
}

/*

*/
