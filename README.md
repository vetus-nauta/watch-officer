# Watch Officer

Watch Officer is a short-session 2D maritime decision simulator for calm, professional watchkeeping drills.

The project is managed as a small disciplined game studio. Before gameplay code is expanded, decisions, scope, department reports, and approved documents must live in this repository.

## Current Stage

Phase 0: project office setup.

No new game implementation should start until the office structure, product bible, and initial department reports are reviewed.

## Product Formula

Buoys define safe water. Vessels define behaviour. Radio defines discipline. Instruments define awareness. The player learns to think like a watch officer.

## Repository Map

- `PROJECT_INDEX.md`: central index for project documents.
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
