# Worked example — client engagement, problem given

**Client brief (their words):** "We need a mobile app so our field technicians can
log jobs — the current web form is the problem."

Note the trap: that's a *proposed solution* ("mobile app") wrapped around a
*symptom* ("web form"). The workshop reframes it.

## Pre-workshop (po-researcher brief)
Field-service domain scan: techs work offline in basements/rural sites;
competitors emphasize offline sync, not native apps. Provisional hypothesis (to
challenge): "the real problem is data loss/offline, not the form factor."

## Workshop outputs

### Problem statement
> **Who:** field technicians · **Struggles to:** record a job at the site ·
> **Because:** the web form needs live connectivity and they're often offline ·
> **Which causes:** ~30% of jobs re-entered later from memory → billing errors ·
> **Today they:** scribble on paper, re-key at the office (2h/day) ·
> **Success:** a job is captured on-site with zero re-entry, connectivity or not.
>
> **Not the problem:** "web form is ugly" (symptom). **Stated request:** "mobile
> app" (one possible solution branch).

### Impact map (excerpt)
- Goal: eliminate job re-entry (2h/day/tech → ~0)
  - Actor: technician → Impact: capture on-site offline
    - Deliverable: offline-capable form (PWA)  ← alternative to native app
    - Deliverable: native mobile app  [client's original request]
  - Actor: back-office → Impact: trust the data → Deliverable: auto-sync + validation

### Assumption map — riskiest
> We believe **techs will reliably capture jobs on-site if the tool works
> offline**. We'll know we're wrong if **techs still defer entry to the office
> even with an offline tool** (habit, not tech, is the blocker).

Test: an offline PWA prototype (cheaper than a native app) with 3 techs for a
week. Routed to `po-mvp`.

## Why this beat "just build the app"
The client's request (native app) was one branch. The riskiest thing wasn't
form factor — it was whether offline capture changes behaviour at all. Testing a
cheap PWA first de-risks a big native-app build. If behaviour doesn't change, no
app would've helped — and the workshop saved months.
