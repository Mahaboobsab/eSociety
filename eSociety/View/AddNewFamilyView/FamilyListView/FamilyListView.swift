//
//  FamilyListView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI
import SwiftData

struct FamilyListView: View {
    
    @State private var searchText: String = ""
    @State private var navigateToAddFamily = false
    @Query var residents: [Resident]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(kFamilyList.localized)
                    .font(AppFont.robotoBold(size: 25))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {
                    navigateToAddFamily = true
                }) {
                    Label("Add New Family", systemImage: "plus")
                        .font(.headline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                // Hidden NavigationLink triggered by state
                NavigationLink(destination: AddNewFamilyView(), isActive: $navigateToAddFamily) {
                    EmptyView()
                }
                .hidden()
            }
            .padding(.horizontal, 16)
            
            TextField(kSearch.localized, text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 16)
            
            List(filteredFlats) { flat in
                FlatCellView(flat: flat) {
                    deleteResident(flatNumber: flat.flatNumber)
                }
            }
            .listStyle(.plain)
        }
    }
    
    var filteredFlats: [FlatInfo] {
        let mappedFlats = residents.map {
            FlatInfo(
                flatNumber: $0.flatNumber,
                ownerName: $0.ownerName,
                contact: $0.contactNumber,
                residents: Int8($0.numberOfResidents),
                owneship: $0.ownershipType
            )
        }
        
        if searchText.isEmpty {
            return mappedFlats
        } else {
            return mappedFlats.filter {
                $0.flatNumber.localizedCaseInsensitiveContains(searchText) ||
                $0.ownerName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func deleteResident(flatNumber: String) {
        let descriptor = FetchDescriptor<Resident>(
            predicate: #Predicate { $0.flatNumber == flatNumber }
        )
        do {
            let results = try modelContext.fetch(descriptor)
            for resident in results {
                modelContext.delete(resident)
            }
            try modelContext.save()
        } catch {
            print("Delete failed: \(error)")
        }
    }
    
}

#Preview {
    FamilyListView()
}
