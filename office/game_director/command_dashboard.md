# Command Dashboard

**Owner:** Game Director  
**Updated:** 2026-05-26  
**Purpose:** Single operational dashboard for managing Codex chats, department tasks, reports, blockers, and approved decisions.

## Current Command State

| Area | Status | Owner Chat | Next Output | Blocker |
| --- | --- | --- | --- | --- |
| Project office | Active | Game Director | Initial structure review | None |
| Product bible | Draft | Documentation / Game Director | Product bible review report | Needs approval |
| Gameplay rules | Not started | Gameplay & Maritime Rules | MVP maritime rules report | Needs assigned chat |
| UI/UX HUD | Draft | UI/UX & HUD | Heading-up layout report | Needs assigned chat |
| Engine plan | Draft | Engine / Godot | Prototype architecture report | Needs assigned chat |
| QA validation | Draft | QA / Validation | Rule validation checklist review | Needs assigned chat |
| Portal selector | Blocked | UI/UX & HUD | Portal route contract | Portal repository unknown |

## Decision Queue

| ID | Decision Needed | Status | Target File |
| --- | --- | --- | --- |
| DQ-001 | Confirm whether Watch Officer is final working name | Open | `product_bible/vision.md` |
| DQ-002 | Confirm first IALA region for MVP | Open | `design/systems/navigation_system.md` |
| DQ-003 | Confirm portal repository for `game.brkovic.ltd` | Open | `office/ui_ux_hud/reports/2026-05-26-game-selector-portal-report.md` |
| DQ-004 | Confirm whether dashboard stays markdown-only or gets a local web UI | Open | `office/game_director/command_dashboard.md` |

## Active Blockers

| ID | Blocker | Impact | Owner | Next Action |
| --- | --- | --- | --- | --- |
| BLK-001 | Portal repository not identified | Cannot implement game selector or bind existing game to `Nav Desk` card | Game Director | Ask user or locate repository |
| BLK-002 | Maritime rules not verified | Cannot present rules as final training content | QA / Gameplay | Create first validation report |
| BLK-003 | MVP orientation not approved | UI and engine prototype may diverge | Game Director | Approve heading-up lower-third rule |

## Report Intake

Every department chat must return a report using `office/documentation_knowledge_base/report_templates.md`.

Minimum report fields:

- Summary.
- What was analyzed.
- Findings.
- Risks or contradictions.
- Recommendation.
- Required Game Director decision.
- Files to update if approved.

## Operating Rule

No department chat edits another department's source of truth directly. It writes a report first. Game Director approves, rejects, or assigns follow-up work.
