# Game Selector Portal Report

**Department:** UI/UX and HUD  
**Date:** 2026-05-26  
**Status:** Draft  
**Related task:** Add a game selection window for `game.brkovic.ltd` and bind the existing game to its own `Nav Desk` card.

## 1. Summary

The wider game portal needs a selection screen that presents each game as a separate product card. The existing game should keep its own card and route, and Watch Officer should be added as the second product card once the portal repository and route structure are confirmed.

## 2. What Was Analyzed

- Current local repository: `watch-officer`.
- Google Drive handoff: `MARITIME_DECISION_SIMULATOR_CODEX_MASTER_HANDOFF.md`.
- Public search for `game.brkovic.ltd` and related GitHub repositories.

## 3. Findings

- The current local repository is a new Vite starter and appears to be the second product workspace.
- The master handoff requires project office setup before game implementation.
- No portal repository or existing game route was discoverable from public search in this environment.

## 4. Risks / Contradictions

- Implementing the selector inside this repository may be wrong if `game.brkovic.ltd` is served by a separate portal repository.
- Binding the existing game to a `Nav Desk` card requires its route, title, status, and card metadata.

## 5. Recommendation

Confirm the portal repository and existing game route before writing selector UI code. After confirmation, create a small `games` registry with card metadata and routes:

- Existing game: title, route, status, short description, card label `Nav Desk`.
- Watch Officer: title, route, status, short description, card label `Watch Officer`.

## 6. Required Decision From Game Director

Decide whether the game selection window belongs in:

- the existing `game.brkovic.ltd` portal repository, or
- this `watch-officer` repository as a standalone entry page.

## 7. Files To Update If Approved

Depends on the confirmed repository. In this repository, likely targets would be `index.html`, `src/main.js`, `public/style.css`, and a new game registry module.
