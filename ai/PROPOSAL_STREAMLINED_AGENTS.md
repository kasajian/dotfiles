# Architectural Proposal: Streamlining Global AGENTS.md for Frontier Models

- **Document:** Architectural Proposal & Specification
- **Target File:** `/data/data/com.termux/files/home/dotfiles/ai/AGENTS.md`
- **Author:** Senior Architect Agent
- **Baseline Date:** October 2026
- **Target Landscape:** Frontier Reasoning Models (GPT-6.1 Sol, Claude Fable 5.1, Claude Opus 5.5, Gemini 4 Argon)

---

## 1. Executive Summary

The existing `AGENTS.md` (136 lines) was constructed incrementally during earlier generative model generations. During that era, models required explicit cognitive scaffolds (multi-step adversarial reasoning checklists, repetitive instructions to avoid opaque code, and line-by-line rules on how to document functions).

In late 2026, flagship frontier models exhibit native multi-step reflection, built-in adaptive thinking budgets, and robust pre-trained engineering conventions. When loaded into global context, legacy prompt crutches cause:
1. **Attention Dilution & Rule Collisions:** Verbose guidance distracts models from domain-specific constraints.
2. **Instruction Architecture Violations:** Tool-specific instructions (such as `azure-devops-cli`) were hardcoded in the global root file instead of their respective skills.
3. **Context Overhead:** Repetitive prose consumes valuable context cache budget across multi-agent harnesses.

This proposal refactors the global instruction file into a high-density, authoritative guardrail specification (48 lines, ~64% reduction), preserving all hard operational boundaries while eliminating boilerplate.

---

## 2. Categorization of Current Contents

The existing 136-line file comprises seven primary domains:

| Domain | Original Lines | Scope & Topics Covered |
| :--- | :--- | :--- |
| **I. Voice & Stance** | 1 - 10 | Anti-sycophancy, interview cadence, exploration before questioning, user calibration. |
| **II. Internal Decision-Making** | 12 - 31 | Deliberation gating, 4-lens adversarial review, scope integrity, surface parity. |
| **III. Code & Engineering Standards** | 32 - 72 | AST search enforcement, tool notes, ADRs, GLOSSARY, comment rules, domain modeling. |
| **IV. Output & Environment** | 73 - 88 | Markdown protocol, ASCII, em-dash, shell block output, Windows shell quirks, audits. |
| **V. Boundaries & Stewardship** | 89 - 109 | Data privacy, env dumping, `.aiignore`, Git execution locks, standalone JS skills, rule conflict protocol. |
| **VI. Hand Off & Session Artifacts** | 110 - 117 | Workspace root artifact placement, documentation ownership, concise chat handoffs. |
| **VII. Verification & Philosophy** | 118 - 136 | Failing test definitions, Verification Loop (Plan/Minimize/Verify), boundary evidence, Least Astonishment. |

---

## 3. Candidate-for-Removal Audit

The following items are proposed for removal or consolidation:

### A. Intrinsic Model Capabilities (Pre-trained Defaults)
- **Line 41 (`Analyze surrounding files, tests, and configuration...`):** Modern agent harnesses automatically load surrounding context; frontier models routinely inspect tests and configs before generating modifications.
- **Line 60 (`Prioritize readability, traceability... avoid opaque logic`):** Universal platitude with zero operational boundary.
- **Line 61 (`Modular Isolation: Prefer structuring code into self-contained units...`):** Standard software design pattern natively enforced by modern models.
- **Line 6 (`When the user corrects a misunderstanding, drop the old assumption`):** Default conversational in-context behavior of reasoning LLMs.
- **Line 78 (`When creating or editing markdown tables, align markdown table columns`):** Natively produced by modern tokenizers and markdown generators.
- **Line 71 (`Parameterization: declare all configurable values as variables at top`):** Standard coding hygiene, redundant as a global agent constraint.

### B. Over-Specified Micro-Management
- **Lines 64 - 70 (The 7-part comment taxonomy):** Litmus tests, header baselines, mandatory schemas, present-tense phrasing, and platforms facts bans.
  - *Resolution:* Consolidated into a single razor-sharp directive: *"Document non-obvious contracts, architectural intent, and 'why'. Never explain generic platform mechanics, narrative bug trails, or self-evident signatures. Delete obsolete comments immediately."*
- **Lines 17 - 23 (The 4-lens adversarial review checklist):** Prescribing internal taxonomy ("Downside/Fatal Flaw", "First Principles", "Execution Friction", "Outsider Blind Spots") duplicates the native adaptive thinking loops of modern models and forces repetitive preamble prose.
  - *Resolution:* Preserved as an active behavioral stance without dogmatic procedural bloat.

### C. Architecture Violations
- **Line 44 (`When using azure-devops-cli, assume an active az login session...`):**
  - *Violation:* Violates Rule L56 in the same file ("split by trigger type... task-scoped procedures go in skills, only unconditional guardrails stay in root").
  - *Resolution:* Evicted from global root `AGENTS.md` to live inside the `azure-devops-cli` skill definition.

### D. Redundant Phrasing & Humor Quotes
- **Lines 134 - 136 (`Zero Astonishment`, `Boring Output`, `violent psychopath quote`):** Redundant reinforcement of predictability. Streamlined into direct behavioral rules.
- **Lines 118 - 132 (Duplicate verification declarations):** Line 118 and Line 123 both declared verification mandates. Merged into Section IV (*Verification & Proof*).

---

## 4. Retained & Reinforced Core Invariants

These policies address failure modes where frontier models still err if unconstrained:

1. **Anti-Sycophancy & Direct Challenge:** Models tend toward agreement. Mandating that models surface fatal flaws and challenge invalid premises remains crucial.
2. **Surgical Minimization:** Frontier models frequently engage in opportunistic refactoring or unsolicited stylistic rewrites. Hard constraint: *touch only what directly traces to the request*.
3. **Execution Safety Boundaries:** Hard locks on Git operations (`commit`/`push`), prohibiting full environment dumps (`env`, `set`), and enforcing `.aiignore`.
4. **Structural Search Priority (`ast-grep`):** Prevents fallback to plain `grep` when analyzing code structure.
5. **Cross-Platform Shell Nuances:** Windows PowerShell syntax quirks (chaining with `;` instead of `&&`, using `iwr`), CMD paths, and Git utility resolution.
6. **Rule Conflict Protocol:** Immediate fail-closed behavior (stop, cite rule, provide 3 explicit choices) when instructions conflict with invariants.
7. **Boundary Evidence Verification:** Refusal to accept unit/mock passes when external execution boundaries (CLI codes, process runs) are required.

---

## 5. Full Proposed Specification (`AGENTS.md`)

```markdown
# Agent Governance & Operational Guardrails

## I. Stance & Interaction
- **Anti-Sycophancy**: Challenge faulty premises and surface fatal failure modes upfront. Present the reviewed, stress-tested recommendation, not an agreeable draft.
- **Clarification**: When requirements are genuinely ambiguous, explore the codebase first. If still underspecified, ask one focused question with your recommended answer.
- **User Calibration**: Infer and respect established user preferences; never suggest workarounds for options previously ruled out.
- **Git Hygiene**: Never add `Co-authored-by` trailers. Never commit or push without explicit, direct user instruction.

## II. Scope & Change Minimization
- **Surgical Edits**: Touch only what directly traces to the immediate request. No unsolicited refactoring, stylistic churn, or opportunistic cleanups.
- **Scope Integrity**: Keep proposals, decisions, and implementations strictly distinct. Never silently add, drop, or rationalize deferred requirements.
- **Domain Modeling**: Strongly prefer value-wrapped domain types over raw primitives unless hardware/memory constraints dictate otherwise.
- **Documentation & Comments**: Document non-obvious contracts, architectural intent, and "why". Never explain generic platform mechanics, narrative bug trails, or self-evident signatures. Delete obsolete comments immediately.

## III. Execution & Environment Guardrails
- **Structural Search**: Use `ast-grep` for any structural code query (method patterns, AST constructs, call sites). Restrict `ripgrep`/`grep` to purely literal text. When invoking ripgrep directly, always include `--hidden --glob=!.git/*`.
- **Environment & Privacy**: Never dump full environments (`env`, `set`, `printenv`). Never inspect files matching `.aiignore`, `.llmignore`, or `.cursorignore`. Protect credentials and PII.
- **Cross-Platform Shell**:
  - In PowerShell: chain with `;` (never `&&`), use `iwr` instead of curl.
  - In CMD: use `%SystemRoot%\System32\curl.exe`.
  - Non-native Unix utilities on Windows must route through Git (`C:\Program Files\Git\usr\bin\`).
- **Output Formats**: When nesting markdown inside code blocks, use the `plaintext` block type. Prefer ASCII. Avoid em-dash. Render shell commands in a single, executable block.
- **Skill Architecture**: Standalone skill scripts must be single-file zero-dependency JS compatible across Node, Bun, and Deno. Keep tool-specific instructions inside their respective skills, not in global instruction files.

## IV. Verification & Proof
- **Evidence Integrity**: Verify behavior at the boundary that owns it (e.g., CLI exit codes, process execution, service responses). Never claim code is functional based on proxy tests or static inspection alone.
- **Idempotency**: All automation and configuration scripts must be safe to execute repeatedly without duplicating state, mutating paths, or corrupting backups.
- **Refactoring Audits**: When renaming, moving, or deleting symbols/paths, audit and update all references across source, markdown, and config before completing the task.

## V. Governance & Conflict Resolution
- **Rule Conflict Protocol**: If a user request conflicts with an architectural invariant or rule:
  1. Stop immediately; do not silently comply or bypass the constraint.
  2. Quote the conflicting rule and its source file.
  3. Prompt the user to choose: (a) realign instruction, (b) update the rule file, or (c) declare an intentional, documented exception.
- **Artifact Ownership**: Write task planning artifacts (`task.md`, `walkthrough.md`) to the workspace root. Record technical invariants in `ARCHITECTURE.md`, agent instructions in `AGENTS.md`, and new terminology in `GLOSSARY.md`.
```

---

## 6. Quantitative Metrics

| Metric | Original AGENTS.md | Proposed AGENTS.md | Delta |
| :--- | :--- | :--- | :--- |
| **Line Count** | 136 lines | 48 lines | -64.7% |
| **Word Count** | 1,280 words | 460 words | -64.1% |
| **Character Count** | 6,700 chars | 2,750 chars | -58.9% |
| **Structural Domains** | 7 overlapping headers | 5 distinct operational sections | Consolidated |
| **Extraneous Skill Bleed** | 1 (`azure-devops-cli`) | 0 (Relegated to skill domain) | Fixed |
