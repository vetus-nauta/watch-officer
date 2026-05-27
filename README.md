# Watch Officer

Watch Officer is a short-session 2D maritime decision simulator for calm, professional watchkeeping drills.

The project is managed as a small disciplined game studio. Before gameplay code is expanded, decisions, scope, department reports, and approved documents must live in this repository.

## Current Stage

Scenario 1 is approved as a public production prototype. Scenario 2 is in rules/audit planning.

New gameplay implementation should start only after Game Director task assignment and the required review gate.

## Product Formula

Buoys define safe water. Vessels define behaviour. Radio defines discipline. Instruments define awareness. The player learns to think like a watch officer.

## Repository Map

- `PROJECT_INDEX.md`: central index for project documents.
- `game.brkovic.ltd/docs/watch-officer/`: current Watch Officer product reports, QA reports, specs, and production status.
- `game.brkovic.ltd/docs/game-director/`: Game Director decisions, task assignments, registries, and operating rules.
- `game.brkovic.ltd/docs/roles/`: role cabinets for Visual, Audio, Maritime Rules Auditor, and future role chats.
- `game.brkovic.ltd/prototypes/watch-officer-godot/`: Godot prototype source and tests.
- `game.brkovic.ltd/public/play/watch-officer/`: current Watch Officer Web build/site artifacts.
- `office/game_director/`: final product direction, decisions, roadmap, risks, and task board.
- `office/gameplay_maritime_rules/`: IALA/MAMS, COLREGS, scenarios, VHF/VTS rules, and gameplay logic.
- `office/ui_ux_hud/`: screen architecture, HUD, mobile ergonomics, and interaction layouts.
- `office/engine_godot/`: engine architecture and prototype planning.
- `office/art_visual_direction/`: visual style, readability, vessel and buoy visual language.
- `office/documentation_knowledge_base/`: naming, templates, glossary, changelog, and documentation governance.
- `office/qa_validation/`: rule validation, contradiction checks, and scenario test reports.
- `product_bible/`: approved product foundation.
- `design/`: scenario and system design documents.
- `prototype/`: future technical prototype notes.
- `assets_reference/`: reference materials only.
- `archive/`: superseded decisions and old documents.

## Immediate Rule

Do not turn maritime rules into unverified educational truth. Any uncertain maritime rule must be marked as requiring verification and reviewed before it is used as final training content.

## Shared SEO Office

This repository is attached to the shared Brkovic SEO office:

```text
/home/alexey/GitHub/BRKOVIC_SEO_OFFICE
```

Project SEO brief:

```text
docs/SEO_BRIEF.md
```

Planned public routes:

- `https://game.brkovic.ltd/games/watch-officer`
- `https://game.brkovic.ltd/play/watch-officer/` for approved playable artifacts

SEO rules:

- keep public pages indexable only when real content exists;
- keep admin, API, accounts, private profiles, test builds, raw storage, and debug logs out of search;
- do not publish fake screenshots, fake trailers, or thin keyword pages;
- English is the fallback public language until real localized pages exist;
- never present draft maritime training as final validated instruction.

## GitHub Sync Rule

This repository is the parallel GitHub home for Watch Officer:

```text
git@github.com:vetus-nauta/watch-officer.git
```

All approved Watch Officer project material and the Watch Officer site/build must be committed and pushed here in parallel with project work.

Include Watch Officer docs, role cabinets, task assignments, reports, Godot prototype source/tests, and `game.brkovic.ltd/public/play/watch-officer/` site artifacts.

Do not include secrets, FTP credentials, private config, unrelated `brkovic-ltd` files, Captain Ether implementation, Nav Desk work, generated `.godot/`, local export cache, `node_modules`, or placeholder WebStorm scaffold unless explicitly approved.
