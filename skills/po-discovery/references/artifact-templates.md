# Discovery artifact templates

The three outputs of a problem-framing session. Write to
`docs/product/discovery/<client>-<date>.md`.

---

## 1. Problem statement

```markdown
# Problem statement — <client> · <YYYY-MM-DD>

**Who:** <the role/segment that feels the pain>
**Struggles to:** <the job/outcome they can't achieve>
**Because:** <root cause — from 5 Whys, NOT the symptom>
**Which causes:** <business impact + metric, with a number if known>
**Today they:** <current workaround — reveals the real cost>
**Success looks like:** <measurable change — the target>

**Explicitly NOT the problem:** <symptoms and proposed solutions we set aside>
**Stated request (client's words):** <what they originally asked for — one branch,
not the definition of done>
```

Test: could a stranger tell the symptom from the root cause and the problem from
the proposed solution? If not, keep digging.

---

## 2. Impact map

Goal → Actors → Impacts (behaviour changes) → Deliverables. Deliverables come
LAST. The client's request is one branch among several.

```markdown
# Impact map — <client> · <YYYY-MM-DD>

## Goal (why)
<the metric to move — from the problem statement>

## Actor → Impact → Deliverable
- **<Actor A>**
  - Impact: <what behaviour change in A moves the goal>
    - Deliverable: <candidate thing to build>  [client's original request?]
    - Deliverable: <alternative route>
- **<Actor B>**
  - Impact: <…>
    - Deliverable: <…>

## Note
≥2 real routes to the goal. If every branch is the client's original solution,
push harder — you're rationalizing, not mapping.
```

---

## 3. Assumption map

```markdown
# Assumption map — <client> · <YYYY-MM-DD>

Rank by risk (impact if wrong) × uncertainty (how little we know).

| Assumption | Risk if wrong | Uncertainty | Quadrant | Test? |
|------------|---------------|-------------|----------|-------|
| We believe <X> | high/med/low | high/med/low | risky+uncertain | ← test first |
| … | | | | |

## Riskiest assumption (test first)
> We believe **<X>**. We'll know we're wrong if **<observable result>**.

**How we'll test it:** <cheapest probe — usually a po-mvp prototype>
**Routed to:** po-mvp
```

Rule: test the top-right (risky + uncertain) first. Cheap probe, fast signal.
Low-risk or well-known assumptions don't need a test — don't gold-plate.
