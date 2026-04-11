//
//  OnboardingView.swift
//  Stronghold
//
//  The multi-step onboarding screen. Shown once when the user
//  has no character yet. Guides them through naming their character
//  and choosing a class.
//
//  Location: Stronghold/Features/Onboarding/OnboardingView.swift
//

import SwiftUI
import SwiftData

struct OnboardingView: View {

    // @Environment pulls the SwiftData context from the environment.
    // It was injected at the app root in StrongholdApp.swift via .modelContainer().
    // We pass this to the ViewModel when saving.
    @Environment(\.modelContext) private var modelContext

    // @State here because OnboardingViewModel is an object we create
    // and own inside this view. @State on a class keeps it alive
    // as long as the view is on screen.
    @State private var viewModel = OnboardingViewModel()

    var body: some View {
        VStack {
            // Show a different step based on currentStep
            switch viewModel.currentStep {
            case 0:
                nameStep
            case 1:
                classStep
            default:
                EmptyView()
            }
        }
        .padding()
        .animation(.easeInOut, value: viewModel.currentStep)
    }

    // MARK: - Step 0: Name Entry

    private var nameStep: some View {
        VStack(spacing: 24) {
            Text("What is your name, warrior?")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)

            // TextField binds directly to viewModel.name.
            // @Observable makes this two-way: typing updates the ViewModel,
            // and ViewModel changes update the field.
            TextField("Enter your name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()

            nextButton
        }
    }

    // MARK: - Step 1: Class Selection

    private var classStep: some View {
        VStack(spacing: 24) {
            Text("Choose your class")
                .font(.title2)
                .bold()

            // CaseIterable gives us allCases — every CharacterClass in order.
            // ForEach loops over them and builds a button for each.
            ForEach(CharacterClass.allCases, id: \.self) { characterClass in
                classRow(for: characterClass)
            }

            confirmButton
        }
    }

    // MARK: - Class Row

    private func classRow(for characterClass: CharacterClass) -> some View {
        Button {
            viewModel.selectedClass = characterClass
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(characterClass.displayName)
                        .font(.headline)
                    Text(characterClass.tagline)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                // Show a checkmark on the selected class
                if viewModel.selectedClass == characterClass {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.blue)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(viewModel.selectedClass == characterClass
                          ? Color.blue.opacity(0.1)
                          : Color(.systemGray6))
            )
        }
        .buttonStyle(.plain)
    }

    // MARK: - Buttons

    private var nextButton: some View {
        Button("Next") {
            viewModel.goToNextStep()
        }
        // Disabled when the current step isn't valid (e.g. name is empty)
        .disabled(!viewModel.isCurrentStepValid)
        .buttonStyle(.borderedProminent)
    }

    private var confirmButton: some View {
        Button("Begin Your Journey") {
            viewModel.saveCharacter(context: modelContext)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    OnboardingView()
        .modelContainer(for: CharacterProfile.self, inMemory: true)
}
