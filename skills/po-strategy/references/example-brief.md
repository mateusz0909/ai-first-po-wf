# Strategy Brief — Saved Views for Plans
**Date:** 2026-07-17 · **Decision:** Do we build user-saved filter views before Q4, or defer?

## Problem
Planners re-apply the same channel/market/date filters 8-12× per session (internal
event data, `analytics/plans/filter-usage.md`). Power users (top 15% by session
count) drive 60% of re-filtering. Cost: ~3 min/session of rework, and two churned
accounts cited "clunky repeat setup" in calls (`customers/summaries/*.md`).

## Target & JTBD
Returning power planners. Job: "when I reopen a plan, get me back to the slice I
work in without rebuilding it."

## Landscape
Two competitors ship saved views; one gates it behind their top tier. Status quo
for our users = browser bookmarks + a personal spreadsheet of filter combos.

## Options
| Option | What it is | Upside | Cost / risk | Confidence |
|--------|-----------|--------|-------------|------------|
| A. Saved views | Named, per-user filter sets | Kills the top pain; sticky | ~2 sprints; schema add | High |
| B. "Last view" only | Auto-restore last filter | 70% of value, 20% of cost | Doesn't cover multi-slice users | High |
| C. Do nothing | — | No cost | Pain persists; churn risk | — |

## Recommendation
Ship **B (auto-restore last view) now**, sequence **A** for Q4. B captures most
of the value at a fraction of the cost and de-risks the schema work for A.
Drivers: (1) fastest relief for the measured pain, (2) low schema risk, (3) buys
evidence on whether multi-slice saving is really needed.

## Success metrics
- Leading: re-filter actions/session ↓ from ~10 to <4 (baseline `filter-usage.md`).
- Lagging: power-user 4-week retention +3pp.

## Risks & unknowns
Multi-slice demand may be higher than the "last view" bet assumes — A's Q4
scoping should be revisited after 4 weeks of B's data.

## Evidence
- `analytics/plans/filter-usage.md:12` — re-filter frequency.
- `customers/summaries/acme.md:40` — churn quote.
- Competitor matrix — [example.com/pricing] `[unverified: pricing page, 2026-07]`.
