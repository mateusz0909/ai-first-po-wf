# PRD — Auto-restore Last View
**Status:** draft · **Author:** M. Byrtus · **Brief:** docs/product/strategy/saved-views-brief.md

## 1. Overview
**Problem:** Returning planners rebuild the same filter slice ~10×/session
(brief §Problem). **Goal:** on reopening a plan, restore the user's last-used
filter set automatically. **Non-goals:** named/multiple saved views (that is the
Q4 Option A follow-on), cross-user sharing.
**Success metrics:** re-filter actions/session <4 (baseline ~10,
`analytics/plans/filter-usage.md:12`); power-user 4-wk retention +3pp.

## 2. User stories
- As a returning planner, I want my last filter slice restored when I reopen a
  plan, so that I resume work without rebuilding it.

## 3. Requirements
### Functional
- **P0** On plan open, apply the filter set (channel, market, date range) the
  user last had applied on that plan. Testable: open plan with prior filters →
  those exact filters are active.
- **P0** Persist the filter set per user per plan on filter change. Testable:
  change a filter, reload → change persists.
- **P1** A one-click "clear filters" resets to defaults and clears the stored
  set. Testable: clear → reload shows defaults.
- **P2** If stored filters reference a now-deleted channel, drop it silently and
  restore the rest. Testable: delete a filtered channel → reopen → no error.

### Non-functional
- Restore adds <100ms to plan open (P0). Stored per-user (not shared). No PII in
  the stored blob.

## 4. UX flows
Open plan → filters auto-applied, with a subtle "restored your last view · clear"
affordance. States: no prior view → defaults; stale filter → partial restore.

## 5. Technical considerations
Add `lastView` JSON to the per-user plan-prefs store; reuse existing filter
serialization in `store/useStagePlanningStore.ts`. Migration: additive column,
nullable → no backfill. Rollback: feature-flag `restoreLastView`.

## 6. Launch plan
Flag-gated → 10% power users → GA. Watch: re-filter rate, plan-open latency,
error rate on stale filters. Go/no-go: latency budget held + no error spike.

## 7. Open questions
- [TODO: needs PO decision — should "last view" persist across devices, or per
  browser only for v1?]
