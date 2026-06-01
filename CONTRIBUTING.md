# Contributing

Thanks for helping improve this repository.

## Quick start for contributors

1. For behavior changes, open an issue first to align on scope.
2. Use clear, descriptive branch names.
3. Keep changes small and focused.
4. Run `make validate` before opening a pull request.

## Development workflow

- Edit only what is needed for the task.
- Add or update docs for behavioral changes.
- Keep scripts readable and shell-compatible with `bash`.
- Avoid adding secrets, test fixtures with credentials, or environment-specific assumptions.
- Use single-purpose commits that explain intent.
- Prefer small, reviewable PRs over large refactors.

## Local validation checklist

Before opening a pull request:

- `bash -n install.sh`
- `bash -n scripts/validate.sh`
- `make validate`
- If installed:
  - `shellcheck install.sh scripts/validate.sh`
  - `yq eval '.' config.yaml`
  - `yq eval '.' docker-compose.yml`
  - `docker compose -f docker-compose.yml config`

At minimum, `make validate` must pass.

## Commit guidance

Use short, imperative commit messages. Example:

- `docs: update README with repository layout`
- `ci: add repo validation workflow`
- `chore: add OSS governance files`

## Pull request checklist

- The PR has a clear description and rationale.
- Related issue linked when applicable.
- No unrelated refactors.
- Validation passes (`make validate`).
- Security impact reviewed if tokens, env vars, network listeners, or shell execution changed.
- README and related docs updated for user-visible changes.

## Labels and issue triage

We use labels to keep work discoverable and prioritizable. Contributors do not need to add labels directly, but you can help by including:

- Area: `area/installer`, `area/docker`, `area/config`, `area/docs`, `area/security`
- Type: `bug`, `enhancement`, `documentation`
- Priority intent: `priority/high`, `priority/medium`, `priority/low`
- State: `needs-info`, `needs-repro`, `ready`

Typical flow for maintainers:

1. Confirm issue is reproducible and not in existing docs.
2. Add triage label(s) and a severity/priority where useful.
3. If information is missing, use `needs-info` and ask follow-up questions.
4. Move to `ready` once scope and expectations are clear.
5. Close with clear rationale when fixed or intentionally not planned.

## Issue workflow

- Search open/closed issues first.
- Include exact commands, expected output, and full error snippets (redact secrets).
- For bugs, include:
  - Host OS and shell
  - Minimal configuration relevant to the issue (`.env`, `config.yaml`, command flags)
  - Steps to reproduce
- For feature work, include:
  - Problem statement and user impact
  - Alternative solutions considered
  - Suggested acceptance criteria

For support questions only, check `docs/TROUBLESHOOTING.md` first before opening a new issue.

## Support and questions

Open an issue for support questions and non-sensitive bug reports.

For security-sensitive concerns, use the private process in `SECURITY.md`.
