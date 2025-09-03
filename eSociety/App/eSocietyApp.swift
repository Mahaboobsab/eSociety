//
//  eSocietyApp.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//


import SwiftUI
import SwiftData

@main
struct eSocietyApp: App {   // Main app structure conforming to App protocol
    
    // Shared data model container used throughout the app
    var sharedModelContainer: ModelContainer = {
        // Define schema including the Resident model
        let schema = Schema([
            Resident.self,
        ])
        
        // Create model configuration (persistent storage, not in-memory)
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            // Try creating ModelContainer with schema & configuration
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            // Crash the app if ModelContainer cannot be created
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        // Main app window group
        WindowGroup {
            LoginView()  // Initial screen of the app
        }
        // Attach model container so data can be used inside app views
        .modelContainer(sharedModelContainer)
    }
}

