//
//  AddNewFamilyView.swift
//  eSociety
//
//  Created by Meheboob on 26/08/25.
//

import SwiftUI

struct AddNewFamilyView: View {
    
    @State private var ownershipType = "Owner"
    @State private var maintenanceType = "Monthly"
    @State private var selectedDate = Date()
    
    let ownerOptions = ["Owner", "Tenant", "Family Member", "Other"]
    let maintenanceOptions = ["Monthly", "Quarterly", "Yearly"]
    
    let fieldHeight: CGFloat = 60
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Manage Families in Society")
                    .font(.custom("Roboto-Bold", size: 28))
                    .foregroundColor(.primary)
                
                Text("Add New Family")
                    .font(.custom("Roboto-Regular", size: 22))
                
                Group {
                    labeledTextField("Flat number", placeholder: "Enter Flat number")
                    labeledTextField("Email ID", placeholder: "Enter Email ID")
                    labeledTextField("Owner Name", placeholder: "Enter Owner Name")
                    
                    labeledPicker("Ownership Type", selection: $ownershipType, options: ownerOptions)
                    
                    labeledTextField("Contact Number", placeholder: "Enter Contact Number")
                    
                    Text("Move-In Date")
                        .font(.custom("Roboto-Regular", size: 18))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(height: fieldHeight)
                        
                        DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .labelsHidden()
                            .padding(.horizontal)
                    }
                    
                    labeledTextField("Number of Residents", placeholder: "Enter Number of Resident")
                    
                    labeledPicker("Maintainance Category", selection: $maintenanceType, options: maintenanceOptions)
                }
                
                Button( action: {
                    // Submit logic here
                }) {
                    Text("Submit")
                        .frame(maxWidth: .infinity, minHeight: fieldHeight)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .font(.headline)
                }
                //.padding(.horizontal) // Moved outside to align with fields
            }
            .padding()
        }
    }
    
    // MARK: - Reusable Components
    
    func labeledTextField(_ label: String, placeholder: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.custom("Roboto-Regular", size: 18))
            TextField(placeholder, text: .constant(""))
                .font(.custom("Roboto-Regular", size: 18))
                .padding()
                .frame(height: fieldHeight)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
        }
    }
    
    func labeledPicker(_ label: String, selection: Binding<String>, options: [String]) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.custom("Roboto-Regular", size: 18))
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selection.wrappedValue = option
                    }
                }
            } label: {
                HStack {
                    Text(selection.wrappedValue)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(height: fieldHeight)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
        }
    }
}

#Preview {
    AddNewFamilyView()
}
