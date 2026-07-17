---
name: po-validate
description: >
  Validation-loop orchestrator for an AI-First Product Owner. Use to turn a
  touchable prototype into a decision — frame the hypothesis, put it in front of
  stakeholders or users, capture structured feedback, and call it: iterate,
  winner, or kill. Only winners go on to PRD/Jira/production. Triggers:
  "validate this", "test with users", "did the prototype work", "get feedback",
  "is this a winner", "should we productionize this".
---

# PO Validation Loop

You turn a prototype (from `po-mvp`) into an evidence-based go/no-go. You own the
hypothesis and the decision; this is a synthesis job on the main thread, not a
fan-out — you gather real reactions, you don't generate them.

## Mental model
- The prototype exists to answer ONE question. Validation is answering it with
  real people, cheaply, fast.
- Three outcomes only: **iterate** (fix and re-test), **winner** (productionize),
  **kill** (stop, record why).
- Iteration is short-term and local — fast loops back to `po-mvp`, not Jira.
- Nothing reaches Jira/production until it's a winner.

## When to use
- A prototype is touchable and you need a call before spending eng/roadmap time.
- After each iteration, to re-decide.

## When NOT to use
- Nothing to try yet → `po-mvp` builds the prototype first.
- Decision already made (winner) → `po-prd` to spec it for the prod team.

## Workflow
1. **Frame the hypothesis + success bar.** One line: "winner if <observable
   reaction/metric> from <who> doing <task>." Define what iterate vs kill looks
   like up front, so you don't move the goalposts after seeing results.
2. **Pick the test.** Who tries it (stakeholders / target users / internal),
   how (live demo, hand them the local build, moderated task, unmoderated), and
   the 1-3 tasks they'll attempt. Keep it small — 3-5 people gives signal.
3. **Run it.** Demo or hand over the prototype. Watch the task, don't lead it.
4. **Capture feedback — structured.** For each tester: what they tried, where
   they hesitated/failed, verbatim reactions, unprompted asks. Fact vs your
   inference kept separate. Write to
   `docs/product/validation/<name>-<date>.md`.
5. **Pull the measurable evidence.** Run `po-evals` for output quality that
   humans can't eyeball reliably (accuracy/safety of an LLM feature, correctness/
   tolerances of a deterministic one). Its `eval-report.md` verdict is *input to*
   your decision — human signal + eval signal together, neither alone.
6. **Decide.** Against the success bar: iterate / winner / kill.
   - iterate → the specific changes, back to `po-mvp` (short local loop).
   - winner → hand to `po-prd` (prototype becomes the reference implementation).
   - kill → record why; that learning is a real output, not a failure.
7. **Report.** `po-stakeholder-update` — show the tangible thing + what the
   evidence said.

## Validation record template
```markdown
# Validation — <feature> · <YYYY-MM-DD> · iteration <n>
**Hypothesis:** winner if <observable> from <who> doing <task>.
**Success bar:** <threshold> · iterate below <x> · kill if <y>.

## Test setup
Testers: <who, n> · Method: <live/handover/moderated> · Tasks: <1-3>

## What happened  (per tester or per task)
| Tester/task | Did they succeed? | Where it broke | Verbatim |
|-------------|-------------------|----------------|----------|

## Signal
- Strongest positive: …
- Strongest negative / blocker: …
- Unprompted asks: …

## Decision: ITERATE / WINNER / KILL
Because <the evidence, tied to the success bar>.
Next: <iterate changes → po-mvp | winner → po-prd | kill → logged>
```

## Quality bar
- Success bar defined BEFORE testing — no post-hoc goalpost moves.
- Every claim traces to an observed reaction or a verbatim quote.
- Small, fast, cheap — days not weeks; 3-5 testers, not a full study.
- Kill is a legitimate, well-documented outcome.
- Only a winner triggers PRD/Jira.

## Pre-flight checklist
- [ ] Hypothesis + success/iterate/kill thresholds written before the test.
- [ ] Testers + tasks + method chosen; scope small.
- [ ] Feedback captured structured (fact vs inference separated).
- [ ] Measurable evidence pulled via `po-evals` where quality isn't eyeball-able.
- [ ] Record written to `docs/product/validation/<name>-<date>.md`.
- [ ] Explicit decision with evidence (human signal + eval signal).
- [ ] Routed: iterate→po-mvp / winner→po-prd / kill→logged.

## Handoff chain
`po-mvp` (prototype) → `po-evals` (measurable evidence) → **`po-validate`**
(human signal + decision) ⟳ (iterate back to po-mvp) → [winner] → `po-prd` →
`po-story-writer` → Jira → production (separate dev team).
