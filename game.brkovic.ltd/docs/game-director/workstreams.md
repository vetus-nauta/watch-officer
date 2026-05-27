# Watch Officer Workstreams

**Owner:** ШЕФ ПРОЕКТА Watch Officer  
**Updated:** 2026-05-27

## Purpose

This chat is split into workstreams so reports from other chats do not mix into one decision pile.

## Workstreams

| Stream | Owner Chat | Current Focus | Status |
| --- | --- | --- | --- |
| GD | ШЕФ ПРОЕКТА Watch Officer | Decisions, scope, task assignment | Active |
| Gameplay | Lead Maritime Gameplay Designer | Scenario 2 Head-On Port-to-Port rules decision pack | TASK-0093 for review |
| Visual | Visual Comfort / Art Direction Lead | Watch Officer visual comfort art direction spec | TASK-0091 approved as input |
| Audio | Audio Direction / Sound Design Lead | Watch Officer focus soundscape and sound design spec | TASK-0092 approved as input |
| UI/HUD | UI/UX HUD Designer | Scenario 1 decision coaching UX spec approved | TASK-0079 approved |
| Engine | Engine / Godot Architect | Scenario 1 decision coaching artifact handoff passed | TASK-0086 passed |
| QA | Maritime QA / Validation | Scenario 1 decision coaching production smoke | TASK-0090 approved |
| Maritime Audit | Maritime Rules Auditor | Scenario 2 Head-On Port-to-Port maritime audit | TASK-0094 assigned |
| Platform | Game Platform | Scenario 1 decision coaching staged public candidate updated | TASK-0087 passed |
| Platform Deploy | Platform Deployment Officer | Scenario 1 decision coaching production deploy passed | TASK-0089 passed |
| Platform Auth | Platform Auth | One-off private access for Captain Ether Batch 004 completed | TASK-0076 closed |
| Captain Ether | Captain Ether Owner | Batch 004 production smoke closed | TASK-0078 approved |

## Rule

Each stream writes reports inside its own scope. Game Director turns reports into decisions in `decision-log.md`.

Role chats must not paste full reports into chat. They must write the report file, then return only the short status defined in `docs/game-director/chat-reporting-rules.md`.

Task prompts sent to other chats must end at the assignment boundary. Do not add commentary below the task block.

## Current Gameplay Decision

MVP Watch Officer uses IALA Region A only.

Scenario data must still declare:

```json
{
  "iala_region": "A"
}
```

Region B support is not part of MVP, but the data model must not block future Region B scenarios.

## Current Handoff

`docs/watch-officer/mvp-maritime-rules-report.md` is now the input document for:

- UI/HUD.
- Engine / Godot.
- QA / Validation.

`docs/watch-officer/ui-hud-mvp-report.md` is now also an input document for:

- Engine / Godot.
- QA / Validation.

`docs/watch-officer/engine-godot-prototype-report.md` is now also an input document for:

- QA / Validation.

`docs/watch-officer/qa-validation-mvp-report.md` is now the review document for Game Director first-scenario decisions.

`docs/game-director/first-scenario-decision-pack-2026-05-26.md` resolves the first batch of QA open decisions for scenario 1.

`docs/game-director/prototype-scaffolding-readiness-2026-05-26.md` confirms Engine/QA blockers are removed for creating a scaffold task.

`game.brkovic.ltd/prototypes/watch-officer-godot/` now contains the first scaffold.

`docs/game-director/scenario-schema-validation-2026-05-26.md` confirms scenario/schema validation passed.

`docs/watch-officer/qa-safe-water-geometry-monitor-review.md` approves the safe-water geometry monitor for the next Engine slice.

`docs/watch-officer/qa-local-web-export-artifact-review.md` approves local Web export behavior for Game Director public integration decision.

Captain Ether Batch 004 production smoke is closed as PASS by TASK-0078. Watch Officer Scenario 1 Decision Coaching is approved as a public production prototype by TASK-0090. Visual Comfort TASK-0091 and Audio Direction TASK-0092 are approved as direction inputs, not implementation approvals. Gameplay completed TASK-0093 for Scenario 2 Head-On Port-to-Port rules decision pack; Maritime Rules Auditor owns TASK-0094 to resolve rule-threshold, wording, and algorithm-boundary questions before implementation. Final maritime training approval remains closed.
