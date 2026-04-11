//
//  DashboardViewModel.swift
//  Stronghold
//
//  Holds and exposes the character's data for the dashboard screen.
//  Read-only — the dashboard displays data, it doesn't edit it.
//
//  Location: Stronghold/Features/Dashboard/DashboardViewModel.swift
//

import Foundation

@Observable
final class DashboardViewModel {

    // The character profile this dashboard is showing.
    // Private so only this ViewModel can hold a reference to it.
    private let profile: CharacterProfile

    // init receives the profile from whoever creates this ViewModel.
    // This is dependency injection — we don't fetch it ourselves.
    init(profile: CharacterProfile) {
        self.profile = profile
    }

    // MARK: - Computed properties for the view
    // These are derived from the profile. No stored values — calculated on read.

    var characterName: String {
        profile.name
    }

    var levelText: String {
        "Level \(profile.level)"
    }

    var className: String {
        profile.characterClass.displayName
    }

    var classTagline: String {
        profile.characterClass.tagline
    }

    var xpProgress: Double {
        profile.xpProgress
    }

    var xpText: String {
        "\(profile.currentXP) / \(profile.xpRequiredForNextLevel) XP"
    }

    var primaryFocus: String {
        profile.characterClass.primaryFocus
    }
}
