# DromsTrashKillCount

A World of Warcraft 3.3.5 addon that counts trash (non-boss) mob kills in instances.

## Features
- Tracks trash kills (excluding bosses) in party and raid instances.
- Displays a small movable frame with the current instance's trash kill count.
- Hovering over the frame shows a tooltip with the last 3 instances and their total trash kills.
- Slash command `/tkc reset` to clear stored data.

## Installation
1. Copy the `DromsTrashKillCount` folder into your `Interface/AddOns` directory.
2. Restart WoW or reload your UI.

## Usage
- Enter an instance and kill trash mobs. The frame will update automatically.
- Hover over the frame to see the last 3 instances' trash kill counts.
- Use `/tkc reset` to clear all data.

## Notes
- Boss detection uses an internal list; you can expand it by adding boss NPC IDs in the code for more accuracy.
- Data is stored per character in `DromsTrashKillCountDB`.
