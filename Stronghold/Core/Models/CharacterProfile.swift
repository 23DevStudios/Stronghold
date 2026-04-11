//
//  CharacterProfile.swift
//  Stronghold
//
//  The user's character. This is the central model of the entire app.
//  Everything — XP, quests, loot, party — connects back to this.
//
//  Location: Stronghold/Core/Models/CharacterProfile.swift
//

import Foundation
import SwiftData

/// Represents the player's character. Stored locally via SwiftData.
/// There will only ever be one CharacterProfile per device in MVP.
@Model
final class CharacterProfile {

    // MARK: - Identity
    var id: UUID
    var name: String

    // MARK: - Class
    // Stored as a String because SwiftData can't store enums directly.
    // We expose a computed property to get back the typed enum.
    var characterClassRaw: String

    // MARK: - Progression
    var level: Int
    var currentXP: Int

    // MARK: - Meta
    var createdAt: Date

    // MARK: - Init
    init(name: String, characterClass: CharacterClass) {
        self.id = UUID()
        self.name = name
        self.characterClassRaw = characterClass.rawValue
        self.level = 1
        self.currentXP = 0
        self.createdAt = Date()
    }

    // MARK: - Computed

    /// Returns the typed CharacterClass enum from the stored raw string.
    var characterClass: CharacterClass {
        CharacterClass(rawValue: characterClassRaw) ?? .fighter
    }

    /// How much total XP is needed to reach the next level.
    /// Formula: each level requires 100 * level XP.
    /// Level 1 → 2 needs 100 XP. Level 5 → 6 needs 500 XP.
    var xpRequiredForNextLevel: Int {
        level * 100
    }

    /// Progress toward the next level as a value between 0.0 and 1.0.
    /// Used to drive the XP progress bar in the UI.
    var xpProgress: Double {
        Double(currentXP) / Double(xpRequiredForNextLevel)
    }
}
