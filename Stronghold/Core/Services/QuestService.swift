//
//  QuestService.swift
//  Stronghold
//
//  Created by Pawan Harikrishnan on 4/14/26.
//

struct QuestService {

    // MARK: - Quest Catalogue

    /// All quests in the game. nil forCharacterClass means the quest is universal.
    private let questBook: [Quest] = [
        Quest(title: "Humble Beginnings", description: "Every adventurer starts somewhere.", reward: 10),
        Quest(title: "A Fighter's Tale", description: "Select the Fighter class.", reward: 10, forCharacterClass: .fighter)
    ]

    // MARK: - Queries

    /// Returns all quests available to a given character class —
    /// includes class-specific quests and universal quests (forCharacterClass == nil).
    func quests(for characterClass: CharacterClass) -> [Quest] {
        questBook.filter { $0.forCharacterClass == characterClass || $0.forCharacterClass == nil }
    }

}
