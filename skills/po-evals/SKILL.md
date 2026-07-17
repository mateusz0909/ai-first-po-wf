---
name: po-evals
description: >
  Evaluation-harness skill for an AI-First Product Owner. Use to replace
  "does this feel good" with measurable, repeatable criteria before a
  go/iterate/kill call — build a golden set, score it (LLM-as-judge or manual),
  and keep it as a regression suite across iterations. Feeds evidence into
  po-validate. Triggers: whenever po-validate (or mvp-verifier) is about to
  decide go/kill/iterate, and explicit "run evals on <feature>", "define good
  for <feature>", "score this output", "did quality regress".
---

# PO Evals

You turn "is the output good?" into evidence. You build the criteria, score the
feature against them, and hand a PO-readable verdict to `po-validate`. Scoring
runs through the independent `eval-judge` agent — never grade the builder's own
claim of success.

## Boundary (read first)
- `po-evals` = **measurable, repeatable output quality** (golden set, rubric,
  regression). This skill.
- `po-validate` = **human/product signal** (did real people succeed / want it).
  Your eval report is *evidence that feeds its decision* — it does not replace it.
- `mvp-verifier` = **"does it run"**. It does not call evals; keep verify fast.

## When to use / not use
- Use: before any go/iterate/kill on a prototype; on every iterate (regression).
- Don't: to build/fix (that's `po-mvp`), or to gather human reactions (that's
  `po-validate`).

## Detect the mode
- **LLM-feature mode** — an LLM/agent/prompt is in the output path (generation,
  summarizing, classification, chat, extraction). Output varies per run.
- **Deterministic mode** — fixed logic (UX flow, pricing, ranking/reco,
  configurator). Same input → same output.
- Mixed feature → run both: judge the LLM part, assert the deterministic part.

## Define "good" — the hard part
Before scoring, write down what good means. If you cannot state it confidently,
**STOP and escalate** — run a short "definition-of-good" session with the user
rather than inventing criteria. Guessed criteria produce confident nonsense.
Use latitude: choose the dimensions this feature actually lives or dies on — do
not run a fixed checklist blindly.

## LLM-feature mode
1. **Golden set (5-15).** Real or realistic input→expected pairs covering the
   common path + the ways it plausibly fails. Store as CSV
   (`references/golden-set-template.csv`).
2. **Rubric.** Default dimensions: accuracy, tone, safety. Add **latency/cost
   ONLY if the hypothesis names them** — don't optimize a throwaway prototype.
   1-5 anchors or pass/fail per dimension (`references/eval-rubric-template.md`).
3. **Score.** Dispatch `eval-judge` (LLM-as-judge) for scale, OR score manually
   for small/subjective sets. **Calibrate the judge against 3-5 human-labelled
   cases first**; if it disagrees, trust the humans and note it. Never trust the
   judge blind on safety-critical dimensions.

## Deterministic mode
1. **Scenario set.** Fixed cases incl. edge cases and boundaries (empty, max,
   invalid, tie-breaks).
2. **Success criteria.** Task completion, exact correctness, or a tolerance
   threshold (e.g. price within ±1%). State the threshold explicitly.
3. **Score.** Dispatch `eval-judge` to run each scenario and assert
   actual-vs-expected. Deterministic = a failure is a real bug, not a judgment.

## Regression suite (the payoff)
The golden/scenario set persists in `docs/product/evals/<feature>/`. **Rerun it
every iterate** — a fix that lifts one case often breaks another; the suite
catches it. Track pass rate across iterations in the report.

## Output — eval-report.md (PO audience, not engineering)
Write `docs/product/evals/<feature>/eval-report.md`
(`references/eval-report-template.md`):
- Criteria used (dimensions + thresholds) and why.
- Pass/fail per case (with the failing output quoted).
- Pass rate now vs previous iteration.
- **Verdict: ship / iterate / kill.**
- One-line recommendation back to `po-validate`.

## Quality bar
- "Good" defined *before* scoring; escalated if undefinable.
- Every score traces to a quoted output, not a vibe.
- Judge calibrated against human labels before trusted at scale.
- Golden set persisted and rerun on iterate.
- Report reads for a PO, ends in ship/iterate/kill + one recommendation.

## Pre-flight checklist
- [ ] Mode detected (LLM / deterministic / mixed).
- [ ] "Good" stated, or escalated for a definition session.
- [ ] Golden/scenario set built + stored in `docs/product/evals/<feature>/`.
- [ ] Dimensions chosen for THIS feature (latency/cost only if in hypothesis).
- [ ] Scored via `eval-judge`; judge calibrated (LLM mode).
- [ ] Report written with verdict + recommendation to `po-validate`.

## Handoff
`po-mvp` (prototype) → **`po-evals`** (measurable evidence) → `po-validate`
(human signal + decision) ⟳. Only a winner → `po-prd`.

## Worked examples
`references/example-llm-prd-summarizer.md` (LLM) and
`references/example-nonllm-bike-configurator.md` (deterministic).
