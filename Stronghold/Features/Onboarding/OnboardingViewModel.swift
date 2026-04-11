//
//  OnboardingViewModel.swift
//  Stronghold
//
//  Holds all in-progress state for the onboarding flow.
//  The view reads from this. The view sends actions to this.
//  This saves to SwiftData when the user confirms.
//
//  Location: Stronghold/Features/Onboarding/OnboardingViewModel.swift
//

import Foundation
import SwiftData

// @Observable makes this class automatically notify any SwiftUI view
// that's watching it whenever a property changes.
// Think of it as the SwiftUI equivalent of publishing events in Spring.
@Observable
final class OnboardingViewModel {

    // MARK: - In-progress state
    // These are temporary — they only exist while onboarding is active.

    var name: String = ""
    var selectedClass: CharacterClass = .fighter
    var currentStep: Int = 0

    // MARK: - Validation

    // Computed property: returns true when the current step has valid input.
    // The view uses this to enable/disable the Next button.
    var isCurrentStepValid: Bool {
        switch currentStep {
        case 0:
            // Name step: valid only if name isn't blank
            return !name.trimmingCharacters(in: .whitespaces).isEmpty
        case 1:
            // Class step: a class is always selected, so always valid
            return true
        default:
            return false
        }
    }

    // MARK: - Navigation

    func goToNextStep() {
        currentStep += 1
    }

    // MARK: - Save

    // Called when the user confirms. Creates the CharacterProfile and
    // inserts it into SwiftData via the ModelContext.
    //
    // ModelContext is SwiftData's "unit of work" — like an EntityManager
    // in JPA. You insert objects into it and it writes them to the database.
    func saveCharacter(context: ModelContext) {
        let profile = CharacterProfile(
            name: name.trimmingCharacters(in: .whitespaces),
            characterClass: selectedClass
        )
        context.insert(profile)
    }
}
