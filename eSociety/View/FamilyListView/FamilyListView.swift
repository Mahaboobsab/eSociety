//
//  FamilyListView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

struct FamilyListView: View {
    
    @State private var searchText: String = ""
    
    let flats: [FlatInfo] = [
        FlatInfo(flatNumber: "101", ownerName: "Meheboob", contact: "9876543210", residents: 4, owneship: "Owned"),
        FlatInfo(flatNumber: "102", ownerName: "Sara", contact: "9123456780", residents: 3, owneship: "Rented"),
        FlatInfo(flatNumber: "103", ownerName: "Ali", contact: "9988776655", residents: 5, owneship: "Owned")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(kFamilyList.localized)
                .font(AppFont.robotoBold(size: 25))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)

            TextField(kSearch.localized, text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 16)

            List(filteredFlats) { flat in
                FlatCellView(flat: flat)
            }
            .listStyle(.plain)
        }
    }

    var filteredFlats: [FlatInfo] {
        if searchText.isEmpty {
            return flats
        } else {
            return flats.filter {
                $0.flatNumber.localizedCaseInsensitiveContains(searchText) ||
                $0.ownerName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

#Preview {
    FamilyListView()
}
