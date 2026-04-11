//
//  DashboardView.swift
//  Stronghold
//
//  The main character screen. Shown after onboarding is complete.
//  Displays the character's name, class, level, and XP progress.
//
//  Location: Stronghold/Features/Dashboard/DashboardView.swift
//

import SwiftUI

struct DashboardView: View {

    // The ViewModel is created by whoever shows this view (ContentView),
    // which already has the profile from @Query.
    // @State keeps this instance alive for the lifetime of the view.
    @State private var viewModel: DashboardViewModel

    // Custom init so we can receive the profile and create the ViewModel.
    // This is the correct place to do setup — not inside body.
    init(profile: CharacterProfile) {
        _viewModel = State(initialValue: DashboardViewModel(profile: profile))
    }

    var body: some View {
        VStack(spacing: 24) {

            // Character header
            VStack(spacing: 6) {
                Text(viewModel.characterName)
                    .font(.largeTitle)
                    .bold()

                Text(viewModel.className)
                    .font(.title3)
                    .foregroundStyle(.secondary)

                Text(viewModel.classTagline)
                    .font(.caption)
                    .foregroundStyle(.tertiary)
                    .multilineTextAlignment(.center)
            }

            Divider()

            // Level and XP
            VStack(spacing: 8) {
                Text(viewModel.levelText)
                    .font(.headline)

                // ProgressView with a value between 0.0 and 1.0
                // xpProgress on CharacterProfile returns exactly that
                ProgressView(value: viewModel.xpProgress)
                    .tint(.blue)

                Text(viewModel.xpText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Divider()

            // Primary stat
            HStack {
                Text("Primary Focus")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(viewModel.primaryFocus)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    let profile = CharacterProfile(name: "Pawan", characterClass: .barbarian)
    DashboardView(profile: profile)
}
