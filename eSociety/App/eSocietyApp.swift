//
//  eSocietyApp.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//


import SwiftUI
import SwiftData

@main
struct eSocietyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Resident.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
        .modelContainer(sharedModelContainer)
    }
}
