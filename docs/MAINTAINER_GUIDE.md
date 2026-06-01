# Maintainer Guide

## Goals

- Keep repository quality high with minimal maintainability debt.
- Provide predictable contributor pathways.
- Preserve secure default behavior and update docs when controls change.

## Core maintainer duties

1. **Issue triage**
   - Enforce required repro fields from templates.
   - Use labels to set type, scope, and state.
   - Ask focused follow-up questions quickly and keep state explicit (`needs-info`, `needs-repro`, `ready`).

2. **Review and merge**
   - Require `make validate` pass for changes.
   - Ensure docs are updated for any user-visible behavior change.
   - Validate no secrets are exposed in diffs, logs, and issue comments.

3. **Release operations**
- Follow [docs/RELEASE_PROCESS.md](./RELEASE_PROCESS.md).
- Keep `CHANGELOG.md` current for each release candidate.
- Link security work to private reporting or advisory references.

4. **Security posture**
- Keep `docs/THREAT_MODEL.md`, `SECURITY.md`, and issue templates aligned.
- Escalate suspected vulnerabilities to private reporting only.
- Review PRs touching install, env handling, and network configuration more aggressively.

## Triage workflow (suggested)

1. Confirm duplicates and documentation-first checks.
2. Determine report class:
   - `bug` for reproducible failures
   - `documentation` for clarity/accuracy updates
   - `enhancement` for behavior additions
3. Estimate scope and set `ready` once acceptance criteria are clear.
4. Merge only after validation and security checks.

## Labeling conventions

- `area/installer`, `area/docs`, `area/config`, `area/docker`
- `bug`, `enhancement`, `documentation`, `security`
- `priority/high`, `priority/medium`, `priority/low`
- `needs-repro`, `needs-info`, `ready`, `blocked`

## Onboarding notes

- Update `README.md` when contributor entry points change.
- Keep `ROADMAP.md` milestones practical and open.
- Prefer small PRs so issue-linked work can be backfilled quickly.
