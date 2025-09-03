//
//  FamilyListView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI
import SwiftData

// MARK: - FamilyListView
/// Displays a list of families/residents with search, add, edit, and delete functionality.
struct FamilyListView: View {
    
    // MARK: - State & Environment
    @State private var searchText: String = ""                   // Text entered in search bar
    @State private var navigateToAddFamily = false              // Controls navigation to AddNewFamilyView
    @Query var residents: [Resident]                             // Fetches all residents from SwiftData
    @Environment(\.modelContext) private var modelContext       // CoreData/SwiftData context for CRUD operations
    @State private var selectedResident: Resident? = nil        // Resident selected for editing
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // MARK: - Header with Title & Add Button
            HStack {
                Text(kFamilyList.localized)
                    .font(AppFont.robotoBold(size: 25))
                    .foregroundColor(.primary)
                
                Spacer()
                
                // Add New Family button
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
                
                // Hidden NavigationLink triggered by state (for add/edit)
                NavigationLink(
                    destination: Group {
                        if let resident = selectedResident {
                            AddNewFamilyView(existingResident: resident) // Edit existing resident
                        } else {
                            AddNewFamilyView() // Add new resident
                        }
                    },
                    isActive: $navigateToAddFamily
                ) {
                    EmptyView()
                }
                .hidden() // Hide actual link UI
            }
            .padding(.horizontal, 16)
            
            // MARK: - Search Bar
            TextField(kSearch.localized, text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 16)
            
            // MARK: - Residents List
            List(filteredResidents, id: \.id) { resident in
                FlatCellView(resident: resident) {
                    deleteResident(flatNumber: resident.flatNumber) // Delete action
                } onEdit: {
                    selectedResident = resident                      // Set resident to edit
                    navigateToAddFamily = true                       // Trigger navigation
                }
            }
        }
    }
    
    // MARK: - Filtered Residents based on search
    var filteredResidents: [Resident] {
        if searchText.isEmpty {
            return residents
        } else {
            return residents.filter {
                $0.flatNumber.localizedCaseInsensitiveContains(searchText) ||
                $0.ownerName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    // MARK: - Delete Resident
    /// Deletes a resident with the given flat number from SwiftData and saves context
    func deleteResident(flatNumber: String) {
        let descriptor = FetchDescriptor<Resident>(
            predicate: #Predicate { $0.flatNumber == flatNumber }
        )
        do {
            let results = try modelContext.fetch(descriptor)
            for resident in results {
                modelContext.delete(resident) // Delete from context
            }
            try modelContext.save()           // Save changes
        } catch {
            Logger.debug("Delete failed: \(error)")
        }
    }
}

// MARK: - Preview
#Preview {
    FamilyListView()
}

