//
//  FlatCellView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

struct FlatCellView: View {
    let resident: Resident
    let onDelete: () -> Void
    let onEdit: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            infoRow(label: kFlatNo.localized, value: resident.flatNumber)
            infoRow(label: kOwnerName.localized, value: resident.ownerName)
            infoRow(label: kContact.localized, value: resident.contactNumber)
            infoRow(label: kResidentCount.localized, value: "\(resident.numberOfResidents)")
            infoRow(label: kOwnership.localized, value: resident.ownershipType)
            
            // ✅ Updated to use infoRow for date
            infoRow(
                label: kMoveInDateLabel.localized,
                value: DateFormatterUtil.string(from: resident.moveInDate, format: "dd MMM yyyy")
            )
            
            HStack(spacing: 16) {
                Button(kEdit.localized, action: onEdit)
                    .buttonStyle(ActionButtonStyle(color: .blue))
                
                Button(kDelete.localized, action: onDelete)
                    .buttonStyle(ActionButtonStyle(color: .red))
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func infoRow(label: String, value: String) -> some View {
        (
            Text(label + " ")
                .font(AppFont.robotoBold(size: 18))
                .foregroundColor(.primary)
            +
            Text(value)
                .font(AppFont.robotoLight(size: 18))
                .foregroundColor(.primary)
        )
    }
}


struct ActionButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppFont.robotoBold(size: 20))
            .foregroundColor(color)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}


#Preview {
    FlatCellView(
        resident: Resident(
            flatNumber: "101",
            emailID: "john@example.com",
            ownerName: "John Doe",
            ownershipType: "Owned",
            contactNumber: "+923123456789",
            moveInDate: Date(),
            numberOfResidents: 2,
            maintenanceCategory: "Monthly"
        ),
        onDelete: {},
        onEdit: {}
    )
}
