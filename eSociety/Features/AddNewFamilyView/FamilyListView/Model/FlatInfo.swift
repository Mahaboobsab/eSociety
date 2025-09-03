//
//  FlatInfo.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import Foundation

// MARK: - FlatInfo
/// Model representing basic information about a flat/resident.
struct FlatInfo: Identifiable {
    let id = UUID()          // Unique identifier for use in lists (ForEach)
    let flatNumber: String   // Flat/apartment number
    let ownerName: String    // Name of the owner
    let contact: String      // Contact number of the owner
    let residents: Int8      // Number of residents living in the flat
    let ownership: String     // Ownership type (e.g., Owned, Rented)
}
