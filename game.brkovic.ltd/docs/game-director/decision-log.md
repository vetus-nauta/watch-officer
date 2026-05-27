# Game Director Decision Log

## GD-DECISION-20260526-01 - Repository And Route Structure Approved

**Date:** 2026-05-26  
**Status:** Approved by CEO  
**Area:** Platform / Repository / Routing  
**Decision:** Use `brkovic-ltd` as the canonical repository. Keep the game platform inside it as `game.brkovic.ltd`. Use the game platform root as a game selection hub. Route Captain Ether through `/games/captain-ether` and Watch Officer through `/games/watch-officer`.  
**Reason:** This avoids confusion between `Revoyacht`, old staging paths, the main site, and the game platform. It also gives each game its own route and card.  
**Consequences:** Older references to `/home/alexey/GitHub/Revoyacht/game-brkovic-ltd` are deprecated. New work starts from `PATHS_QUICK.md`.  
**Related files:** `PATHS_QUICK.md`, `REPOSITORY_MAP.md`, `game.brkovic.ltd/PATHS.md`

## GD-DECISION-20260526-02 - Watch Officer Enters Pre-Production

**Date:** 2026-05-26  
**Status:** Approved by Game Director  
**Area:** Product  
**Decision:** Watch Officer is registered as the second product in `game.brkovic.ltd`, but gameplay code is not started until product bible, MVP brief, first 5 minutes, maritime rules report, UI/HUD report, engine plan, and QA validation checklist are reviewed.  
**Reason:** The product depends on verified maritime logic and tight scope control. Starting with code would increase the risk of building an attractive but educationally weak simulator.  
**Consequences:** The current route `/games/watch-officer` remains a product card. The next work packages are reports and product documents.  
**Related files:** `docs/watch-officer/product-bible.md`, `docs/watch-officer/mvp-brief.md`, `docs/watch-officer/first-5-minutes.md`, `docs/watch-officer/scope-boundaries.md`

## GD-DECISION-20260526-03 - Platform Router Owns Deep Links

**Date:** 2026-05-26  
**Status:** Approved locally  
**Area:** Platform  
**Decision:** The shared game platform router owns deep links. `entry_route` in `content/game-registry.json` is the canonical route contract for every game. Captain Ether, Watch Officer, and future games consume routes but do not own the platform router.  
**Reason:** Direct links from Nav Desk and future cards must open the correct game or product brief without manual per-game exceptions.  
**Consequences:** `/games/captain-ether` opens Captain Ether, `/games/watch-officer` opens the Watch Officer brief, `/` remains the hub, and unknown routes render a controlled not-found screen.  
**Related files:** `docs/game-director/platform-router-contract-2026-05-26.md`, `public/assets/app.js`, `content/game-registry.json`

## GD-DECISION-20260526-04 - Nav Desk Opens Game Hub

**Date:** 2026-05-26  
**Status:** Approved by Game Director  
**Area:** Nav Desk / Platform UX  
**Decision:** The Nav Desk learning card links to the general game hub `https://game.brkovic.ltd/`, not directly to Captain Ether.  
**Reason:** Nav Desk represents a training games section, not a single game. The user should choose Captain Ether, Watch Officer, and future trainers inside the hub.  
**Consequences:** The Nav Desk card text becomes `Обучающие игры`. Captain Ether remains available at `/games/captain-ether` inside the hub and as a deep link for direct references.  
**Supersedes:** Direct Nav Desk link to `https://game.brkovic.ltd/games/captain-ether`  
**Related files:** `navdesk.html`, `PATHS_QUICK.md`, `REPOSITORY_MAP.md`

## GD-DECISION-20260526-05 - Watch Officer MVP Uses IALA Region A Only

**Date:** 2026-05-26  
**Status:** Approved by Game Director  
**Area:** Gameplay / Maritime Rules  
**Decision:** Watch Officer MVP uses IALA Region A only. Every scenario data file must still explicitly declare `iala_region: "A"` so the data model remains ready for future Region B support.  
**Reason:** Region A matches the current European/Mediterranean product context and keeps the MVP small, testable, and reviewable. Region A/B dual support would increase QA and educational risk before the first playable loop is proven.  
**Consequences:** MVP scenarios may not mix Region A and Region B. Region B is deferred. Engine and QA should validate that `iala_region` exists and is set to `"A"` for MVP scenarios.  
**Related files:** `docs/watch-officer/mvp-maritime-rules-report.md`, `docs/watch-officer/mvp-brief.md`, `docs/game-director/workstreams.md`

## GD-DECISION-20260526-06 - First Scenario Constraints Approved

**Date:** 2026-05-26  
**Status:** Approved for prototype planning  
**Area:** Scenario / Gameplay / QA  
**Decision:** The first scenario `Safe Water, Crossing Target` uses one IALA Region A lateral pair, safe corridor, shallow zone, caution buffers, one power-driven crossing target from starboard, qualitative CPA/TCPA for the player, numeric CPA/TCPA in QA/debug logs, and no VTS popup.  
**Reason:** The first prototype must validate one readable navigation-and-traffic loop before adding radio pressure or more mark types.  
**Consequences:** Scenario 1 teaches lateral corridor discipline and crossing-target awareness. VTS, cardinal marks, isolated danger marks, safe-water mark as primary lesson, hard danger polygons, and Region B are deferred. Prototype may use `rule_review_status: "draft"` only with clear non-final training wording.  
**Related files:** `docs/game-director/first-scenario-decision-pack-2026-05-26.md`, `docs/watch-officer/first-5-minutes.md`, `docs/watch-officer/qa-validation-mvp-report.md`

## GD-DECISION-20260526-07 - Watch Officer Controlled Production Deploy Approved

**Date:** 2026-05-26  
**Status:** Approved for controlled production deploy task  
**Area:** Platform / Deployment  
**Decision:** The QA-approved Watch Officer staged public candidate may be deployed to production as a prototype/draft build under `/play/watch-officer/`, with `/games/watch-officer` remaining the brief route.  
**Reason:** TASK-0062 verified required artifacts, registry/routes, app syntax, header strategy, browser canvas smoke, keyboard start/reset, draft wording, VTS inactive state, and Captain Ether route separation.  
**Consequences:** Deployment is limited to the approved files in `content/game-registry.json`, `public/assets/app.js`, and `public/play/watch-officer/`. Production deploy must verify COOP/COEP/CORP headers, `.wasm`/`.pck` MIME types, browser rendering, and Captain Ether stability. This is not final maritime training approval.  
**Related files:** `docs/game-director/watch-officer-production-deploy-decision-2026-05-26.md`, `docs/game-director/task-0063-controlled-production-deploy-watch-officer-2026-05-26.md`, `docs/watch-officer/qa-staged-public-candidate-review.md`

## GD-DECISION-20260526-08 - Watch Officer Production Prototype Requires Independent QA Smoke

**Date:** 2026-05-26  
**Status:** Assigned to QA  
**Area:** QA / Production  
**Decision:** TASK-0063 deploy report is accepted as production prototype deployment evidence, but the next gate is independent QA public production smoke via TASK-0064 before calling the production prototype accepted.  
**Reason:** Deploy chat verified the route, headers, MIME, browser smoke, and Captain Ether route, but QA must independently confirm public behavior after deployment.  
**Consequences:** Watch Officer remains prototype/draft. Final maritime training approval remains closed.  
**Related files:** `docs/watch-officer/production-deploy-watch-officer-report.md`, `docs/game-director/task-0064-qa-watch-officer-production-smoke-2026-05-26.md`

## GD-DECISION-20260526-09 - Captain Ether Production Smoke Auth Block Owned By Platform Auth

**Date:** 2026-05-26  
**Status:** Assigned to Platform Auth  
**Area:** Platform Auth / Captain Ether QA  
**Decision:** Captain Ether Batch 003 production smoke auth blocker is assigned to Platform Auth, not Captain Ether content/API. Platform Auth must provide an approved non-secret production QA login method.  
**Reason:** Captain Ether route and unauthenticated auth guard appear healthy; the remaining production smoke checks require an approved login path. Exposing `dev_code` or writing login secrets to reports would be the wrong fix.  
**Consequences:** Captain Ether QA waits for TASK-0065, then reruns the existing Batch 003 production smoke task. No auth secrets may be written into repository files, reports, screenshots, logs, or chat output.  
**Related files:** `docs/game-director/task-0065-platform-auth-captain-ether-production-qa-login-2026-05-26.md`, `content/captain-ether/roles/director-engineer/reports/platform-auth-production-qa-login-request-2026-05-27.md`

## GD-DECISION-20260526-10 - Watch Officer Production Prototype Is Live

**Date:** 2026-05-26  
**Status:** Approved as public prototype/draft  
**Area:** Watch Officer / Production QA  
**Decision:** Watch Officer production prototype is recorded as live at `/play/watch-officer/`, with `/games/watch-officer` remaining the brief route.  
**Reason:** TASK-0064 independently verified production URLs, COOP/COEP/CORP headers, `.wasm` and `.pck` MIME types, brief route behavior, Godot Web rendering, Space start, R reset, draft/non-final wording, VTS inactive state, forbidden claim absence, and Captain Ether route separation.  
**Consequences:** Watch Officer may be used as a public prototype/draft. It is not final maritime training content, not certified, and not a final COLREGS/maritime authority product.  
**Related files:** `docs/watch-officer/qa-watch-officer-production-smoke-review.md`, `docs/watch-officer/production-deploy-watch-officer-report.md`

## GD-DECISION-20260526-11 - Captain Ether Production QA Login Method Approved

**Date:** 2026-05-26  
**Status:** Approved production QA login method  
**Area:** Platform Auth / Captain Ether QA  
**Decision:** Captain Ether QA may use the approved dedicated production QA mailbox/test account access path through a private channel.  
**Reason:** Batch 003 production smoke needs authenticated QA checks, and the correct fix is a controlled QA access method, not `dev_code`, content/API changes, or secret leakage into reports.  
**Consequences:** Captain Ether QA should rerun Batch 003 production smoke as TASK-0066 after receiving private access. No login codes, sessions, cookies, SMTP details, `.netrc`, private config, player email, or identity data may be written into repo files, reports, screenshots, logs, or chat output.  
**Related files:** `docs/game-director/captain-ether-production-qa-login-decision-2026-05-26.md`, `docs/game-director/task-0066-captain-ether-qa-rerun-batch-003-production-smoke-2026-05-26.md`

## GD-DECISION-20260526-12 - Captain Ether Batch 003 Production Smoke Closed

**Date:** 2026-05-26  
**Status:** PASS / Closed  
**Area:** Captain Ether / Production QA  
**Decision:** Captain Ether Batch 003 production smoke is closed as PASS.  
**Reason:** TASK-0066 verified production route/login, intended route retention, watch lengths `12/16/20`, progressive order `word -> short_expression -> phrase`, `22` unique Batch 003 item IDs live, `132` player-facing question payloads with `0` forbidden fields, and `22/22` targeted navigation matcher checks.  
**Consequences:** The prior production auth blocker is resolved. Batch 003 can be treated as live and playable from production QA perspective. The approved private QA login method remains governed by Platform Auth secrecy rules.  
**Related files:** `content/captain-ether/roles/qa/reports/batch-003-production-smoke-2026-05-27.md`, `docs/game-director/task-0066-captain-ether-qa-rerun-batch-003-production-smoke-2026-05-26.md`

## GD-DECISION-20260526-13 - Watch Officer Next Increment Is Briefing + Result Feedback

**Date:** 2026-05-26  
**Status:** Approved for UX specification  
**Area:** Watch Officer / Product Increment  
**Decision:** The next Watch Officer prototype increment is `Briefing + Result Feedback Pack`.  
**Reason:** The first production prototype is live and technically verified. The next improvement should increase player understanding of the same scenario before adding new maritime rules, a new scenario, VTS, auth, or platform work.  
**Consequences:** UX/HUD receives TASK-0067 to specify pre-start briefing and post-attempt result feedback. Engine implementation waits for that spec. Watch Officer remains prototype/draft and not final maritime training content.  
**Related files:** `docs/game-director/watch-officer-next-prototype-increment-decision-2026-05-26.md`, `docs/game-director/task-0067-watch-officer-briefing-result-feedback-ux-spec-2026-05-26.md`

## GD-DECISION-20260526-14 - Briefing + Result Feedback Moves To Engine

**Date:** 2026-05-26  
**Status:** Assigned to Engine  
**Area:** Watch Officer / Engine  
**Decision:** TASK-0067 UX spec is accepted for Engine implementation. Engine receives TASK-0068 to implement briefing and result feedback in the local Godot prototype.  
**Reason:** UX spec preserves Engine-owned maritime logic, keeps UI display-only, keeps VTS disabled, and maintains draft/non-final training wording. The two small player-facing improvements should be implemented together because they share attempt state and result display.  
**Consequences:** TASK-0068 may touch local Godot prototype files and tests only. It may not export, deploy, touch public production files, Captain Ether, Nav Desk, router/registry, auth, or production config.  
**Related files:** `docs/watch-officer/briefing-result-feedback-ux-spec.md`, `docs/game-director/task-0068-engine-briefing-result-feedback-implementation-2026-05-26.md`

## GD-DECISION-20260526-15 - Briefing + Result Feedback Moves To QA

**Date:** 2026-05-26  
**Status:** Assigned to QA  
**Area:** Watch Officer / QA  
**Decision:** TASK-0068 implementation report is accepted for QA review. QA receives TASK-0069 to review the local Godot briefing + result feedback pack before any export/deploy decision.  
**Reason:** Engine implemented the combined pack and reported full headless regression passing, including `briefing_result_feedback_pack_test: 56 passed, 0 failed`. QA must independently verify behavior, wording, state visibility, no numeric CPA/TCPA in player result surface, VTS inactive, and no final training claims.  
**Consequences:** No export or production deploy is approved yet. Watch Officer remains live as the previous public prototype until QA and Game Director approve the next export/deploy sequence.  
**Related files:** `docs/watch-officer/briefing-result-feedback-implementation-report.md`, `docs/game-director/task-0069-qa-review-briefing-result-feedback-pack-2026-05-26.md`

## GD-DECISION-20260526-16 - Briefing + Result Feedback Approved For Local Web Export

**Date:** 2026-05-26  
**Status:** Assigned to Engine  
**Area:** Watch Officer / Export  
**Decision:** TASK-0069 QA review approves the briefing + result feedback pack for local Web export. Engine receives TASK-0070 to create a prototype-local Web export under `prototypes/watch-officer-godot/exports/web-local/`.  
**Reason:** QA verified the local implementation behavior and full headless regression, including briefing visibility, result feedback visibility, reset loop, display-only state rendering, no numeric CPA/TCPA in player result surface, VTS inactive state, and no final training claims.  
**Consequences:** TASK-0070 may update prototype-local export artifacts only. It may not touch `public/`, deploy, upload, or modify production files. Production remains on the previous live prototype until export QA and Game Director deploy decision.  
**Related files:** `docs/watch-officer/qa-briefing-result-feedback-pack-review.md`, `docs/game-director/task-0070-engine-local-web-export-briefing-result-feedback-2026-05-26.md`

## GD-DECISION-20260526-17 - Briefing + Result Feedback Local Export Moves To QA

**Date:** 2026-05-26  
**Status:** Assigned to QA  
**Area:** Watch Officer / Web Export QA  
**Decision:** TASK-0070 local Web export report is accepted for QA local browser smoke. QA receives TASK-0071 to verify the prototype-local Web export before any staged public candidate decision.  
**Reason:** Engine created the export under `prototypes/watch-officer-godot/exports/web-local/` and reported full regression passing. Browser-level smoke is required before copying artifacts into `public/` or considering production deployment.  
**Consequences:** No staged public copy, production deploy, or FTP upload is approved yet. Current production remains the previous Watch Officer prototype until QA and Game Director approve the next integration sequence.  
**Related files:** `docs/watch-officer/local-web-export-briefing-result-feedback-report.md`, `docs/game-director/task-0071-qa-local-web-export-smoke-briefing-result-feedback-2026-05-26.md`

## GD-DECISION-20260526-18 - Briefing + Result Feedback Approved For Staged Public Candidate

**Date:** 2026-05-26  
**Status:** Assigned to Platform/Engine  
**Area:** Watch Officer / Staged Public Candidate  
**Decision:** TASK-0071 QA local Web export smoke approves the briefing + result feedback pack for a local staged public candidate update. The work is split by direction: Engine receives TASK-0072 for artifact handoff, then Platform receives TASK-0073 to update `game.brkovic.ltd/public/play/watch-officer/` in the repository only.  
**Reason:** QA verified artifact presence, local HTTP serving, Web runtime headers, `.wasm` and `.pck` MIME, browser canvas ready, Space start, R reset, briefing visibility, VTS inactive state, and no final training claims.  
**Consequences:** TASK-0072 may not touch `public/`; it only produces the Engine artifact manifest. TASK-0073 may copy the approved export into the local public candidate path only. No production deploy, FTP upload, or production server change is approved.  
**Related files:** `docs/watch-officer/qa-local-web-export-briefing-result-feedback-review.md`, `docs/game-director/watch-officer-briefing-result-staged-public-decision-2026-05-26.md`, `docs/game-director/task-0072-engine-artifact-handoff-briefing-result-feedback-2026-05-26.md`, `docs/game-director/task-0073-platform-staged-public-candidate-briefing-result-feedback-2026-05-26.md`

## GD-DECISION-20260526-19 - Briefing + Result Feedback Staged Candidate Moves To QA

**Date:** 2026-05-26  
**Status:** Assigned to QA  
**Area:** Watch Officer / Staged Public QA  
**Decision:** TASK-0072 Engine handoff and TASK-0073 Platform staged public update are accepted for QA staged public smoke. QA receives TASK-0074 before any production deploy decision.  
**Reason:** Engine confirmed the approved artifact manifest and Platform updated the local staged public path without `.import` files, preserving `.htaccess`, route contract, artifact isolation, and no final-training claims.  
**Consequences:** No production deploy, FTP upload, or production server change is approved yet. Production remains the previous Watch Officer prototype until QA and Game Director approve deployment.  
**Related files:** `docs/watch-officer/staged-public-artifact-handoff-briefing-result-feedback-report.md`, `docs/watch-officer/staged-public-briefing-result-feedback-report.md`, `docs/game-director/task-0074-qa-staged-public-smoke-briefing-result-feedback-2026-05-26.md`

## GD-DECISION-20260526-20 - Briefing + Result Feedback Approved For Controlled Production Deploy

**Date:** 2026-05-26  
**Status:** Assigned to Platform Deployment Officer  
**Area:** Watch Officer / Production Deploy  
**Decision:** TASK-0074 QA staged public smoke approves the briefing + result feedback pack for controlled production deployment. Platform Deployment Officer receives TASK-0075.  
**Reason:** QA verified staged artifacts, `.import` exclusion, `.htaccess` headers/MIME, registry route preservation, forbidden claim absence, Godot artifact isolation, local HTTP/header smoke, browser brief route, canvas ready, Space start, R reset, VTS inactive state, and Captain Ether route separation.  
**Consequences:** TASK-0075 may upload only approved files under `public/play/watch-officer/`. It may not upload registry/router/auth/Captain Ether/Nav Desk/unrelated production files. Watch Officer remains prototype/draft and not final maritime training content.  
**Related files:** `docs/watch-officer/qa-staged-public-briefing-result-feedback-review.md`, `docs/game-director/watch-officer-briefing-result-production-deploy-decision-2026-05-26.md`, `docs/game-director/task-0075-controlled-production-deploy-briefing-result-feedback-2026-05-26.md`

## GD-DECISION-20260526-21 - Captain Ether Batch 004 Auth Block Owned By Platform Auth

**Date:** 2026-05-26  
**Status:** Assigned to Platform Auth  
**Area:** Platform Auth / Captain Ether QA  
**Decision:** Captain Ether Batch 004 production smoke auth blocker is assigned to Platform Auth as TASK-0076.  
**Reason:** QA confirmed the route opens, unauthenticated Captain Ether API returns `401`, production `request-code` returns HTTP `200`, and `dev_code` is not exposed. The blocker is that the approved private QA code channel returns `auth_failed` before QA can retrieve the one-time code. This is not a Captain Ether content/API issue.  
**Consequences:** Captain Ether must not solve this inside content/API or expose `dev_code`. Platform Auth must restore/replace the private code channel or provide one-off approved private access without writing secrets to repository files, reports, screenshots, logs, or chat output.  
**Related files:** `docs/game-director/task-0076-platform-auth-refresh-captain-ether-batch-004-qa-code-channel-2026-05-26.md`, `content/captain-ether/roles/director-engineer/reports/platform-auth-batch-004-production-qa-code-channel-request-2026-05-27.md`, `content/captain-ether/roles/qa/reports/batch-004-production-smoke-2026-05-27.md`

## GD-DECISION-20260526-22 - Briefing + Result Feedback Deploy Moves To QA

**Date:** 2026-05-26  
**Status:** Assigned to QA  
**Area:** Watch Officer / Production QA  
**Decision:** TASK-0075 controlled deploy report is accepted for independent QA public production smoke. QA receives TASK-0077.  
**Reason:** Deploy Officer uploaded only approved Watch Officer artifacts, backed up overwritten files, verified production URLs, COOP/COEP/CORP headers, `.wasm` and `.pck` MIME types, browser canvas, briefing visibility, Space start, R reset, VTS inactive state, forbidden claim absence, and Captain Ether route availability.  
**Consequences:** Watch Officer production update is not closed until TASK-0077 QA confirms it independently. Watch Officer remains prototype/draft and not final maritime training content.  
**Related files:** `docs/watch-officer/production-deploy-briefing-result-feedback-report.md`, `docs/game-director/task-0077-qa-production-smoke-briefing-result-feedback-2026-05-26.md`

## GD-DECISION-20260526-23 - Captain Ether Batch 004 One-Off QA Access Approved

**Date:** 2026-05-26  
**Status:** Approved / Assigned to Captain Ether QA  
**Area:** Platform Auth / Captain Ether QA  
**Decision:** Platform Auth approved one-off private production QA access for Captain Ether Batch 004 production smoke, and Captain Ether QA receives TASK-0078 to rerun the existing smoke task.  
**Reason:** TASK-0076 confirms the blocker is the private QA access channel, not a proven Captain Ether content/API/runtime issue. The correct path is private access handoff without exposing `dev_code` or writing secrets into project artifacts.  
**Consequences:** Captain Ether QA may rerun Batch 004 production smoke after private access handoff. No login codes, sessions, cookies, CSRF values, SMTP details, `.netrc`, private config, player email, player identity data, or other secrets may be written into repository files, reports, screenshots, logs, or chat output.  
**Related files:** `docs/game-director/captain-ether-batch-004-production-qa-code-channel-decision-2026-05-26.md`, `docs/game-director/task-0078-captain-ether-qa-rerun-batch-004-production-smoke-2026-05-26.md`

## GD-DECISION-20260526-24 - Watch Officer Briefing + Result Feedback Production Update Closed

**Date:** 2026-05-26  
**Status:** Approved production prototype update  
**Area:** Watch Officer / Production QA  
**Decision:** Watch Officer `Briefing + Result Feedback Pack` production update is closed as approved.  
**Reason:** TASK-0077 independently verified public production routes, required artifacts, COOP/COEP/CORP headers, `.wasm` and `.pck` MIME types, browser canvas rendering, ready briefing, Space start, R reset, VTS inactive state, no forbidden final-training claims, and Captain Ether route separation.  
**Consequences:** Watch Officer production prototype now includes briefing + result feedback improvements. It remains prototype/draft content only; final maritime training approval remains closed.  
**Related files:** `docs/watch-officer/qa-production-briefing-result-feedback-review.md`, `docs/watch-officer/production-deploy-briefing-result-feedback-report.md`

## GD-DECISION-20260526-25 - Captain Ether Batch 004 Production Smoke Closed

**Date:** 2026-05-26  
**Status:** PASS / Closed  
**Area:** Captain Ether / Production QA  
**Decision:** Captain Ether Batch 004 production smoke is closed as PASS.  
**Reason:** TASK-0078 verified production route/login, intended route retention, watch lengths `12/16/20`, progressive order `word -> short_expression -> phrase`, `24` unique Batch 004 item IDs live, `284` player-facing question payloads with `0` forbidden fields, and `31/31` targeted Safety/Securite matcher checks.  
**Consequences:** Batch 004 can be treated as live and playable from production QA perspective. The one-off private QA access was used only for this smoke and must not be reused without a new Platform Auth decision. No secrets were written into reports, repository files, screenshots, logs, or chat output.  
**Related files:** `content/captain-ether/roles/qa/reports/batch-004-production-smoke-2026-05-27.md`, `docs/game-director/task-0078-captain-ether-qa-rerun-batch-004-production-smoke-2026-05-26.md`

## GD-DECISION-20260526-26 - Watch Officer Next Increment Is Decision Coaching

**Date:** 2026-05-26  
**Status:** Approved for UX specification  
**Area:** Watch Officer / Product Increment  
**Decision:** The next Watch Officer prototype increment is `Scenario 1 Decision Coaching Pack`, assigned first to UI/HUD as TASK-0079.  
**Reason:** The production prototype already has the first scenario, runtime state, warnings, result evaluation, briefing, and result feedback. The next most valuable step is to make the same scenario clearer as a training drill by improving in-run coaching cues and post-attempt reasons, without opening new scenario, VTS, auth, router, or deploy work.  
**Consequences:** UI/HUD creates a display-only spec for coaching cues and result-reason presentation. Engine implementation waits for Game Director acceptance of the spec. Watch Officer remains prototype/draft and not final maritime training content.  
**Related files:** `docs/game-director/watch-officer-decision-coaching-increment-decision-2026-05-26.md`, `docs/game-director/task-0079-watch-officer-scenario-one-decision-coaching-ux-spec-2026-05-26.md`

## GD-DECISION-20260526-27 - Decision Coaching Moves To Engine

**Date:** 2026-05-26  
**Status:** Assigned to Engine  
**Area:** Watch Officer / Engine  
**Decision:** TASK-0079 UX spec is accepted for Engine implementation. Engine receives TASK-0080 to implement the `Scenario 1 Decision Coaching Pack` in the local Godot prototype.  
**Reason:** The UX spec keeps UI/HUD display-only, uses Engine-owned safe-water/CPA/warning/result state, preserves VTS disabled for scenario 1, hides numeric CPA/TCPA from player mode, and keeps draft/non-final training wording.  
**Consequences:** TASK-0080 may touch local Godot prototype files and tests only. It may not export, deploy, copy to `public/`, touch Captain Ether, Nav Desk, router/registry, auth, production config, or FTP.  
**Related files:** `docs/watch-officer/scenario-one-decision-coaching-ux-spec.md`, `docs/game-director/task-0080-engine-scenario-one-decision-coaching-pack-2026-05-26.md`

## GD-DECISION-20260526-28 - Decision Coaching Moves To QA

**Date:** 2026-05-26  
**Status:** Assigned to QA  
**Area:** Watch Officer / QA  
**Decision:** TASK-0080 implementation report is accepted for QA review. QA receives TASK-0081 to verify the local Scenario 1 Decision Coaching Pack before any export/deploy decision.  
**Reason:** Engine implemented display-only coaching cues and result reasons, preserved VTS disabled, avoided player-facing numeric CPA/TCPA/debug fields, and reported full headless regression passing, including `scenario_one_decision_coaching_pack_test: 74 passed, 0 failed`.  
**Consequences:** No export, public copy, production deploy, or FTP work is approved yet. Watch Officer production remains on the previously approved briefing/result feedback build until QA and Game Director approve the next export/deploy sequence.  
**Related files:** `docs/watch-officer/scenario-one-decision-coaching-implementation-report.md`, `docs/game-director/task-0081-qa-review-scenario-one-decision-coaching-pack-2026-05-26.md`

## GD-DECISION-20260526-29 - Decision Coaching Approved For Local Web Export

**Date:** 2026-05-26  
**Status:** Assigned to Engine  
**Area:** Watch Officer / Export  
**Decision:** TASK-0081 QA review approves the Scenario 1 Decision Coaching Pack for local Web export. Engine receives TASK-0082 to export only under `prototypes/watch-officer-godot/exports/web-local/`.  
**Reason:** QA verified the coaching rail, cue limits, reset behavior, display-only boundaries, hidden debug data boundaries, VTS inactive state, no new scenario, no new maritime rule, and no final-training claims. Full headless regression passed, including `scenario_one_decision_coaching_pack_test: 74 passed, 0 failed`.  
**Consequences:** TASK-0082 may update prototype-local export artifacts only. It may not copy to `public/`, deploy, use FTP, or touch Captain Ether, Nav Desk, router/registry, auth, production config, or production files.  
**Related files:** `docs/watch-officer/qa-scenario-one-decision-coaching-pack-review.md`, `docs/game-director/watch-officer-decision-coaching-local-export-decision-2026-05-26.md`, `docs/game-director/task-0082-engine-local-web-export-scenario-one-decision-coaching-2026-05-26.md`

## GD-DECISION-20260526-30 - Decision Coaching Local Export Moves To QA

**Date:** 2026-05-26  
**Status:** Assigned to QA  
**Area:** Watch Officer / Web Export QA  
**Decision:** TASK-0082 local Web export report is accepted for QA local browser smoke. QA receives TASK-0083 to verify the exported Scenario 1 Decision Coaching Pack before any staged public candidate decision.  
**Reason:** Engine exported only to `prototypes/watch-officer-godot/exports/web-local/`, confirmed required Web artifacts, and reported full headless regression passing. Browser-level local smoke is required before copying artifacts into `public/`.  
**Consequences:** No staged public copy, production deploy, FTP upload, or production server change is approved yet. Current production remains the previously approved briefing/result feedback build until QA and Game Director approve the next integration sequence.  
**Related files:** `docs/watch-officer/local-web-export-scenario-one-decision-coaching-report.md`, `docs/game-director/task-0083-qa-local-web-export-smoke-scenario-one-decision-coaching-2026-05-26.md`

## GD-DECISION-20260527-31 - Opening Cue Visibility Fix Assigned

**Date:** 2026-05-27  
**Status:** Assigned to Engine  
**Area:** Watch Officer / Engine / Web Export QA  
**Decision:** TASK-0083 local Web export smoke is accepted as `changes-required`; Engine receives TASK-0084 to make the opening lateral-pair cue browser-visible long enough and rerun the prototype-local Web export.  
**Reason:** QA verified the local export broadly, but the opening cue `Read the lateral pair. Stay in the marked corridor.` was not observable in normal browser smoke. The exported build advanced directly to `Monitor the crossing target. CPA safe | Draft training`, including immediate and CPU-throttled screenshot attempts.  
**Consequences:** No staged public candidate, public copy, production deploy, FTP upload, or production server change is approved. Engine may make a narrow local prototype fix and rerun local export only under `prototypes/watch-officer-godot/exports/web-local/`.  
**Related files:** `docs/watch-officer/qa-local-web-export-scenario-one-decision-coaching-review.md`, `docs/game-director/task-0084-engine-fix-opening-cue-and-rerun-local-export-2026-05-27.md`

## GD-DECISION-20260527-32 - Opening Cue Fix Moves To QA Rerun

**Date:** 2026-05-27  
**Status:** Assigned to QA  
**Area:** Watch Officer / Web Export QA  
**Decision:** TASK-0084 opening cue visibility fix and local export rerun are accepted for QA rerun. QA receives TASK-0085 to verify the exported browser flow before any staged public candidate decision.  
**Reason:** Engine added a 40 fixed-tick opening cue hold, preserved higher-priority warning/result overrides, reran full headless regression, and rebuilt the local Web export under `prototypes/watch-officer-godot/exports/web-local/`. The focused decision coaching test now reports `78 passed, 0 failed`.  
**Consequences:** No staged public copy, production deploy, FTP upload, or production server change is approved yet. QA must confirm the opening cue is observable in browser export and that core local Web smoke remains clean.  
**Related files:** `docs/watch-officer/opening-cue-visibility-fix-local-export-report.md`, `docs/game-director/task-0085-qa-rerun-local-web-export-opening-cue-smoke-2026-05-27.md`

## GD-DECISION-20260527-33 - Decision Coaching Approved For Staged Public Candidate

**Date:** 2026-05-27  
**Status:** Assigned to Engine / Platform  
**Area:** Watch Officer / Staged Public Candidate  
**Decision:** TASK-0085 QA rerun approves the Scenario 1 Decision Coaching Pack for a local staged public candidate update. The work is split by direction: Engine receives TASK-0086 for artifact handoff, then Platform receives TASK-0087 to update `game.brkovic.ltd/public/play/watch-officer/` in the repository only.  
**Reason:** QA verified the opening cue is visible in browser export, remains observable through the early-running hold window at tick `36` / time `1.80s`, later progresses to target monitoring, preserves cue count limits, hides debug/numeric player-facing fields, keeps VTS inactive, passes reset behavior, and has no forbidden final-training claims.  
**Consequences:** TASK-0086 may not touch `public/`; it only produces the Engine artifact manifest. TASK-0087 may copy the approved export into the local public candidate path only. No production deploy, FTP upload, or production server change is approved.  
**Related files:** `docs/watch-officer/qa-local-web-export-opening-cue-rerun-review.md`, `docs/game-director/watch-officer-decision-coaching-staged-public-decision-2026-05-27.md`, `docs/game-director/task-0086-engine-artifact-handoff-scenario-one-decision-coaching-2026-05-27.md`, `docs/game-director/task-0087-platform-staged-public-candidate-scenario-one-decision-coaching-2026-05-27.md`

## GD-DECISION-20260527-34 - Decision Coaching Handoff Moves To Platform

**Date:** 2026-05-27  
**Status:** Assigned to Platform  
**Area:** Watch Officer / Staged Public Candidate  
**Decision:** TASK-0086 Engine artifact handoff is accepted. Platform receives TASK-0087 to update the local staged public candidate path `game.brkovic.ltd/public/play/watch-officer/` from the approved export manifest.  
**Reason:** Engine confirmed the TASK-0084/TASK-0085 approved export path, required Web artifacts, file sizes, copy list, and `.import` exclusion list, with `artifact_handoff_check: 12 passed, 0 failed`.  
**Consequences:** Platform may copy only the approved artifacts into the local staged public path and preserve `.htaccess`. No production deploy, FTP upload, or production server change is approved.  
**Related files:** `docs/watch-officer/staged-public-artifact-handoff-scenario-one-decision-coaching-report.md`, `docs/game-director/task-0087-platform-staged-public-candidate-scenario-one-decision-coaching-2026-05-27.md`

## GD-DECISION-20260527-35 - Decision Coaching Staged Candidate Moves To QA

**Date:** 2026-05-27  
**Status:** Assigned to QA  
**Area:** Watch Officer / Staged Public QA  
**Decision:** TASK-0087 Platform staged public update is accepted for QA staged public smoke. QA receives TASK-0088 before any production deploy decision.  
**Reason:** Platform copied only approved artifacts, preserved `.htaccess`, excluded `.import` metadata, preserved route contract, kept Godot artifacts isolated, passed local header/MIME smoke, and did not deploy or touch production files.  
**Consequences:** No production deploy, FTP upload, or production server change is approved yet. Production remains the previously approved Watch Officer build until QA and Game Director approve deployment.  
**Related files:** `docs/watch-officer/staged-public-scenario-one-decision-coaching-report.md`, `docs/game-director/task-0088-qa-staged-public-smoke-scenario-one-decision-coaching-2026-05-27.md`

## GD-DECISION-20260527-36 - Decision Coaching Approved For Controlled Production Deploy

**Date:** 2026-05-27  
**Status:** Assigned to Platform Deployment Officer  
**Area:** Watch Officer / Production Deploy  
**Decision:** TASK-0088 QA staged public smoke approves the Scenario 1 Decision Coaching Pack for controlled production deployment. Platform Deployment Officer receives TASK-0089.  
**Reason:** QA verified staged artifacts, `.import` exclusion, `.htaccess` headers/MIME, route preservation, HTTP artifacts, browser canvas, ready briefing, Space start, opening lateral-pair cue immediate and hold-window visibility, later target monitoring cue, reset behavior, no forbidden claims, and Captain Ether route separation.  
**Consequences:** TASK-0089 may upload only approved files under `public/play/watch-officer/`. It may not upload registry/router/auth/Captain Ether/Nav Desk/unrelated production files. Watch Officer remains prototype/draft and not final maritime training content.  
**Related files:** `docs/watch-officer/qa-staged-public-scenario-one-decision-coaching-review.md`, `docs/game-director/watch-officer-decision-coaching-production-deploy-decision-2026-05-27.md`, `docs/game-director/task-0089-controlled-production-deploy-scenario-one-decision-coaching-2026-05-27.md`

## GD-DECISION-20260527-37 - Decision Coaching Production Deploy Moves To QA

**Date:** 2026-05-27  
**Status:** Assigned to QA  
**Area:** Watch Officer / Production QA  
**Decision:** TASK-0089 production deploy report is accepted as passed. QA receives TASK-0090 to run independent public production smoke for the deployed Scenario 1 Decision Coaching Pack.  
**Reason:** Platform Deployment Officer uploaded only approved Watch Officer Web artifacts, preserved Captain Ether/Nav Desk/router/registry/auth/unrelated production config boundaries, confirmed production URL/header/MIME checks, and passed production browser smoke including opening lateral-pair cue visibility, hold-window visibility, later target-monitoring cue, R reset, VTS inactive state, and Captain Ether route separation.  
**Consequences:** Watch Officer remains a public prototype/draft until QA completes TASK-0090 and Game Director records the production prototype status. Final maritime training approval remains closed. No deploy, FTP upload, production edit, product code edit, Captain Ether change, Nav Desk change, router/registry change, auth change, or production config change is assigned to QA.  
**Related files:** `docs/watch-officer/production-deploy-scenario-one-decision-coaching-report.md`, `docs/game-director/task-0090-qa-production-smoke-scenario-one-decision-coaching-2026-05-27.md`

## GD-DECISION-20260527-38 - Visual Comfort Spec Starts Before Scenario 2

**Date:** 2026-05-27  
**Status:** Assigned to Visual Comfort  
**Area:** Watch Officer / Visual Direction  
**Decision:** CHAT-VISUAL-001 receives TASK-0091 to create the first Watch Officer visual comfort / art direction spec before Scenario 2 implementation begins.  
**Reason:** The prototype is now functional enough that visual comfort rules should be fixed before the next scenario adds more visible complexity. This prevents drift toward cartoon, harsh CAD, thin-line engineering, or noisy arcade UI while preserving the soft professional maritime simulator direction.  
**Consequences:** TASK-0091 is documentation-only. It may not touch code, scenes, assets, exports, public files, production files, deploy/FTP, Captain Ether, Nav Desk, router/registry, auth, production config, scenario data, maritime logic, or final training claims. TASK-0090 remains the independent production QA gate for Scenario 1.  
**Related files:** `docs/roles/visual-comfort-art-direction/first-brief.md`, `docs/game-director/task-0091-visual-comfort-art-direction-spec-2026-05-27.md`

## GD-DECISION-20260527-39 - Maritime Rules Auditor Cabinet Prepared

**Date:** 2026-05-27  
**Status:** Prepared, not activated  
**Area:** Watch Officer / Maritime Rules Audit  
**Decision:** A future `CHAT-MARITIME-RULES-001` cabinet is prepared for Maritime Rules Auditor work covering COLREGS/MPPSS, IALA/MAMS, scenario-rule audits, algorithm boundaries, wording safety, and draft/non-final training limits.  
**Reason:** This separates implementation QA from maritime-rule authority review. QA verifies behavior and regressions; Maritime Rules Auditor will review rule traceability, algorithm boundaries, learner wording, and overclaim risk when activated by Game Director.  
**Consequences:** The role is not activated and has no current product task. It may not edit code, scenario logic, public files, production files, Captain Ether, Nav Desk, router/registry, auth, deployment, FTP, or final maritime training claims unless explicitly assigned.  
**Related files:** `docs/roles/maritime-rules-auditor/README.md`, `docs/roles/maritime-rules-auditor/rules.md`, `docs/roles/maritime-rules-auditor/onboarding.md`, `docs/roles/maritime-rules-auditor/handoff.md`, `docs/roles/maritime-rules-auditor/first-brief.md`

## GD-DECISION-20260527-40 - Audio Direction Starts As Focus Soundscape Spec

**Date:** 2026-05-27  
**Status:** Assigned to Audio Direction  
**Area:** Watch Officer / Audio Direction  
**Decision:** CHAT-AUDIO-001 is prepared and receives TASK-0092 to create the first Watch Officer audio direction and sound design spec.  
**Reason:** Watch Officer needs calm focus music, maritime ambience, system sounds, success/fail feedback, and warning audio rules before audio assets are produced. The first pass must define psychological comfort, one-hour loop structure, ambience layers, and accessibility boundaries without creating files or touching runtime systems.  
**Consequences:** TASK-0092 is documentation-only. It may not create audio files, edit code, scenes, assets, exports, public files, production files, deploy/FTP, Captain Ether, Nav Desk, router/registry, auth, production config, scenario data, maritime logic, VTS/radio chatter, or final training claims.  
**Related files:** `docs/roles/audio-direction-sound-design/README.md`, `docs/roles/audio-direction-sound-design/rules.md`, `docs/roles/audio-direction-sound-design/onboarding.md`, `docs/roles/audio-direction-sound-design/handoff.md`, `docs/roles/audio-direction-sound-design/first-brief.md`, `docs/game-director/task-0092-audio-direction-sound-design-spec-2026-05-27.md`

## GD-DECISION-20260527-41 - Audio Direction Spec Ready For Review

**Date:** 2026-05-27  
**Status:** For Review  
**Area:** Watch Officer / Audio Direction  
**Decision:** TASK-0092 output is accepted as ready for Game Director review.  
**Reason:** The audio spec defines calm professional maritime focus, one-hour loop planning, maritime ambience layers, water/wind/birds treatment, UI/system sounds, success/fail/correction sounds, warning sound escalation, mute/reduction rules, browser considerations, and QA acceptance criteria without creating audio files or touching implementation.  
**Consequences:** No audio implementation, asset generation, Engine hook, export, deploy, or production change is approved yet. Visual comfort and QA production smoke remain active parallel gates.  
**Related files:** `docs/watch-officer/audio-direction-sound-design-spec.md`

## GD-DECISION-20260527-42 - Visual Comfort Spec Ready For Review

**Date:** 2026-05-27  
**Status:** For Review  
**Area:** Watch Officer / Visual Direction  
**Decision:** TASK-0091 output is accepted as ready for Game Director review.  
**Reason:** The visual spec defines the soft professional maritime simulator direction, prohibited cartoon/CAD/arcade styles, palette, line weights, water/safe/shallow/danger treatment, vessel/mark/AIS vector treatment, decision coaching rail rules, HUD readability, motion comfort, desktop/mobile criteria, accessibility criteria, QA checklist, and UI/HUD plus Engine handoff notes without touching implementation.  
**Consequences:** No visual implementation, asset change, Engine/UI pass, export, deploy, or production change is approved yet. TASK-0090 remains the only blocker before recording Scenario 1 production prototype status.  
**Related files:** `docs/watch-officer/visual-comfort-art-direction-spec.md`

## GD-DECISION-20260527-43 - Scenario 1 Production Prototype Approved

**Date:** 2026-05-27  
**Status:** Approved public production prototype  
**Area:** Watch Officer / Production Prototype  
**Decision:** Scenario 1 Decision Coaching Pack is approved as a public production prototype.  
**Reason:** TASK-0090 independent QA production smoke passed with `production_smoke: 41 passed, 0 failed`, including production URLs, artifact HTTP checks, COOP/COEP/CORP headers, MIME checks, non-empty browser canvas, ready briefing, Space start, opening lateral-pair cue immediate and hold-window visibility, later target-monitoring cue, R reset, VTS inactive/no popup, draft/non-final wording, forbidden final-claim scan, and Captain Ether route separation.  
**Consequences:** Scenario 1 is stable enough to move MVP development to the next scenario. This is not final maritime training approval, certification, legal correctness approval, or COLREGS-compliant training approval.  
**Related files:** `docs/watch-officer/qa-production-scenario-one-decision-coaching-review.md`, `docs/game-director/watch-officer-scenario-one-production-prototype-status-2026-05-27.md`

## GD-DECISION-20260527-44 - Scenario 2 Starts With Rules Decision Pack

**Date:** 2026-05-27  
**Status:** Assigned to Gameplay  
**Area:** Watch Officer / Scenario 2  
**Decision:** CHAT-GAMEPLAY-001 receives TASK-0093 to draft Scenario 2 Head-On Port-to-Port rules decision pack.  
**Reason:** Scenario 1 production prototype gate is closed. The next MVP gap is content breadth, and the lowest-risk next training expansion is a narrow head-on port-to-port drill before adding VTS, Region B, random traffic, radar/night, or broader mark lessons.  
**Consequences:** TASK-0093 is documentation-only. It may not edit code, scenario data, schema, scenes, assets, public files, production files, deploy/FTP, Captain Ether, Nav Desk, router/registry, auth, production config, VTS, Region B, or final maritime training claims.  
**Related files:** `docs/game-director/task-0093-gameplay-scenario-two-head-on-port-to-port-rules-2026-05-27.md`

## GD-DECISION-20260527-45 - Scenario 2 Moves To Maritime Audit

**Date:** 2026-05-27  
**Status:** Assigned to Maritime Rules Auditor  
**Area:** Watch Officer / Maritime Rules Audit  
**Decision:** TASK-0093 Scenario 2 Head-On Port-to-Port rules report is accepted for maritime audit. CHAT-MARITIME-RULES-001 receives TASK-0094 before UI/HUD or Engine implementation.  
**Reason:** The Gameplay report is strong enough to proceed, but it correctly identifies unresolved maritime-rule questions around nearly reciprocal thresholds, off-bow doubt, starboard alteration wording, port alteration severity, speed-reduction recovery, simple-channel constraints, CPA/pass-distance training values, and sign-off for `rule_review_status: "approved"`. These must be bounded before implementation so scenario-specific logic is not mistaken for final maritime instruction.  
**Consequences:** TASK-0094 is documentation audit only. No code, scenario data, schema, UI/HUD, Engine implementation, export, deploy, public files, production files, Captain Ether, Nav Desk, router/registry, auth, production config, VTS, Region B, or final maritime training claim is approved.  
**Related files:** `docs/watch-officer/scenario-two-head-on-port-to-port-rules-report.md`, `docs/game-director/task-0094-maritime-audit-scenario-two-head-on-port-to-port-2026-05-27.md`
