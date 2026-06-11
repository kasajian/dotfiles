# Agent Workflow & Behavior Guidelines

This document provides instructions for AI agents modifying or working within this repository.

## Verification Loop
When modifying setup scripts, configuration files, or environment configurations, you must verify that your changes are fully idempotent.

### Verification Checklist
1. **Constraint Validation**: Verify that your changes satisfy all technical idempotency invariants defined in [ARCHITECTURE.md](ARCHITECTURE.md).
2. **Execution Test**: Run the bootstrap scripts (`bootstrap.sh` or `bootstrap.bat` depending on the platform) multiple times in succession to verify no errors occur.
3. **Sourcing Test**: Source shell configuration files (e.g., `bashrc`) multiple times in a single session to verify that environment variables (like `PATH`) remain stable and do not accumulate duplicate entries.
