# Review Handoff: Streamlining the Global AGENTS.md

- **Purpose:** Brief the next reviewing model on a multi-model adversarial review
- **Status:** Round 1 complete; awaiting third-party arbitration
- **Date:** 2026-10-20

---

## 1. Background

`AGENTS.md` in this folder is the user's **global** agent-instructions file. Every agent harness loads it, including lower-tier and subagent models. It was written for weaker models. The user wants it trimmed for late-2026 frontier models (GPT-6.1 Sol, Claude Fable 5.1, Claude Opus 5.5, Gemini 4 Argon). The rules: remove what a modern model does by default, remove duplicates, and keep what is still needed.

The file is unchanged so far. Every rewrite below is still a proposal.

---

## 2. Files and reading order

| Order | File                              | Author                  | Role                                              |
| :---- | :-------------------------------- | :---------------------- | :------------------------------------------------ |
| 1     | `AGENTS.md`                       | User                    | Baseline (136 lines, 1,974 words, 13,667 bytes)   |
| 2     | `PROPOSAL_STREAMLINED_AGENTS.md`  | Gemini 3.8 Flash        | Categorization, removal list, 35-line rewrite     |
| 3     | `ADVERSARIAL_REVIEW_PITCH.md`     | Gemini 3.8 Flash        | Argument for the rewrite, plus 4 review vectors   |
| 4     | `ADVERSARIAL_REVIEW_ROUND1.md`    | Claude Opus 5.5         | Adversarial assessment: "Do not adopt as written" |

Read all four before responding. Do not rely on either author's summary of the other.

---

## 3. Where the reviewers agree

- The baseline is bloated and over-explains how to reason.
- Evict the `azure-devops-cli` note into its skill.
- Drop the 4-lens deliberation checklist as a procedure.
- Drop pure platitudes ("prioritize readability", "modular isolation", "analyze surrounding files", "align table columns", the psychopath quote).
- Collapse the 7-bullet comment taxonomy.
- Merge the duplicate verification blocks.
- The 5-section skeleton is an improvement.

## 4. Open disputes (arbitrate these)

| #  | Question                                                                                                                                     | Proposal position               | Round 1 position                                            |
| :- | :------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------ | :---------------------------------------------------------- |
| D1 | About 25 rules were dropped without being listed. Are those losses acceptable?                                                               | Implicitly yes                  | No; every drop needs a disposition entry                    |
| D2 | Do late-2026 models need less *content*, or only a calmer *tone*?                                                                            | Less content                    | Calmer tone; models now over-trigger on absolutes           |
| D3 | Should a global file be tuned for frontier models when Flash-tier subagents load it too?                                                     | Frontier only                   | Must hold up on lower tiers                                 |
| D4 | "Grill me" as the default, or only when the task is "genuinely ambiguous"?                                                                   | Only when ambiguous             | Default; autopilot is a per-task override                   |
| D5 | Shrink the root file by deleting rules, or by moving them to skills/applyTo files?                                                           | Delete                          | Move                                                        |
| D6 | Target size?                                                                                                                                 | ~35 lines                       | ~55-65 lines, or smaller only via MOVE                      |
| D7 | Is a behavioral probe suite required before adoption?                                                                                        | Not addressed                   | Required, on one top-tier and one Flash-tier model          |

---

## 5. Your task

Act as an independent senior architect and arbiter. You owe neither author anything.

1. Rule on each dispute D1-D7. Give one sentence of reasoning per ruling.
2. Find anything **both** reviewers missed. Look for baseline rules both treated wrongly, and for risks neither raised.
3. Produce the **disposition table**: every baseline rule (by line number) marked KEEP, MERGE (into which line), MOVE (to which file or skill), or DROP (with a reason).
4. Produce a candidate `AGENTS.md` based on your table. Measure its size with a real tool (`wc`). Do not estimate.
5. State which probes from Round 1, Section 5 your candidate is expected to pass, and which still need to be run.

## 6. Constraints on your response

- Do not edit `AGENTS.md`. Write your output to `ADVERSARIAL_REVIEW_ROUND2.md` in this folder.
- Do not invent metrics or model-capability claims. Cite a source or say it is unverified.
- Do not drop a baseline rule without listing it in the disposition table.
- Use ASCII only, no em-dashes, and align markdown table columns (these are the baseline's own output rules).
