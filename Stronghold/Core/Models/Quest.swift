//
//  Quest.swift
//  Stronghold
//
//  Created by Pawan Harikrishnan on 4/14/26.
//

import Foundation

struct Quest: Identifiable {

    let id: UUID
    let title: String
    let description: String
    let reward: Int
    let forCharacterClass: CharacterClass?

    init(title: String, description: String, reward: Int, forCharacterClass: CharacterClass? = nil) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.reward = reward
        self.forCharacterClass = forCharacterClass
    }

}
