# Repository Architecture

This document describes the architectural design and technical invariants of this dotfiles repository.

## Technical Constraints & Invariants
All bootstrap, setup, configuration, and environment scripts must be safe to run repeatedly. Running any script or sourcing any configuration multiple times must result in the same system state as running it once.

- **Environment Paths**: Modifying path variables (such as `PATH`, `MANPATH`, etc.) must always be guarded. Do not append or prepend directories unconditionally.
- **Service/Shell Initializations**: Initializing tools, environments, or SDKs (e.g., package managers, runtime managers, shell integrations) must check if the environment is already initialized before executing setup commands.
- **File & Symlink Operations**: Script operations that create or replace symbolic links or files must handle existing files/links gracefully. Do not create redundant backup files (`.bak`) or overwrite original backups during repeated executions.
