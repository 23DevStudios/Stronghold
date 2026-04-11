//
//  StrongholdApp.swift
//  Stronghold
//
//  App entry point. Configures SwiftData and launches the root view.
//  As we add @Model types, register them in the schema array below.
//

import SwiftUI
import SwiftData

@main
struct StrongholdApp: App {
    var sharedModelContainer: ModelContainer = {
        // Register all SwiftData models here as we create them.
        // Example: Schema([CharacterProfile.self, Quest.self])
        let schema = Schema([CharacterProfile.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
