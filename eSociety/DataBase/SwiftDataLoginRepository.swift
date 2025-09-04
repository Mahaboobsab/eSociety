//
//  SwiftDataLoginRepository.swift
//  eSociety
//
//  Created by Meheboob on 04/09/25.
//

import SwiftData

final class SwiftDataLoginRepository: LoginRepositoryProtocol {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func saveUser(_ user: Resident) async throws {
        context.insert(user)
        try context.save()
    }
    
    func getStorePath() -> String? {
        return context.container.configurations.first?.url.path(percentEncoded: false)
    }
}
