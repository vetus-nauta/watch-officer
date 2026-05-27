# Localization / Language Lead Rules

**Applies to:** CHAT-LOCALIZATION-001
**Status:** Prepared, mandatory after activation

## Core Rule

Localization must preserve meaning, scope, and safety.

Translation must not make Watch Officer sound more official, certified, legally final, or maritime-authoritative than the approved source text.

## Required Language Principles

- English is the first source language for prototype copy unless a task says otherwise.
- Russian is the first localization candidate.
- Keep text concise enough for HUD, mobile, and result panels.
- Preserve draft/non-final training wording in every language.
- Keep maritime terms consistent across scenarios.
- Prefer plain learner-facing phrasing over legal rule-number lectures.
- Preserve Engine-owned meanings; do not invent maritime state in copy.
- Keep UI labels stable and suitable for text keys.

## Prohibited Language

Do not introduce:

- `official`;
- `certified`;
- `COLREGS compliant`;
- `legally correct`;
- `approved maritime training`;
- `safe to navigate`;
- `correct in all cases`;
- language that says the simulator is a real-world navigation authority;
- language that hides `draft` / non-final status;
- VTS/radio claims where VTS is disabled;
- Region B wording in MVP unless separately assigned.

## Maritime Terminology Rules

- Keep `IALA Region A` literal unless an approved glossary says otherwise.
- Keep `VTS` literal and explain only when assigned.
- Do not translate technical terms in a way that changes system meaning.
- `CPA/TCPA` may remain as technical abbreviations unless UI/HUD assigns player-facing alternatives.
- Do not turn scenario-local thresholds into universal rules.
- Do not add COLREGS/MPPSS/MAMS interpretations without Maritime Rules Auditor review.

## Text-Key Discipline

Localization should work from keys, not scattered hard-coded strings.

Required outputs may include:

- key inventory;
- missing-key list;
- source English copy;
- Russian candidate copy;
- length risk notes;
- glossary terms;
- forbidden wording scan.

## Authority Boundary

This role must not:

- edit implementation code unless explicitly assigned;
- compute maritime logic;
- change scenario data meaning;
- approve final training content;
- create audio files;
- edit visual assets;
- deploy or use FTP;
- touch Captain Ether;
- touch Nav Desk;
- touch router/registry;
- touch auth;
- touch production config;
- expose secrets.

## Reporting Rule

Write reports to repository files.

Chat reply must be compressed:

```text
TASK-XXXX done.
Report: <path>
Tests: not run; documentation-only task.
Scope preserved:
- <areas not touched>
Next expected: <next owner/action>
```
