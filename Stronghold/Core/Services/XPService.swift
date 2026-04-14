//
//  XPService.swift
//  Stronghold
//
//  Created by Pawan Harikrishnan on 4/13/26.
//

struct XPService {

    // MARK: - XP Thresholds

    /// Total XP needed to reach a given level.
    /// Level 1 costs 100 XP, level 2 costs 200 more, etc.
    func xpRequired(forLevel: Int) -> Int {
        return forLevel * 100
    }

    // MARK: - Level Calculation

    /// Derives a character's level from their total accumulated XP.
    /// Walks up the level thresholds until XP is exhausted.
    func level(forXP: Int) -> Int {
        var remainingXP = forXP
        var level = 0
        var threshold = 100           // cost to reach level 1

        while remainingXP >= threshold {
            remainingXP -= threshold
            level += 1
            threshold += 100          // each level costs 100 more
        }

        return level
    }
}
