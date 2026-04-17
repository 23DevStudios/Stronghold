import Foundation
import SwiftData

// MARK: - QuestViewModel
@MainActor
final class QuestViewModel: ObservableObject {

    // The character profile this ViewModel is operating on.
    // Injected from outside — we don't fetch it ourselves.
    private let profile: CharacterProfile

    // @Published tells SwiftUI to re-render any View watching this ViewModel
    // whenever this list changes.
    @Published private var quests: [Quest] = []

    private let questService = QuestService()
    private let xpService = XPService()

    init(profile: CharacterProfile) {
        self.profile = profile
        // quests(for:) is a plain synchronous call — no closure needed.
        self.quests = questService.quests(for: profile.characterClass)
    }

    func completeQuest(_ quest: Quest) {
        guard !profile.completedQuestIDs.contains(quest.id) else { return }
        profile.completedQuestIDs.insert(quest.id)
        profile.currentXP += quest.reward
    }

}
