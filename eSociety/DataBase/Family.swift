//
//  Family.swift
//  eSociety
//
//  Created by Meheboob on 07/09/25.
//

import SwiftData

@Model
class Family {
    @Attribute(.unique) var fileNo: String
    var name: String
    var membersCount: Int
    var block: String?

    @Relationship(deleteRule: .cascade) var residents: [Resident] = []

    init(fileNo: String, name: String, membersCount: Int, block: String? = nil) {
        self.fileNo = fileNo
        self.name = name
        self.membersCount = membersCount
        self.block = block
        self.residents = [] // ✅ Must initialize relationship
    }
}
