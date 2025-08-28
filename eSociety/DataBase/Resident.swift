//
//  Resident.swift
//  eSociety
//
//  Created by Meheboob on 28/08/25.
//

import SwiftData
import Foundation

@Model
class Resident {
    @Attribute(.unique) var id: UUID
    var flatNumber: String
    var emailID: String
    var ownerName: String
    var ownershipType: String
    var contactNumber: String
    var moveInDate: Date
    var numberOfResidents: Int
    var maintenanceCategory: String

    init(flatNumber: String, emailID: String, ownerName: String, ownershipType: String, contactNumber: String, moveInDate: Date, numberOfResidents: Int, maintenanceCategory: String) {
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
