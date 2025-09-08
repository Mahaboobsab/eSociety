//
//  Activity.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftData

@Model
class ActivityModel {
    @Attribute(.unique) var id: UUID
    var title: String
    var date: Date
    var location: String
    var isCompleted: Bool

    @Relationship(deleteRule: .cascade) var participants: [Resident]

    init(
        id: UUID = UUID(),
        title: String,
        date: Date,
        location: String,
        isCompleted: Bool,
        participants: [Resident] = []
    ) {
        self.id = id
        self.title = title
        self.date = date
        self.location = location
        self.isCompleted = isCompleted
        self.participants = participants
    }
}
