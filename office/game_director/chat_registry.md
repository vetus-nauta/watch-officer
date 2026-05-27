# Chat Registry

**Owner:** Game Director  
**Updated:** 2026-05-26  
**Purpose:** Registry of Codex chats/dialog windows and their responsibilities.

## Chat Model

Each chat is treated like a department desk. It has a narrow responsibility, input documents, expected output, boundaries, and status.

## Registered Chats

| Chat ID | Name | Role | Status | Folder | Output |
| --- | --- | --- | --- | --- | --- |
| CHAT-GD-001 | Game Director | Final direction, decisions, task assignment, conflict resolution | Active | `office/game_director/` | Decisions, roadmap, task board |
| CHAT-GP-001 | Gameplay & Maritime Rules | IALA/MAMS, COLREGS abstraction, scenarios, traffic, VHF/VTS rules | Ready to assign | `office/gameplay_maritime_rules/` | Gameplay rule reports |
| CHAT-UX-001 | UI/UX & HUD | Heading-up display, lower-third vessel placement, HUD, AIS overlay, mobile ergonomics | Ready to assign | `office/ui_ux_hud/` | Screen layout reports |
| CHAT-ENG-001 | Engine / Godot | Project structure, scenes, movement, camera, runtime, export strategy | Ready to assign | `office/engine_godot/` | Technical prototype reports |
| CHAT-ART-001 | Art / Visual Direction | Vessel icons, buoy readability, palette, day/night visual language | Ready to assign | `office/art_visual_direction/` | Art direction reports |
| CHAT-DOC-001 | Documentation Knowledge Base | Indexes, naming, templates, changelog, handoffs | Ready to assign | `office/documentation_knowledge_base/` | Clean approved docs |
| CHAT-QA-001 | QA / Validation | Contradiction checks, rule verification, scenario validation, UI readability | Ready to assign | `office/qa_validation/` | QA reports and checklists |
| CHAT-PORTAL-001 | Portal Integration | `game.brkovic.ltd` selector, existing game binding, `Nav Desk` card contract | Blocked | TBD | Portal integration report |

## Chat Boundaries

### Game Director

Can approve decisions, assign tasks, update roadmap, and resolve contradictions. Does not invent hidden implementation direction without recording a decision.

### Gameplay & Maritime Rules

Can draft rule logic and scenario requirements. Does not write engine code or final UI layout.

### UI/UX & HUD

Can design screens and interaction rules. Does not change maritime rule logic.

### Engine / Godot

Can propose implementation architecture. Does not change product scope or maritime training claims.

### Art / Visual Direction

Can define visual readability and style. Does not change gameplay mechanics.

### Documentation Knowledge Base

Can clean and consolidate approved documents. Does not create new product direction.

### QA / Validation

Can find issues, contradictions, and risks. Does not implement fixes directly.

### Portal Integration

Can define and implement selector integration only after the portal repository and route contract are known.

## Starting A New Chat

Use `office/game_director/chat_assignment_template.md`.
