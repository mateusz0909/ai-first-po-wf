# Discovery workshop — visual guide

The problem-framing workshop that `po-discovery` preps and you facilitate. Goal:
turn a vague client request into one testable assumption — in 90 minutes.

## Flow (90 minutes)

```mermaid
flowchart TD
    R["client request<br/>'we need a mobile app'"] --> B1

    subgraph WS["workshop · 90 min"]
        direction TB
        B1["0:00-0:10 · frame & context<br/><i>round-robin: last time it hurt</i>"]
        B2["0:10-0:30 · real problem<br/><i>write-first + 5 Whys</i>"]
        B3["0:30-0:40 · problem statement<br/><i>template + dot-vote</i>"]
        B4["0:40-1:05 · impact mapping<br/><i>why → who → how → what</i>"]
        B5["1:05-1:20 · assumption mapping<br/><i>2x2 risk × uncertainty</i>"]
        B6["1:20-1:30 · close<br/><i>owner + next step</i>"]
        B1 --> B2 --> B3 --> B4 --> B5 --> B6
    end

    B6 --> A["the ONE riskiest<br/>assumption to test"]
    A --> MVP["po-mvp<br/>prototype it"]
    MVP -.->|"iterate"| B2

    classDef gate fill:#efe9ff,stroke:#6c4bf6,color:#3a2a86;
    classDef out fill:#e7f6ef,stroke:#1fa97a,color:#0f5b41;
    class B2,B3,B5,B6 gate;
    class A,MVP out;
```

Blocks in purple need YOUR facilitation call; green are the outputs that leave
the room. Solutions stay parked until minute 40 — the first half is problem-only.

## Assumption mapping — where to place and what to test

Test only the top-right: risky if wrong AND we don't yet know. Low-risk or
well-understood assumptions don't need a test.

```mermaid
quadrantChart
    title Assumption mapping — test the top-right first
    x-axis "Low uncertainty" --> "High uncertainty"
    y-axis "Low risk" --> "High risk"
    quadrant-1 "Test first"
    quadrant-2 "Explore / de-risk"
    quadrant-3 "Ignore for now"
    quadrant-4 "Monitor"
    "Offline capture changes tech habit": [0.85, 0.9]
    "Techs have devices on site": [0.25, 0.7]
    "Back-office trusts synced data": [0.6, 0.55]
    "Form UI is the blocker": [0.3, 0.25]
    "Native app vs PWA matters": [0.7, 0.2]
```

The riskiest assumption ("offline capture changes the habit") is what goes to
`po-mvp` as the first prototype — cheaper to test than building the native app
the client asked for.

## The funnel (what the workshop is really doing)

```mermaid
flowchart LR
    A["client request<br/>'mobile app'"] --> B["symptom<br/>'form is slow'"]
    B --> C["real problem<br/>30% of jobs re-keyed<br/>because offline"]
    C --> D["1 assumption to test<br/>'will they capture on-site<br/>if it works offline?'"]
    classDef last fill:#efe9ff,stroke:#6c4bf6,color:#3a2a86;
    class D last;
```

See also: [facilitator-playbook.md](../skills/po-discovery/references/facilitator-playbook.md)
· [90-min agenda + script](../skills/po-discovery/references/workshop-problem-framing-90min.md).
