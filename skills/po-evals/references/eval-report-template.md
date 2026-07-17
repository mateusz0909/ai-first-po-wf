# Eval report — <feature> · <YYYY-MM-DD> · iteration <n>

**Mode:** LLM / deterministic / mixed
**Hypothesis this tests:** <winner condition from po-mvp / po-validate>
**Criteria:** <dimensions + thresholds, and why these>

## Results
| Case | Result | Where it failed (quoted output) |
|------|--------|---------------------------------|
| 1 | pass/fail | … |
| 2 | pass/fail | … |

**Pass rate:** <this iteration> (prev: <last iteration>)
**Per dimension:** accuracy <x/n> · tone <x/n> · safety <pass/fail gate> · …

## Judge calibration (LLM mode)
Agreed with human labels: yes / no (<detail>) / not calibrated.

## Low-confidence / needs human review
- <cases the judge flagged>

## Verdict: SHIP / ITERATE / KILL
Because <the evidence, tied to the criteria>.

**Recommendation to po-validate:** <one line — e.g. "quality clears the bar;
put it in front of 3 users to confirm they'd use it" / "accuracy fails on X;
iterate before human testing">.
