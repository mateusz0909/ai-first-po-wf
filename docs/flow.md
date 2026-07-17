# The validation-first PO flow

The core idea: **prove a feature on a throwaway prototype before committing
roadmap, PRD, Jira, or production time.** MVP is early (discovery), Jira is
terminal (handoff). Production is built by a separate dev team from your spec —
only for validated winners.

## Stages

### 1. `po-strategy` — frame the bet
Frame the decision, fan out `po-researcher` agents in parallel (market,
competitors, users/JTBD, internal data), synthesize a decision-ready brief with a
testable hypothesis. Output: `docs/product/strategy/<name>-brief.md`.

Skip it for small, obvious bets — go straight to `po-mvp`.

### 2. `po-mvp` — prototype, local, touchable
Thinnest slice to something a person can click. Speed over polish; fake/stub what
you can, mark corners `// PROTOTYPE:`. Runs locally; demo on a shared screen.
Workers (`mvp-planner`, `mvp-implementer`, `mvp-verifier`) run in **prototype
mode** — `mvp-verifier` confirms "does it run", not full CI.

### 3. `po-evals` — measurable evidence
Where quality can't be eyeballed, define "good" up front and score it:
- **LLM features:** golden set (5-15), rubric (accuracy/tone/safety; latency/cost
  only if the hypothesis names them), scored by the independent `eval-judge`
  agent — calibrated against 3-5 human labels first.
- **Deterministic features:** fixed scenarios + edge cases, tolerance thresholds,
  assert actual vs expected.

The golden/scenario set persists in `docs/product/evals/<feature>/` and is
**rerun every iteration** as a regression suite. If "good" can't be defined
confidently, the skill stops and asks for a definition-of-good session.

### 4. `po-validate` — human signal + decision
Put the prototype in front of 3-5 stakeholders/users, capture structured feedback,
combine it with the eval evidence, and call it: **iterate / winner / kill**.
- iterate → back to `po-mvp` (short local loop)
- winner → `po-prd`
- kill → logged learning (a valid outcome)

Output: `docs/product/validation/<name>-<date>.md`.

### 5. `po-prd` — production spec (winners only)
Turn the validated prototype into a production-grade PRD; the prototype is the
reference implementation. `po-prd-writer` drafts; you own scope and the `[TODO]`
decisions. Output: `docs/product/prd/<name>-prd.md`.

### 6. `product-owner` + `po-story-writer` — Jira handoff
Break the PRD into epics/stories/tasks against a strict quality bar. Drafts land
in `jira-issues/`; nothing is created in Jira until you confirm. Production is
built by the separate dev team from these.

### Across everything: `po-stakeholder-update`
Demo the tangible prototype during validation, announce winners heading to
production, report kills + learnings, run recurring cadence updates. Lead with the
outcome, not the doc.

## What runs on which model

- **Opus (your main thread):** framing, synthesis, judgment, decisions, pure writes.
- **Sonnet (worker agents):** research fan-out, prototype build, scoring, review.

Don't spawn a worker for something you already have the context to do in one
step — subagent startup has a real cost. Fan out when there's parallelism or
context-isolation to gain.
