---
name: po-discovery
description: >
  Client-engagement discovery skill for a Product Owner when the client ALREADY
  has a problem — the job is to frame the real problem (not the stated symptom
  or a pre-baked solution), shape it toward what to build, and de-risk before
  prototyping. Designs and preps the workshop, gives a full facilitator
  playbook (how to actually run it), and synthesizes outputs into a problem
  statement + impact map + assumption map. Routes the riskiest assumption to
  po-mvp. Triggers: "run a discovery workshop", "how do I facilitate", "kickoff
  with the client", "frame this problem", "the client wants X — where do I
  start", "prep a workshop".
---

# PO Discovery (problem-given, client-facing)

The client brings a problem. Your risk is **solving the wrong one** — a stated
symptom, or the client's pre-baked solution. This skill preps and designs the
workshop, coaches you through **running it** (see the facilitator playbook), and
turns the room's output into decisions. You facilitate live; this does the 80%
around it — prep, structure, scripts, synthesis.

## When to use / not use
- Use: a client hands a problem/brief and you need to frame it, align
  stakeholders, and decide what to test first.
- Don't: open-ended opportunity hunting (that's continuous discovery, not this),
  or once the riskiest assumption is chosen → `po-mvp`.

## The default sequence (adapt to time/domain)
1. **Problem framing + 5 Whys** — separate stated symptom / real problem /
   proposed solution. Output: one problem statement.
2. **Impact mapping** — goal → actors → impacts → deliverables. Connects the
   problem to candidate solutions; keeps scope honest (the client's request is
   one branch, not the whole tree).
3. **Assumption mapping** — list assumptions behind the direction, rank by
   risk × uncertainty, pick the riskiest to test.
4. **(domain/process-heavy only) Event Storming** — model the real process to
   surface hidden complexity the client didn't name.
5. **Hand the riskiest assumption to `po-mvp`** → prototype → `po-validate`.

If you only have 90 minutes: steps 1–3. Full agenda +scripts:
`references/workshop-problem-framing-90min.md`.

## Orchestration workflow
1. **Pre-workshop.** Dispatch `po-researcher` on the client's domain,
   competitors, and context → a briefing + a *provisional* problem hypothesis
   for you to challenge in the room (never present it as the answer).
2. **Design the session.** Pick the sequence, set timeboxes, choose attendees
   (see playbook — decider + domain experts + an end-user proxy, cap ~8), build
   the agenda + facilitator script + a Miro/FigJam structure.
3. **Coach the run.** Give the user the facilitator playbook
   (`references/facilitator-playbook.md`) — openings, exact prompts, and how to
   handle dominant voices, silence, rabbit holes, and the HiPPO.
4. **Synthesize.** From notes/transcript, produce the three artifacts
   (`references/artifact-templates.md`): problem statement, impact map,
   assumption map (ranked). Write to `docs/product/discovery/<client>-<date>.md`.
5. **Route.** The top assumption → `po-mvp`. Offer `po-stakeholder-update` to
   recap decisions + owners to the client.

## Facilitation principles (full playbook in references)
- **You own the process, not the content.** Stay neutral on the answer.
- **Write-first, then share** — silent independent generation before discussion
  kills anchoring and groupthink (esp. when the decider is in the room).
- **Timebox everything**; a parking lot catches off-topic gold without derailing.
- **Make everyone contribute** — round-robin, dot voting, "let's hear from
  someone who hasn't spoken."
- **Treat every strong claim as an assumption to test**, not a fact — that
  defuses conflict and feeds the assumption map.

## Quality bar
- Problem statement separates symptom / real problem / proposed solution.
- Impact map shows ≥2 routes to the goal (client's request isn't the only branch).
- Assumptions ranked; a single riskiest one chosen to test next.
- An end-user voice was in the room or explicitly flagged as missing.
- Every output is decision-ready and has an owner + next step.

## Pre-flight checklist
- [ ] Pre-read/research done; provisional hypothesis drafted (to challenge).
- [ ] Attendees chosen (decider, domain experts, end-user proxy, ≤~8).
- [ ] Agenda + timeboxes + facilitator script ready.
- [ ] Board (Miro/FigJam) pre-structured.
- [ ] Three artifacts produced post-session + written to `docs/product/discovery/`.
- [ ] Riskiest assumption chosen → routed to `po-mvp`.

## Handoff chain
**`po-discovery`** (frame + de-risk) → `po-mvp` (prototype the riskiest
assumption) → `po-evals` → `po-validate` → [winner] → `po-prd` → Jira → prod.
`po-stakeholder-update` recaps to the client.

## References
- `references/facilitator-playbook.md` — how to actually run a workshop.
- `references/workshop-problem-framing-90min.md` — ready agenda + minute-by-minute script.
- `references/artifact-templates.md` — problem statement · impact map · assumption map.
- `references/example-engagement.md` — one filled end-to-end.
