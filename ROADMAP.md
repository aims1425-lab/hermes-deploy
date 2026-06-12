# Roadmap

## Milestone 1: OSS maintenance foundation (current)

- ✅ Documented security posture in [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
- ✅ Added maintainer-facing guidance in [docs/MAINTAINER_GUIDE.md](docs/MAINTAINER_GUIDE.md).
- ✅ Formalized release workflow in [docs/RELEASE_PROCESS.md](docs/RELEASE_PROCESS.md).
- ✅ Expanded `SECURITY.md`, `CONTRIBUTING.md`, and contribution templates with maintainer-ready workflows.
- ✅ Added [docs/OSS_READINESS.md](docs/OSS_READINESS.md) to track readiness signals without overclaiming adoption.
- ✅ Added dependency-free smoke tests exposed through `make test`.
- Add or improve installer dry-run checks with a contribution-friendly issue checklist.
- Add a lightweight issue triage dashboard or label rubric in docs.

## Milestone 2: Contributor quality and predictability (next)

- Expand validation and smoke tests for docs-link checks, required-template presence, and public-safety regressions.
- Create a small `docs` issue label and encourage one PR per roadmap contribution item.
- Expand testing guidance for common shells and OS variants.
- Add contribution examples for configuration hardening and release notes.

## Milestone 3: Operational hardening and reliability (future)

- Add explicit smoke testing instructions for install + service start.
- Add release notes automation using existing GitHub release flow.
- Add a threat-model-informed security checklist in `.github/workflows/`.
- Add PR merge criteria that include risk review for network or token changes.
