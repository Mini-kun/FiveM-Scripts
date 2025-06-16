# 🌐 Custom RP Resource Pack (SafeZone & NeedsZone Ready)

## 📝 Overview

This resource pack is a fork of the original work by RubberToe98, with modifications to fit a customized RP (Roleplay) environment. Unused resources have been removed, and the remaining ones have been adapted to support new systems: **SafeZone** and **NeedsZone** — designed to enhance gameplay immersion and safety.

---

## 🚀 Key Features

- ✅ **SafeZone Support**: Areas where players are protected from harm or disruptive actions.
- ✅ **NeedsZone Integration**: Places where players can manage or replenish their RP-related needs (rest, hunger, etc.).
- ✅ Lightweight and modular.
- ✅ Designed for relaxed and immersive RP environments.

---

## 📦 Included Resources

### `CarryPeople`
- **Description**: Allows players to carry or drag other players.
- **Use Case**: Emergency medical RP, rescue scenes, or law enforcement detainment.
- **SafeZone Behavior**: Disabled or restricted within SafeZones to prevent abuse.

---

### `PiggyBack`
- **Description**: Lets one player piggyback another, adding a lighthearted or assistive RP mechanic.
- **Use Case**: Friendly interactions, escorting a tired/injured player.
- **SafeZone Behavior**: Fully functional but customizable to restrict in SafeZones if needed.

---

### `RelaxedRP-safecafe`
- **Description**: Defines SafeZone logic, with default zones like cafés, medical tents, or resting areas.
- **Use Case**: Prevents combat, aggression, and harmful interactions within peaceful RP locations.
- **Integrations**: Core system for SafeZone and NeedsZone behaviors.
- **Customizable**: Add/remove zones easily via config.

---

### `TakeHostage`
- **Description**: Enables a player to take another player hostage.
- **Use Case**: Robbery, negotiation, or high-tension RP scenarios.
- **SafeZone Behavior**: Automatically disabled inside SafeZones for fairness and immersion.

---

## ⚙️ Setup Instructions

1. Clone this repository into your server's `resources/` directory.
2. Add the resources to your `server.cfg` in this order:
   ```plaintext
   ensure RelaxedRP-safecafe
   ensure CarryPeople
   ensure PiggyBack
   ensure TakeHostage