# Jira Issue Templates

Canonical skeletons + the single source-of-truth priority and label guides for the `product-owner`
skill. Keep every section earning its place — delete sections that add no developer value. Default to
Jira-Markdown (`### SECTION`, `* ` bullets, `- [ ]` criteria). Prefer exact repo references over prose.

## Epic

Large body of work spanning multiple stories/sprints. Put shared background and cross-story rules here
so Stories stay focused.

```
SUMMARY
[Feature Area]: Epic title

### OBJECTIVE
Business objective and value, in 2-4 sentences. Problem → outcome.

### SCOPE
* Major area 1
* Major area 2

### SUCCESS CRITERIA
* Measurable outcome 1
* Measurable outcome 2

### OUT OF SCOPE
* Explicitly excluded item 1

### TARGET RELEASE
Q[X] 20XX or sprint/version

### DEPENDENCIES
* Other epics/teams, technical prerequisites

### STAKEHOLDERS
* Product Owner: [name]  ·  Tech Lead: [name]

Priority: [Highest|High|Medium|Low|Lowest]
Labels: [type], [domain], epic
```

## Story (repo-backed default)

End-user functionality. Keep it to story-level behavior + developer-useful references. No background
walls — those belong in the Epic.

```
SUMMARY
Short, specific story title (or: As a [persona], I want [action] so that [benefit])

### USER STORY
As a [persona]
I want [capability]
So that [benefit]

### ACCEPTANCE CRITERIA
- [ ] Given [context], when [action], then [observable result]
- [ ] Given [context], when [action], then [observable result]
- [ ] Given [edge case], when [action], then [defined behavior, e.g. shows unavailable, not invented]

### REFERENCE IMPLEMENTATION        (or: CALCULATION REFERENCE (<repo>))
* [file.ext:LINE](path/to/file.ext#LLINE) — what this anchor defines
* [file.ext:LINE](path/to/file.ext#LLINE) — what this anchor defines

### BUSINESS CONTEXT                 (optional — only when interpretation rules matter)
* Rule / distinction a planner or business user needs

### API CONTEXT                      (optional — only when an external contract matters)
* Endpoint / contract name + link

Priority: [Highest|High|Medium|Low|Lowest]
Labels: [type], [domain]
```

> `TECHNICAL NOTES` / `DESIGN NOTES`: include ONLY for a narrow contract fact, integration constraint,
> external API detail, or a design link. Never for speculative "how to build it" guidance.

## Task

Technical work item without direct user-facing value.

```
SUMMARY
[Area]: Action-oriented task title

### OBJECTIVE
What must be accomplished and why.

### SCOPE
In:  * deliverable 1   * deliverable 2
Out: * what this won't address

### ACCEPTANCE CRITERIA
- [ ] Measurable outcome
- [ ] Tests / docs updated as needed

### DEPENDENCIES
* Required before / blocks: [issue keys]

Priority: [...]
Labels: [...]
```

## Bug

Defect in existing functionality. Reproduction + impact first — that's what a dev needs.

```
SUMMARY
[Component]: One-line description of the defect

### ENVIRONMENT
* Env: [Prod/Staging/Dev]  ·  Platform/Browser: [...]  ·  Version: [...]

### STEPS TO REPRODUCE
1. ...
2. ...
3. Observe [issue]

### EXPECTED BEHAVIOR
[What should happen]

### ACTUAL BEHAVIOR
[What happens, incl. console/errors or "no errors"]

### IMPACT
* Severity: [Critical/High/Medium/Low]  ·  Users affected: [% / who]  ·  Workaround: [Yes/No — desc]

### TECHNICAL DETAILS              (optional)
* Error/log, suspected cause, related issues, source ref [file.ext:LINE](path#LLINE)

### ROOT CAUSE                     (if known)
### PROPOSED FIX                   (high-level; not prescriptive unless asked)

Priority: [...]
Labels: [type], bug-fix
```

## Sub-task

Slice of a parent Story/Task.

```
SUMMARY
[Verb] specific sub-task

### CONTEXT
How this relates to the parent.

### DELIVERABLE
* What will be created/modified and where ([file.ext](path))

### ACCEPTANCE CRITERIA
- [ ] Criterion 1
- [ ] Criterion 2
```

## Priority Guide (single source of truth)

- **Highest (P1) — Critical:** system down / major break, security vulnerability, data loss, blocking
  multiple teams.
- **High (P2) — Important:** significant current-sprint feature, high-value improvement, important bug
  affecting a user subset, dependency for upcoming work.
- **Medium (P3) — Normal:** standard feature work, non-critical bug, optimization, tech-debt.
- **Low (P4) — Minor:** nice-to-have, minor bug with workaround, docs.
- **Lowest (P5) — Trivial:** cosmetic, very minor, far-future.

## Label Guide (buckets — pick what fits; no org-specific names by default)

- **By type:** `frontend`, `backend`, `database`, `infrastructure`, `documentation`
- **By domain:** `authentication`, `payments`, `api`, `ui`, `<your-domain>`
- **By status:** `blocked`, `needs-design`, `needs-review`, `tech-debt`
- **By theme:** `security`, `accessibility`, `performance`, `ux-improvement`, `bug-fix`
