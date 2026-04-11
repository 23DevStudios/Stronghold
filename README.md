# Stronghold

A D&D-style fitness RPG for iOS. You pick a character class based on your real gym goal, then level up by actually working out.

Built with Swift + SwiftUI. Data stays local first — no account required to start.

---

## The idea

Most fitness apps show you numbers. Stronghold turns those numbers into a game.

Walk 10k steps, hit your protein, finish your workouts — earn XP, level up, unlock dungeons, fight bosses. The progression is real because the data behind it is real.

---

## Classes

| Class | Focus |
|-------|-------|
| Barbarian | Bulking / strength |
| Rogue | Fat loss / cardio |
| Paladin | Balanced recomposition |
| Monk | Mobility / discipline |
| Fighter | Powerlifting / progressive overload |
| Ranger | Endurance / steps / outdoor |

---

## Stack

- Swift + SwiftUI
- SwiftData (local persistence)
- Apple HealthKit
- Hevy API
- MacroFactor (CSV import)

---

## Status

Early development. Single-player core loop in progress.

- [x] Character creation and class selection
- [x] Local XP and leveling system
- [ ] Daily quests driven by health data
- [ ] HealthKit integration
- [ ] Hevy workout import
- [ ] Party system
- [ ] Dungeons and boss fights
