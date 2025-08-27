//
//  FlatCellView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

struct FlatCellView: View {
    let flat: FlatInfo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                infoRow(label: kFlatNo.localized, value: flat.flatNumber)
                infoRow(label: kOwnerName.localized, value: flat.ownerName)
                infoRow(label: kContact.localized, value: flat.contact)
                infoRow(label: kResidentCount.localized, value: "\(flat.residents)")
                infoRow(label: kOwnership.localized, value: flat.owneship)
                
                HStack(spacing: 16) {
                    Text(kActions.localized)
                        .font(AppFont.robotoBold(size: 18))
                        .foregroundColor(.primary)
                    
                    Button(kEdit.localized) {
                        // Edit action
                    }
                    .buttonStyle(ActionButtonStyle(color: .blue))
                    
                    Button(kDelete.localized) {
                        // Delete action
                    }
                    .buttonStyle(ActionButtonStyle(color: .red))
                }
            }
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color(.systemBackground))
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
    FlatCellView(flat: .init(flatNumber: "101", ownerName: "John Doe", contact: "+923123456789", residents: 2, owneship: "Owned"))
}
