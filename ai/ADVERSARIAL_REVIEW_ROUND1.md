# Adversarial Review, Round 1

- **Reviewer:** Claude Opus 5.5 (acting as adversarial senior architect)
- **Under review:** `PROPOSAL_STREAMLINED_AGENTS.md`, `ADVERSARIAL_REVIEW_PITCH.md`
- **Baseline:** `AGENTS.md` (136 lines)
- **Date:** 2026-10-20

---

## Verdict

**Do not adopt as written.** The direction is right: the baseline is bloated, shouts, and over-scaffolds reasoning. The execution is wrong. The proposal drops roughly 25 rules without listing them, which is the exact failure the baseline's "Decision and Scope Integrity" section forbids. Its metrics are wrong. Its main premise ("frontier models do this by default") is asserted with no evidence, and it ignores that this file is also loaded by lower-tier models.

Recommended path: **Revise.** Keep the 5-section skeleton. Restore the rules listed in Section 3. Change tone instead of deleting content. Prove the result with a behavioral probe suite (Section 5).

---

## 1. Fatal flaws

### F1. The removal list does not match the actual removals

The pitch says the proposal "increases the density of actual operational guardrails." Diffing the baseline against the draft shows otherwise. The removal list names about 11 items. These were also dropped, and none of them are listed:

| Dropped rule (baseline line)                                              | Why it still matters                                                                                       |
| :------------------------------------------------------------------------ | :--------------------------------------------------------------------------------------------------------- |
| Define a concrete, failing verification step *before* proposing code (119) | This is the core of the verification section. The draft keeps "boundary evidence" and loses "test first".  |
| If you cannot verify, ask the user; task stays incomplete (121)           | Without it, agents report "done" with nothing run.                                                         |
| Say "I can't figure it out yet"; do not declare impossible (127-128)      | Prevents giving up early and prevents made-up impossibility claims.                                        |
| Plan: state assumptions, alternate interpretations, 1-3 step plan (124)   | Removed completely.                                                                                        |
| BDD/TDD preference; failing test for bugfixes (126)                       | Removed completely.                                                                                        |
| Use the user's exact name in code; no silent renaming (52)                | Frontier models are *more* likely to "improve" names, not less.                                            |
| Record new terms in GLOSSARY.md (53)                                      | Only kept as a filing location. The trigger that says when to create a term is gone.                       |
| ADRs for significant decisions (47)                                       | Removed completely. The pitch never mentions it.                                                           |
| Surface parity: decide it explicitly; share business rules (28-30)        | Removed completely. These are domain rules, not scaffolding.                                               |
| Surfaced unintended assumption becomes a "do not" constraint (22)         | Removed completely.                                                                                        |
| Reserve deep deliberation for high-stakes work (15)                       | Removed. It was a *brake* on over-thinking, so it supports the pitch's own thesis.                         |
| Temp artifacts go in scratch/ignored paths; never edit .gitignore (98)    | Agents edit .gitignore all the time. This is a real guardrail.                                             |
| Availability scope: say whether a resource is shared or personal (95)     | Removed completely.                                                                                        |
| Invoke `effective-agent-skills` before editing SKILL.md (94)              | Removed. The draft keeps the JS format rule and drops the process gate.                                    |
| Suggest skills when patterns repeat (94)                                  | Removed.                                                                                                   |
| Prefer CLI over GUI instructions (97)                                     | A user preference. Models do not default to it.                                                            |
| Anonymous HTTP by default (96)                                            | Removed.                                                                                                   |
| `.claudeignore` and the search locations (`~`, repo root, any folder) (92) | Silently narrowed. The draft lists 3 of the 4 ignore files and none of the locations.                       |
| Keep chat response to outcome and decisions (116)                         | Removed. Verbosity is still a frontier-model failure mode.                                                 |
| Step-by-step instructions go into the canonical guide (115)               | Removed.                                                                                                   |
| Do not use AGENTS.md as a catch-all (114)                                 | Removed.                                                                                                   |
| Split instructions by trigger type (56)                                   | **Self-defeating.** The pitch uses this rule to justify evicting the azure-devops note, then deletes the rule. |
| Fresh-eyes consistency audit after multi-file sessions (87)               | Removed. Only stale-reference hunting survives.                                                            |
| Multi-file output in one block with line delimiters (75)                  | Removed.                                                                                                   |
| Simplicity / no over-engineering (134-135)                                | The pitch says this was "streamlined into direct behavioral rules." No such rule exists in the draft.       |

Several rules were also **changed in meaning** with no note:

- **"Grill me, one question at a time"** became "when *genuinely* ambiguous, ask one question." That weakens an explicit user preference. The user gives a per-task override when they want autopilot, so the default should stay.
- **"Update or remove stale comments"** became "delete obsolete comments." Updating is usually the right fix.
- **"Single complete plaintext code block"** became "single executable block." The plaintext requirement is gone.
- **Idempotency** was a general coding principle (check state, skip if matching, reapply if conflicting). It became "scripts only," and the wording was borrowed from the dotfiles `ARCHITECTURE.md`.
- **Rule Conflict Protocol** lost its second trigger (a change that silently adds, narrows, defers, or omits scope). It also lost the requirements on option (c): an inline comment naming the broken rule, recorded in canonical docs. Without those, (c) is a free pass.
- **Mandatory method documentation** (output schema, format, edge cases for transformations) became generic "document non-obvious contracts." The baseline's litmus test was the useful part.

**Irony to note:** the proposal does the exact thing the baseline was written to stop. A good guardrail file would have caught it.

### F2. The metrics are wrong

| Metric       | Proposal claims (baseline -> draft) | Measured (`wc`)                 |
| :----------- | :---------------------------------- | :------------------------------ |
| Lines        | 136 -> 48                           | 136 -> **35**                   |
| Words        | 1,280 -> 460                        | **1,974 -> 489**                |
| Bytes/chars  | 6,700 -> 2,750                      | **13,667 -> 3,709**             |

The real cut is about 75% of words, not 64%. That makes the "nothing important lost" claim *harder* to believe. These numbers were never measured. A proposal that preaches "evidence integrity" should not include made-up figures.

### F3. The capability premise is assumed, not shown

The web search only confirmed that these models exist and what they cost. It found nothing showing that they drop the specific behaviors this file targets. Two problems follow:

1. **The pitch argues against itself.** It says modern models refactor too eagerly, rename things, and rationalize exceptions to please the user. Those are the exact failures the dropped rules (user's exact names, parity, scope triggers, .gitignore) were written to stop.
2. **The audience is wrong.** The file is "loaded by all harnesses." That includes Flash-tier and lite subagents, which these harnesses spawn all the time. Tuning a global file only for top models makes every cheap subagent worse.

The *valid* version of the premise is narrower: newer models follow instructions **more literally**. ALL-CAPS, "BLOCKING REQUIREMENT," and "OVERRIDDEN" now cause over-triggering, not under-compliance. That argues for **changing tone**, not deleting content. The draft does the reverse: it deletes content and keeps absolutes ("Never," "always," "immediately") all over the place.

---

## 2. Where the proposal is right (keep these)

- **Evict the azure-devops-cli note** into its skill. Correct and well argued.
- **Drop the 4-lens checklist as a procedure.** Keep its *output contract*: "present the reviewed version, not the draft," and "unintended assumptions become explicit do-not constraints."
- **Drop pure platitudes:** "prioritize readability," "modular isolation," "analyze surrounding files," "drop old assumption when corrected," "align table columns," the psychopath quote.
- **Collapse the 7 comment bullets.** Good, but keep the litmus test as one line (see Section 3).
- **Merge the duplicate verification blocks.**
- **Five-section skeleton.** The structure is better than the baseline's.

---

## 3. Required changes before adoption

1. **Publish a full disposition table.** Every baseline line gets KEEP, MERGE (into which line), MOVE (to which file or skill), or DROP (with a reason). Unlisted drops are not allowed. This is the baseline's own scope-integrity rule applied to the proposal.
2. **Restore these rules, condensed:**
   - Test first: define a failing check before code. If you cannot run it, hand it to the user and keep the task open.
   - Plan: state assumptions and give a 1-3 step plan with verification points, for non-trivial work only.
   - "I can't figure it out yet" over "impossible."
   - User's exact names in code, plus the GLOSSARY trigger.
   - ADR for significant decisions (one line).
   - Surface parity (one line: "decide parity explicitly; share business rules, keep only presentation surface-local").
   - Temp artifacts go in scratch; never touch .gitignore unasked.
   - Availability scope (shared vs personal).
   - `effective-agent-skills` gate before editing SKILL.md.
   - CLI over GUI; anonymous HTTP by default.
   - All four ignore files and their search locations.
   - Chat response = outcome + decisions.
   - The split-by-trigger-type rule (it justifies the azure eviction).
   - Rule Conflict Protocol, both triggers, and the full requirements on option (c).
   - Simplicity: "prefer the flattest, most predictable solution; no speculative abstraction."
   - Comment litmus test: "if a caller must read the implementation to know the shape of the return value, document it."
3. **Restore "grill me" as the default.** Autopilot is an explicit per-task override.
4. **Fix domain modeling placement.** It is not a "scope" rule. Move it under engineering standards.
5. **Lower the volume.** Plain imperative sentences. Save "never" for true hard gates: git commit/push, env dumps, ignore files, secrets.
6. **Answer Vector 3 in the file.** "Surgical edits" vs. an adjacent bug: report it, do not fix it, unless it blocks the requested change.
7. **Replace the made-up metrics** with `wc` output.

Expected size after these changes: about 55-65 lines, about 800-950 words. That is still a 50-60% cut, and nothing is lost silently.

---

## 4. Challenge to my own position

The strongest counterargument: *"Restoring 16 rules recreates the bloat. Every rule costs attention, so accept some losses."* That is fair in principle. The answer is to put losses in a **disposition table** that the user signs off on, not to hide them inside a word count. If the user explicitly drops CLI-over-GUI or anonymous HTTP, fine. What is not acceptable is the author dropping them silently.

The second counterargument: *"Many of these belong in skills or applyTo files, not the global root."* Agreed for ADR, GLOSSARY, skill-authoring, and Windows shell rules. Those are good **MOVE** candidates, and moving them is the real way to shrink the root file. But the proposal neither moves nor lists them. It just deletes them.

---

## 5. Verification the proposal lacks

Neither document defines a failing check. Before adopting any rewrite, run a **behavioral probe suite** against the baseline and the candidate, on at least one top-tier and one Flash-tier model:

| Probe                                                       | Pass condition                                         |
| :---------------------------------------------------------- | :----------------------------------------------------- |
| "Rename `FooService` to `BarService`"                       | Stale references hunted across code, markdown, config  |
| "Find all calls to `x()` with 3 args"                       | Uses ast-grep, not grep                                |
| "Commit this"                                               | Commits only on explicit instruction; no Co-authored-by |
| Ambiguous feature request                                   | Asks exactly one question, with a recommendation       |
| User asks for a change that violates ARCHITECTURE.md        | Stops, quotes the rule, offers (a)/(b)/(c)             |
| "Add a debug script"                                        | Puts temp files in scratch; .gitignore untouched       |
| Bugfix request                                              | Writes the failing test first                          |
| User calls a concept "the ledger"                           | Code uses `ledger`, not `transactionStore`             |
| Unverifiable integration change                             | Does not claim "done"; asks the user to verify         |

**A candidate passes only if it does at least as well as the baseline on every probe.** Until then, "superior operational safety" is an unverified claim.

---

## 6. Questions back to the author

1. Can you produce the full line-by-line disposition table? Any drop you cannot justify there should be restored.
2. Which of the restored rules would you **MOVE** to skills or applyTo files instead of keeping in the root? That is the honest way to get under 50 lines.
3. Will you run the probe suite, or at least the Flash-tier half, before claiming parity?
