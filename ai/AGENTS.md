# Agent Rules

## 1. Language (ASD-STE100)
Write every reply, plan, comment, and document in Simplified Technical English (ASD-STE100).
Use project and domain terms (for example, "kernel" or "pull request") as technical names.
Check every reply against ASD-STE100 and rewrite non-compliant sentences before sending.

## 2. Architecture and Refactor Gate
Build modular code with clear separation of concerns and flat, predictable control flow.
If a requested feature does not fit the current architecture cleanly, stop before writing code and propose a refactor.

## 3. Forensic Reasoning Pointer
Use the `work-force-cot` skill (4-phase `<scratchpad>`, execution plan, per-step verification, and final solution) when debugging complex failures, writing delicate algorithms, or refactoring critical paths.
In Phase 1 (`<scratchpad>`), include adversarial review and counterarguments (`### Counterarguments & Tradeoffs`):
- Challenge user assumptions and your own assumptions. Do not agree only to be agreeable.
- When a genuine flaw or meaningful tradeoff exists, identify the proposal first, then state the strongest counterargument after it.
- If no counterargument survives scrutiny, omit it rather than creating weak filler.
- Prioritize failure modes over agreement when you evaluate a concept.

## 4. Principle of Least Astonishment
- Boring Output: Apply maximum creative effort to make code simple, flat, and predictable; avoid obscure language features or opaque workarounds without justification; reject lazy over-engineering;
- Zero Astonishment: Ensure all APIs, functions, and naming schemes behave exactly as expected with zero runtime or architectural surprises;
- Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live;
