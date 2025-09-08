//
//  Resident.swift
//  eSociety
//
//  Created by Meheboob on 28/08/25.
//

import SwiftData
import Foundation

// MARK: - Resident Model
/// Represents a resident in the society.
/// Uses SwiftData @Model for persistent storage in the app.
/// Each resident has details like flat number, owner info, contact, and maintenance info.
@Model
class Resident {
    
    // MARK: - Attributes
    @Attribute(.unique) var id: UUID                    // Unique identifier for each resident
    var flatNumber: String                              // Flat/apartment number
    var emailID: String                                 // Owner's email ID
    var ownerName: String                               // Owner's name
    var ownershipType: String                           // Ownership type (Owner, Tenant, etc.)
    var contactNumber: String                            // Contact number of the resident
    var moveInDate: Date                                // Date the resident moved in
    var numberOfResidents: Int                           // Number of people in the flat
    var maintenanceCategory: String                      // Maintenance frequency (Monthly/Quarterly/Yearly)
    @Relationship var family: Family? // ✅ Link to Family
    // MARK: - Initializer
    /// Initialize a new Resident object
    /// - Parameters:
    ///   - flatNumber: Flat/apartment number
    ///   - emailID: Email of the owner
    ///   - ownerName: Name of the owner
    ///   - ownershipType: Ownership type
    ///   - contactNumber: Contact number
    ///   - moveInDate: Move-in date
    ///   - numberOfResidents: Total residents in the flat
    ///   - maintenanceCategory: Maintenance type
    init(flatNumber: String,
         emailID: String,
         ownerName: String,
         ownershipType: String,
         contactNumber: String,
         moveInDate: Date,
         numberOfResidents: Int,
         maintenanceCategory: String) {
        self.id = UUID()
        self.flatNumber = flatNumber
        self.emailID = emailID
        self.ownerName = ownerName
        self.ownershipType = ownershipType
        self.contactNumber = contactNumber
        self.moveInDate = moveInDate
        self.numberOfResidents = numberOfResidents
        self.maintenanceCategory = maintenanceCategory
    }
}
