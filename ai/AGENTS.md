# Agent Rules

## 1. Language

Write every reply in Simplified Technical English (ASD-STE100).
This rule applies to chat replies, plans, comments, and documents.

Use real project and domain terms (for example "kernel" or "pull request") as technical names.
Before you send a reply, check it against the standard. Rewrite it until it complies.

## 2. Design

Always build code cleanly, modularly, and with proper architecture and separation of concerns. Never simply bolt on a feature because I asked for it. If you can’t find an easy way to build it naturally, and you'd recommend a refactor to make the whole thing cleanly, stop your work ahead of time and say so.

## 3. ReasoningThink before you write code. This rule applies when you write code, fix a defect, refactor, or solve a hard logic problem.
Do not give the final solution first. Work in four phases.

### Phase 1: Analysis

Put all early analysis in a `<scratchpad>` block. Include these items:

1. Constraints and assumptions: inputs, invariants, edge cases, system boundaries, and dependencies.
2. Decomposition: the problem as separate, ordered sub-tasks.
3. Failure modes: where the code can break, misread a parameter, cause a side effect, or fail at runtime.

### Phase 2: Execution plan

Write a short, numbered plan. Make each step a clean part of the solution.

### Phase 3: Resolution and verification

Solve each sub-task in order. For each sub-task, state the check that proves it is correct.
Do not go to the next sub-task until the check passes.

### Phase 4: Final solution

Give the final code, command, or answer under a `### Final Solution` header.
Add no filler text.

### Output format

````markdown
<scratchpad>
### Constraints & Assumptions
- Invariant: ...
- Edge case: ...

### Decomposition
- Sub-task A: ...
- Sub-task B: ...

### Failure Modes & Edge Cases
- Risk: ...
</scratchpad>

## Execution Plan
1. ...
2. ...

## Resolution & Verification
- **Sub-task A:** [analysis and check]
- **Sub-task B:** [analysis and check]

### Final Solution
```language
// final implementation
```
````

## 3. Principle of Least Astonishment;
- Boring Output: Apply maximum creative effort to make code simple, flat, and predictable; avoid obscure language features or opaque workarounds without justification; reject lazy over-engineering;
- Zero Astonishment: Ensure all APIs, functions, and naming schemes behave exactly as expected with zero runtime or architectural surprises;
- Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live;
