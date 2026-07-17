<div align="center">

# 🧭 AI-First PO workflows

**A reusable team of skills + subagents for [Claude Code](https://claude.com/claude-code) that runs the full Product Owner loop.**

*strategy → prototype → evals → validate → PRD → Jira → production*

<br/>

![Claude Code](https://img.shields.io/badge/Claude%20Code-skills%20%2B%20agents-6C4BF6)
![Orchestrator](https://img.shields.io/badge/orchestrator-Opus-6C4BF6)
![Workers](https://img.shields.io/badge/workers-Sonnet-1FA97A)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

</div>

---

> Built for a **validation-first** way of working: every feature idea is proven on a
> throwaway, touchable prototype *before* any PRD, Jira, or production commitment.
> Only validated winners get handed to the production dev team.

## Contents

- [Why this exists](#why-this-exists)
- [Quick start](#-quick-start)
- [The flow](#-the-flow)
- [The team](#-the-team)
- [Design principles](#-design-principles)
- [Install](#️-install)
- [Usage](#️-usage)
- [Customize](#️-customize)
- [Credits](#-credits)

---

## Why this exists

Most PO tooling stops at documents. This turns the PO loop into an operational
system an AI-First PO actually runs day to day:

| | |
|---|---|
| 🔍 **Discovery & strategy** | no research bottleneck — parallel researcher agents |
| 🧪 **Prototype-first validation** | put a tangible thing in front of people fast |
| 📊 **Evals** | replace "does this feel good?" with measurable criteria + a golden-set regression suite |
| 📋 **Backlog + handoff** | production spec + Jira only for proven winners |
| 📣 **Stakeholder comms** | lead with the tangible outcome, not the doc |

---

## 🚀 Quick start

```bash
git clone https://github.com/mateusz0909/ai-first-po-wf.git
cd ai-first-po-wf
./install.sh            # copies skills + agents into ~/.claude/
```

Start a new Claude Code session, then:

```
/po-strategy should we build saved filter views?
```

---

## 🔁 The flow

```mermaid
flowchart TD
    idea([feature idea]) --> S[po-strategy<br/>frame + hypothesis]
    S --> M[po-mvp<br/>prototype · local · touchable]
    M --> E[po-evals<br/>measurable evidence]
    E --> V[po-validate<br/>human signal + decision]
    V -->|iterate| M
    V -->|kill| K([logged learning])
    V -->|winner| P[po-prd<br/>production spec]
    P --> B[product-owner<br/>PRD into Jira backlog]
    B --> PR([production — separate dev team])
    U[po-stakeholder-update] -.demo the tangible thing.- V
```

- **`po-mvp`** is early and disposable — speed to signal, not polish. Runs locally.
- **`po-evals`** feeds **`po-validate`**; it does not replace the human signal.
- **Jira + production only after a validated winner.** `kill` is a valid outcome.

📖 Full walkthrough: **[docs/flow.md](docs/flow.md)**

---

## 👥 The team

### Skills — orchestrators

> Run on your main **Opus** thread. Each owns its template + quality bar + checklist + worked example.

| Skill | Role |
|-------|------|
| 🧭 `po-strategy` | Discovery → decision-ready strategy brief + hypothesis (fans out researchers) |
| 🧪 `po-mvp` | Idea/hypothesis → fast, touchable prototype run locally (prototype mode) |
| 📊 `po-evals` | Golden set + rubric scoring + regression suite → measurable ship/iterate/kill evidence |
| ✅ `po-validate` | Prototype → decision from human signal + eval evidence (iterate/winner/kill) |
| 📝 `po-prd` | Validated winner → production-grade PRD citing the prototype |
| 📣 `po-stakeholder-update` | Work done → status / exec / launch / Slack updates |
| 📋 `product-owner` | PRD → Jira epics/stories/tasks + print-ready roadmap HTML |

### Agents — workers

> `model: sonnet`, dispatched by the skills. Cheap, isolated, parallel.

| Agent | Role |
|-------|------|
| `po-researcher` | One research dimension per dispatch, cited findings, no synthesis |
| `po-prd-writer` | Drafts a PRD from a brief using the `po-prd` template |
| `po-story-writer` | PRD → Jira-ready issues; drafts locally, pushes only after confirmation |
| `mvp-planner` | Read-only implementation plan (thin slice in prototype mode) |
| `mvp-implementer` | Builds one task; TDD for production, happy-path in prototype mode |
| `mvp-reviewer` | Independent diff review, severity-tagged |
| `mvp-verifier` | "Does it run" — build/tests with real output, no unverified claims |
| `eval-judge` | Independent scorer for `po-evals`; never grades its own output |

---

## 🧠 Design principles

- **Orchestrators are skills, workers are agents.** In Claude Code a subagent
  cannot spawn its own subagents, so the "manager" is your main thread (Opus)
  running an orchestrator skill, which dispatches Sonnet worker agents. This is
  what keeps cost down: Opus only for judgment/synthesis, Sonnet for the fan-out.
- **Templates live in one place.** Each skill owns its template + quality bar +
  checklist + worked example; agents invoke the skill rather than copy it.
- **Independence where it matters.** Reviewer, verifier, and eval-judge are
  separate from the implementer — a grader that wrote the code rubber-stamps it.
- **Artifacts accumulate.** Skills write to a predictable `docs/product/...` tree
  (`strategy/`, `evals/`, `validation/`, `prd/`) so a knowledge base builds up.

---

## ⚙️ Install

Requires Claude Code. Skills and agents are auto-discovered from `~/.claude/`.

```bash
./install.sh                              # global — all your projects
./install.sh --project /path/to/repo      # project-local — one repo
```

Restart Claude Code (or start a new session) so new **agents** load. Skills are
available immediately.

<details>
<summary><b>Manual install</b></summary>

```bash
cp -R skills/*    ~/.claude/skills/
cp    agents/*.md ~/.claude/agents/
```
</details>

<details>
<summary><b>Optional integrations</b></summary>

- **Jira** (`po-story-writer`, roadmap) — the Atlassian MCP server connected in
  Claude Code. Without it, issues are drafted locally to `jira-issues/`.
- **Web research** (`po-researcher`) — built-in WebSearch/WebFetch, or the
  `tavily-*` / `agent-reach` skills if you have them.
</details>

---

## ▶️ Usage

```text
/po-strategy should we build saved filter views?      # frame + research + brief
/po-mvp prototype the top bet                          # touchable local prototype
run evals on the saved-views prototype                 # golden set + scoring
/po-validate                                           # human test + decision
/po-prd                                                # spec the winner
```

You can also skip straight to `/po-mvp` for a small bet, or invoke any worker
agent directly.

---

## 🛠️ Customize

Every skill is a plain `SKILL.md` (Markdown + YAML frontmatter); every agent is a
`.md` with `name` / `description` / `model` / `tools` frontmatter. Edit them to
match your domain, Jira project, tone, or eval dimensions. Keep templates in the
skill so agents stay thin.

---

## 🙏 Credits

Structure and conventions (hierarchical context, quality-bar + checklist + worked
example per skill, delegation discipline, predictable artifact tree) were informed
by the [team-os-example-repo](https://github.com/in-the-weeds-hannah-stulberg/team-os-example-repo)
pattern.

<div align="center">
<sub>Built with Claude Code · MIT licensed</sub>
</div>
