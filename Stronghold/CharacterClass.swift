//
//  CharacterClass.swift
//  Stronghold
//
//  Defines every playable class in the game.
//  Each class maps to a real-world fitness archetype.
//
//  Location: Stronghold/Core/Models/CharacterClass.swift
//  (You will move this file into that group in Xcode shortly)
//

import Foundation

/// The playable class a user selects during character creation.
/// Each case represents a distinct fitness archetype with its own XP focus.
enum CharacterClass: String, Codable, CaseIterable {
    case barbarian  // Bulking / strength focus
    case rogue      // Fat loss / agility / cardio
    case paladin    // Balanced recomposition / consistency
    case monk       // Discipline / mobility / body control
    case fighter    // Powerlifting / progressive overload
    case ranger     // Endurance / steps / outdoor activity

    // MARK: - Display Properties

    /// The name shown in the UI
    var displayName: String {
        switch self {
        case .barbarian: return "Barbarian"
        case .rogue:     return "Rogue"
        case .paladin:   return "Paladin"
        case .monk:      return "Monk"
        case .fighter:   return "Fighter"
        case .ranger:    return "Ranger"
        }
    }

    /// Short tagline shown on the class selection screen
    var tagline: String {
        switch self {
        case .barbarian: return "Built to bulk. Strength is everything."
        case .rogue:     return "Lean, fast, and relentless."
        case .paladin:   return "Balanced body. Consistent grind."
        case .monk:      return "Master of movement and discipline."
        case .fighter:   return "Progressive overload. Every rep counts."
        case .ranger:    return "Endurance built mile by mile."
        }
    }

    /// The primary stat this class gains XP fastest from
    var primaryFocus: String {
        switch self {
        case .barbarian: return "Strength"
        case .rogue:     return "Agility"
        case .paladin:   return "Consistency"
        case .monk:      return "Mobility"
        case .fighter:   return "Power"
        case .ranger:    return "Endurance"
        }
    }
}
