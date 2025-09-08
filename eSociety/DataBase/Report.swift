//
//  Report.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftData

@Model
class Report {
    @Attribute(.unique) var id: UUID
    var generatedOn: Date
    var totalFamilies: Int
    var totalCollected: Double
    var totalDefaulters: Int

    @Relationship(deleteRule: .cascade) var defaulters: [Resident]

    init(
        id: UUID = UUID(),
        generatedOn: Date,
        totalFamilies: Int,
        totalCollected: Double,
        totalDefaulters: Int,
        defaulters: [Resident] = []
    ) {
        self.id = id
        self.generatedOn = generatedOn
        self.totalFamilies = totalFamilies
        self.totalCollected = totalCollected
        self.totalDefaulters = totalDefaulters
        self.defaulters = defaulters
    }
}
