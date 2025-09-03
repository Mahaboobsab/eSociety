//
//  FlatCellView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

// MARK: - FlatCellView
/// Displays resident details in a card-like view with edit and delete actions.
struct FlatCellView: View {
    
    // MARK: - Properties
    let resident: Resident          // Resident data to display
    let onDelete: () -> Void        // Action for delete button
    let onEdit: () -> Void          // Action for edit button
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // Resident info rows
            infoRow(label: kFlatNo.localized, value: resident.flatNumber)
            infoRow(label: kOwnerName.localized, value: resident.ownerName)
            infoRow(label: kContact.localized, value: resident.contactNumber)
            infoRow(label: kResidentCount.localized, value: "\(resident.numberOfResidents)")
            infoRow(label: kOwnership.localized, value: resident.ownershipType)
            
            // Move-in date formatted
            infoRow(
                label: kMoveInDateLabel.localized,
                value: DateFormatterUtil.string(from: resident.moveInDate, format: "dd MMM yyyy")
            )
            
            // Action buttons: Edit & Delete
            HStack(spacing: 16) {
                Button(kEdit.localized, action: onEdit)
                    .buttonStyle(ActionButtonStyle(color: .blue))
                
                Button(kDelete.localized, action: onDelete)
                    .buttonStyle(ActionButtonStyle(color: .red))
            }
        }
        .padding() // Add padding around the card
    }
    
    // MARK: - Info Row Helper
    /// Combines label and value in a single Text view using bold + light font
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

// MARK: - Action Button Style
/// Custom button style for edit and delete buttons
struct ActionButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppFont.robotoBold(size: 20))
            .foregroundColor(color)
            .opacity(configuration.isPressed ? 0.6 : 1.0) // Press feedback
    }
}

// MARK: - Preview
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
        onDelete: {}, // Placeholder for delete action
        onEdit: {}    // Placeholder for edit action
    )
}
