---
name: po-stakeholder-update
description: >
  Stakeholder communication skill for an AI-First Product Owner. Use to turn
  work done — commits, PRs, Jira movement, a shipped PRD, sprint outcomes —
  into a status update, exec summary, launch note, or Slack post, tuned to the
  audience. Triggers: "status update", "exec summary", "sprint update",
  "stakeholder update", "launch note", "announce this", "write the Slack post",
  "weekly update".
---

# PO Stakeholder Update

You turn what happened into a crisp, audience-appropriate update. Same facts,
different altitude per audience. You run on the main thread; gather the source
material directly (git log, PRs, Jira, PRD/plan files) — this is usually a
synthesis task, not a fan-out one.

## When to use
- Recurring status/sprint updates, exec summaries, launch announcements,
  internal Slack recaps.

## When NOT to use
- Customer-call recaps → use the `customer-call-summary` skill if present.
- The work isn't done/verified yet → don't announce; finish via `po-mvp`.

## Workflow
1. **Gather source of truth** (don't guess): `git log`/PRs for shipped code,
   Jira for issue movement (Atlassian MCP), PRD/plan files for scope, metrics
   for impact. Every claim must trace to one of these.
2. **Pick the audience tier** (below) — it sets altitude and length.
3. **Draft** from the matching template. Lead with the outcome, not the process.
4. **Gate the send.** Posting to Slack/email/Jira is a side effect — present the
   draft and get explicit confirmation before sending anything externally.

## Audience tiers
- **Exec / leadership:** outcome + impact + risk + ask. 5-8 lines. No jargon,
  no task-level detail. Answer "so what?" first.
- **Cross-functional / stakeholders:** what shipped, what's next, what's
  blocked, what we need from you. Bullet form.
- **Team / internal Slack:** specific and concrete — name the changes, the
  people, the tickets. Celebrate wins, flag blockers.

## Templates
```markdown
### Exec summary
**<Initiative> — <date>**
- **Shipped:** <outcome in one line, with the metric that matters>.
- **Impact:** <measured or expected, with baseline>.
- **Risk / watch:** <the one thing that could go wrong>.
- **Ask:** <decision or resource needed, or "none">.

### Stakeholder update
**What shipped:** <bullets, each tied to a PR/ticket>
**In progress / next:** <bullets>
**Blocked:** <item — owner — what unblocks it>
**Need from you:** <explicit asks>

### Slack post
<Opening line: the win, plainly.> 🎯
<2-4 bullets: specific changes, with ticket/PR links and owners.>
<Metric or early signal if any.>
<What's next / where to give feedback.>
```

## Quality bar
- **Outcome-first.** Lead with the result and its impact, never the activity log.
- **Every claim sourced** to a commit/PR/ticket/metric.
- **Right altitude** for the audience — no task minutiae to execs, no vague
  hand-waving to the team.
- **Honest about risk/blockers** — an update that hides problems is worse than
  none.
- **Metrics have baselines**; "faster" without a number is filler.

## Pre-flight checklist
- [ ] Source of truth gathered (git/PR/Jira/metrics), not recalled.
- [ ] Audience tier chosen; template matched.
- [ ] Leads with outcome + impact.
- [ ] Blockers/risks stated honestly.
- [ ] Numbers carry baselines.
- [ ] External send gated on explicit user confirmation.

## Handoff
Runs alongside the whole loop: demo the tangible prototype during `po-validate`,
announce validated winners heading to production, report kills + learnings, and
give recurring cadence updates. Lead with the tangible thing, not the doc.
