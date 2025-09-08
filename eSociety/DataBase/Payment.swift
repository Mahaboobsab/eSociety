//
//  Payment.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftData

@Model
class Payment {
    @Attribute(.unique) var id: UUID
    var month: String
    var amount: Double
    var method: String
    var isPaid: Bool
    var isApproved: Bool
    var paidOn: Date?

    @Relationship var resident: Resident

    init(
        id: UUID = UUID(),
        month: String,
        amount: Double,
        method: String,
        isPaid: Bool,
        isApproved: Bool,
        paidOn: Date? = nil,
        resident: Resident
    ) {
        self.id = id
        self.month = month
        self.amount = amount
        self.method = method
        self.isPaid = isPaid
        self.isApproved = isApproved
        self.paidOn = paidOn
        self.resident = resident
    }
}
