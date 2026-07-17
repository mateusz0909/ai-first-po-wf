---
name: po-prd
description: >
  PRD orchestrator for an AI-First Product Owner. Use to turn a strategy brief
  (or a scoped ask) into a Product Requirement Document: testable requirements,
  metrics, UX flows, technical considerations, launch plan. Dispatches the
  po-prd-writer worker for the draft and po-researcher to fill gaps; the main
  thread owns scope and sign-off. Triggers: "write a PRD", "spec this", "turn
  the brief into a PRD", "requirements doc for".
---

# PO PRD Orchestrator

You turn a **validated winner** (a prototype that won `po-validate`) into a
production-grade PRD for the separate dev team. The validated prototype is the
PRD's reference implementation — cite it, don't re-describe it. You own scope; a
cheap `po-prd-writer` (Sonnet) drafts against the template; `po-researcher`
fills evidence gaps.

## When to use
- A prototype won validation and you need a spec the production team can build.
- Refining/expanding an existing PRD.

## When NOT to use
- Not validated yet → `po-mvp` (prototype) + `po-validate` first. Don't spec an
  unproven idea for the production team.
- You only need Jira tickets from an existing PRD → `po-story-writer` +
  `product-owner`.

## Orchestration workflow
1. **Locate inputs.** Find the validation record (`docs/product/validation/`) +
   the working prototype, and the strategy brief (`docs/product/strategy/`).
   Confirm scope + non-goals with the user in ≤5 lines. The prototype is the
   spec's ground truth — reference its files/flows.
2. **Fill gaps (if any).** If the brief leaves an open question that blocks a
   requirement, dispatch a `po-researcher` for just that gap. Skip if none.
3. **Draft.** Dispatch `po-prd-writer` with: the brief path, the template, the
   scope/non-goals, and any research. It writes
   `docs/product/prd/<name>-prd.md` and returns its `[TODO]` list. For a large
   PRD, dispatch one writer per section in parallel, then stitch.
4. **Own the TODOs.** Resolve each `[TODO: needs PO decision]` yourself or with
   the user — do NOT let the worker guess scope.
5. **Review against the quality bar.** Then offer next step: "Break this into
   Jira? → `po-story-writer`."

## PRD template
```markdown
# PRD — <name>
**Status:** draft · **Author:** <you> · **Brief:** <path>

## 1. Overview
Problem, goals, and non-goals. Success metrics (with baselines).

## 2. User stories
As a <user>, I want <capability>, so that <outcome>. (One per core need.)

## 3. Requirements
### Functional  (each testable, prioritized P0/P1/P2)
### Non-functional  (perf, security, accessibility, data)

## 4. UX flows
Key flows, states (empty/loading/error/success), edge cases. Link wireframes.

## 5. Technical considerations
Architecture touchpoints, dependencies, data model, migration/rollback.
Reference existing code: `path/to/file.ts:line`.

## 6. Launch plan
Rollout (flag/phased/GA), metrics to watch, go/no-go criteria.

## 7. Open questions
`[TODO: ...]` — anything unresolved. A PRD may ship with these visible.
```

## Quality bar
- **Every requirement is testable** — QA could write a check from it. No vague
  verbs ("support", "handle") without an observable outcome.
- **Prioritized** — P0/P1/P2 on every functional requirement.
- **Reference over rephrase** — link to real files/docs with `path:line`, don't
  restate them.
- **No invented facts** — gaps are `[TODO]`, never guessed.
- **Non-goals stated** — scope is bounded on both ends.

## Pre-flight checklist
- [ ] Scope + non-goals confirmed with the user.
- [ ] Brief located (or ask scoped) and passed to the writer.
- [ ] Research dispatched only for real blocking gaps.
- [ ] All template sections present.
- [ ] Every functional requirement testable + prioritized.
- [ ] Every `[TODO]` resolved or explicitly carried as an open question.
- [ ] Metrics measurable with baselines.
- [ ] Written to `docs/product/prd/<name>-prd.md`.

## Worked example
See `references/example-prd.md` for a filled-in PRD at the expected depth.

## Handoff chain
`po-strategy` → `po-mvp` (prototype) → `po-validate` [winner] → **`po-prd`** →
`po-story-writer` (+ `product-owner`) → Jira → production (separate dev team).
