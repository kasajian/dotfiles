# Pitch to Peer LLM Agents: The Case for a Lean AGENTS.md

- **Target Audience:** Reviewing LLM Agents (Claude Opus 5.5 / Fable 5.1, GPT-6.1 Sol, Gemini 4 Argon)
- **Subject:** Defending the Refactoring of `/data/data/com.termux/files/home/dotfiles/ai/AGENTS.md`
- **Companion Document:** `PROPOSAL_STREAMLINED_AGENTS.md`
- **Date:** October 2026

---

## 1. The Core Architectural Thesis

> **"Prompt engineering in 2026 is no longer about teaching a model how to think; it is about establishing strict boundaries on what an agent is permitted to execute."**

The legacy 136-line `AGENTS.md` was drafted when foundational models suffered from superficial reasoning, erratic commenting, and frequent failure to consider edge cases. Consequently, human authors built elaborate cognitive scaffolding directly into the system prompt: 4-lens internal deliberation checklists, 7 distinct bullet points on method comment philosophy, reminders to read surrounding files, and humorous reminders not to write surprising code.

In the era of 2026 frontier models (GPT-6.1 Sol, Claude Opus 5.5, Gemini 4 Argon), this approach actively degrades agent performance:

1. **Context Bloat & Token Degradation:** Every token in a globally loaded system prompt consumes attention budget and recurring cache reads across every turn of every subagent.
2. **Reasoning Collisions:** When a model equipped with native adaptive thinking (such as Opus 5.5 or Gemini 4 Argon) is forced to follow an artificial 4-step checklist ("Downside/Fatal Flaw, First Principles, Execution Friction, Outsider Blind Spots"), it often outputs verbose meta-commentary rather than executing the actual task.
3. **Instruction Architecture Drift:** Over time, developer conveniences (such as `azure-devops-cli` login reminders) pollute the global root instruction file, violating the project's own rule that task-scoped procedures belong in skills.

Our proposed refactoring cuts 64.7% of the lines (136 down to 48) while **increasing** the density of actual operational guardrails.

---

## 2. Defense of Key Pruning Decisions

### A. Pruning Cognitive Hand-Holding (The 4-Lens Deliberation Checklist)
- **Legacy Rule:** Mandatory internal review across: (1) Fatal Flaws, (2) First Principles, (3) Execution Friction, (4) Outsider Blind Spots.
- **Why We Pruned It:** 2026 reasoning models already evaluate failure modes, edge cases, and first principles during internal chain-of-thought tokens. Demanding rigid taxonomy produces mechanical boilerplate in outputs without improving decision quality.
- **What We Kept:** The core anti-sycophancy stance and risk-first posture: *"Challenge faulty premises and surface fatal failure modes upfront. Present the reviewed, stress-tested recommendation, not an agreeable draft."*

### B. Collapsing the 7-Bullet Comment Taxonomy into One Directive
- **Legacy Rule:** 15 lines detailing baseline comment headers, mandatory schema projections, signature litmus tests, present-tense rationale, and generic platform fact bans.
- **Why We Pruned It:** Modern models do not need to be taught what a method signature conveys. The actual pathology in modern models is twofold:
  1. Writing narrative explanations of past bug fixes inside the code.
  2. Inlining platform documentation (e.g., explaining how JavaScript Promises or POSIX signals work).
- **The Lean Replacement:** *"Document non-obvious contracts, architectural intent, and 'why'. Never explain generic platform mechanics, narrative bug trails, or self-evident signatures. Delete obsolete comments immediately."* This targets the exact failure mode without lecturing the model on basic software engineering.

### C. Evicting Tool-Specific Hints (`azure-devops-cli`)
- **Legacy Rule:** Line 44: *"When using azure-devops-cli, assume an active az login session; az devops commands are available."*
- **Why We Pruned It:** The legacy `AGENTS.md` explicitly commanded: *"file-type-scoped rules go in applyTo-gated instruction files, intent/task-scoped procedures go in skills, and only proactive unconditional guardrails stay in the always-loaded root file."* Leaving Azure DevOps hints in a global dotfiles repository directly contradicted the stated architecture. It belongs in the `azure-devops-cli` skill.

### D. Eliminating Generic Platitudes
- **Legacy Rule:** "Prioritize readability, traceability, and maintainability", "Modular Isolation", "Analyze surrounding files".
- **Why We Pruned It:** Every LLM on Earth is pre-trained on clean code principles. Prompting an LLM to "prioritize readability" has zero discriminatory power. Removing it clears signal paths for hard constraints (e.g., *Surgical Edits*).

---

## 3. Defense of Retained & Hardened Invariants

Reviewers might ask: *Why keep the remaining rules if 2026 models are so smart?*

1. **Surgical Edits (Anti-Slop / Anti-Overengineering):**
   - *Threat:* Modern models are so capable that they constantly suffer from "developer boredom"—they want to refactor nearby functions, modernize syntax, fix typos in unrelated comments, or reformat files.
   - *Defense:* The rule *"Touch only what directly traces to the immediate request. No unsolicited refactoring, stylistic churn, or opportunistic cleanups"* remains our strongest defense against massive, noisy PR diffs.

2. **Execution Safety Gates (Git & Environment):**
   - *Threat:* Autonomous agents with command execution tools can easily run `git commit`, `git push`, or dump environment variables containing live tokens.
   - *Defense:* Absolute prohibition on unauthorized git commits/pushes and full environment dumps (`env`, `set`).

3. **Structural Search Priority (`ast-grep`):**
   - *Threat:* Unless bound by a blocking rule, models reach for `grep` or `ripgrep` even when searching for AST node patterns (e.g., function calls with specific argument signatures), resulting in regex hallucinations.
   - *Defense:* Retaining the strict gate: AST searches must invoke `ast-grep`.

4. **Rule Conflict Protocol:**
   - *Threat:* Models are trained to please the user. When a user asks an agent to do something that violates an architectural constraint, the model will often rationalize a silent exception.
   - *Defense:* The strict three-way fork (stop, cite rule, force user to choose: realign, update rule, or declare documented exception) eliminates unauthorized compromises.

5. **Cross-Platform Shell Mechanics:**
   - *Threat:* Multi-agent harnesses running on Windows or hybrid Termux/WSL environments frequently break when models use Bash-isms (`&&`, `curl` flags) in PowerShell or vice-versa.
   - *Defense:* Explicit, non-negotiable syntax patterns for PowerShell and CMD.

---

## 4. Adversarial Review Prompts for Peer Models

If you are an LLM agent reviewing this proposal, stress-test it against these four adversarial vectors:

### Vector 1: The Omission Vector
*Did we remove something subtle that you, as an LLM, still rely on to avoid mistakes?*
- Specifically: Does collapsing the comment rules into one line leave ambiguity about when method docstrings are strictly mandatory?
- Does removing the explicit four lenses of adversarial review cause you to skip checking operational friction or maintainer blind spots?

### Vector 2: The Scope Vector
*Is the boundary between global `AGENTS.md` and repository-level `ARCHITECTURE.md` razor-sharp?*
- Did we leave anything in `AGENTS.md` that truly belongs in `ARCHITECTURE.md` (e.g., domain modeling or idempotency invariants)? Or does the agent need those invariants top-of-mind across all repositories?

### Vector 3: The Edge-Case Vector
*Where can an agent exploit the leaner wording to rationalize bad behavior?*
- For example: Does "Surgical Edits" prevent an agent from fixing a blatant syntax error in a line adjacent to the requested change? How should an agent resolve that tension?

### Vector 4: The 2026 Model Capability Test
*Are any of our retained rules STILL obsolete for models like GPT-6.1 Sol, Claude Opus 5.5, or Gemini 4 Argon?*
- Could we compress this even further—down to 30 lines? What is the irreducible minimum?

---

## 5. Summary Stance

We submit that the 48-line proposal in `PROPOSAL_STREAMLINED_AGENTS.md` provides **superior operational safety and compliance** compared to the 136-line predecessor. By eliminating token noise and obsolete scaffolding, the agent's attention window is focused entirely on boundaries, contracts, and proof.

We invite your rigorous critique.
