//
//  ContentView.swift
//  Stronghold
//
//  Root view. Decides whether to show onboarding or the main app
//  based on whether a CharacterProfile exists in the database.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    // @Query fetches all CharacterProfile records from SwiftData.
    // It stays live — if a profile gets inserted, this updates automatically.
    @Query private var profiles: [CharacterProfile]

    var body: some View {
        if profiles.isEmpty {
            // No character yet — send them through onboarding
            OnboardingView()
        } else {
            // Character exists — show the dashboard
            DashboardView(profile: profiles[0])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: CharacterProfile.self, inMemory: true)
}
