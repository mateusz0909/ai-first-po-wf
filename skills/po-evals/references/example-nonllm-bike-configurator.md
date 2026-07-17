# Worked example — deterministic feature: bike-fit configurator

Feature: user enters height, inseam, riding style → tool recommends frame size +
stem length. Hypothesis: "the recommendation matches a fitter's chart, so users
trust it enough to buy."

## Mode
Deterministic — same input → same output. No LLM. Scored by assertion against a
fitter's reference chart, not a judge's opinion.

## Scenario set (fixed cases incl. edges)
| id | height | inseam | style | expected frame | expected stem | tolerance |
|----|--------|--------|-------|----------------|---------------|-----------|
| 1 | 175cm | 82cm | road | 54cm | 100mm | frame exact · stem ±10mm |
| 2 | 160cm | 72cm | road | 50cm | 90mm | as above |
| 3 | 200cm | 96cm | road | 61cm (max) | 120mm | boundary: tallest |
| 4 | 150cm | 68cm | road | 47cm (min) | 80mm | boundary: shortest |
| 5 | 175cm | 82cm | gravel | 54cm | 90mm | style changes stem |
| 6 | 175cm | (empty) | road | error, not a guess | — | invalid input |
| 7 | 178cm | 84cm | road | tie 54/56 → pick 54 + note | 100mm | tie-break rule |

## Success criteria
Frame size exact vs chart; stem within ±10mm; invalid input errors (never
silently guesses); tie-breaks to the smaller frame with a note.

## Result (iteration 1)
Pass 5/7. Fails: case 6 (returned 54cm for empty inseam instead of erroring),
case 7 (picked 56 on the tie, chart says smaller).

## Verdict: ITERATE
Because a silent guess on missing data (case 6) breaks trust harder than any
happy-path win — a buyer gets a wrong-size bike. Fix input validation + tie rule,
rerun the 7 scenarios as a regression suite.

**Recommendation to po-validate:** hold human testing — fix the two correctness
bugs first; they'd directly cause a wrong purchase, which is the whole thing
we're de-risking.
