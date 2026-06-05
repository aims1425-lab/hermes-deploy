# Changelog

## Unreleased

### Added
- Added [docs/CODEX_FOR_OSS_APPLICATION.md](docs/CODEX_FOR_OSS_APPLICATION.md) with a truthful, ready-to-copy OSS maintainer support application draft.
- Added [docs/OSS_READINESS.md](docs/OSS_READINESS.md) to track public repository readiness signals and anti-overclaiming rules.

### Changed
- Strengthened [README.md](README.md) with CI/release badges, clearer production positioning, architecture diagram, maintainer workflow, and explicit secret-safety boundaries.

## 0.1.1 - 2026-06-01

### Added
- Added comprehensive OSS maintainer documentation:
  - [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md)
  - [docs/RELEASE_PROCESS.md](docs/RELEASE_PROCESS.md)
  - [docs/MAINTAINER_GUIDE.md](docs/MAINTAINER_GUIDE.md)
- Expanded [CONTRIBUTING.md](CONTRIBUTING.md) with validation, issue triage, and security-reporting guidance.
- Expanded [SECURITY.md](SECURITY.md) with supported version policy, response expectations, and secret-handling.
- Expanded [ROADMAP.md](ROADMAP.md) into release-oriented milestones and contribution-friendly items.
- Added issue templates for documentation and security hardening proposals, and strengthened existing templates.
- Strengthened PR checklist and repository validation requirements.
- Updated [README.md](README.md) with maintainer links and OSS maintenance section.
- `scripts/validate.sh` now checks required OSS governance files and templates for presence and non-empty content.

### Changed
- Improved contributor guidance around reproducibility and triage workflows.
- Raised documentation coverage for maintainer/support operations without changing runtime behavior.

## 0.1.0 - 2026-05-31

### Added
- Initial Open Source readiness pass for repository governance and contribution workflow.
- Added standard OSS files: `LICENSE`, `CONTRIBUTING.md`, `SECURITY.md`, `CHANGELOG.md`, `ROADMAP.md`, `CODE_OF_CONDUCT.md`.
- Added GitHub community files and workflow for repository validation.
- Added lightweight validation tooling via `Makefile` and `scripts/validate.sh`.
- Updated README to reflect actual repository structure and contribution paths.

### Notes
- No functional behavior changes to `install.sh`, `config.yaml`, or `docker-compose.yml` were introduced in this pass.
