# Contributing

Thanks for helping improve this repository.

## Quick start for contributors

1. Open an issue before major changes to align on scope.
2. Use clear, descriptive branch names.
3. Keep changes small and focused.
4. Run `make validate` before opening a pull request.

## Development workflow

- Edit only what is needed for the task.
- Add or update docs for behavioral changes.
- Keep scripts readable and shell-compatible with `bash`.
- Avoid adding secrets, test fixtures with credentials, or environment-specific assumptions.

## Commit guidance

Use short, imperative commit messages. Example:

- `docs: update README with repository layout`
- `ci: add repo validation workflow`
- `chore: add OSS governance files`

## Pull request checklist

- The PR has a clear description and rationale.
- No unrelated refactors.
- Validation passes (`make validate`).
- README and related docs updated for user-visible changes.

## Support and questions

Open an issue for support questions and security-sensitive concerns in `SECURITY.md`.
