# Threat Model

## Scope and assets

This repository deploys and configures Hermes services. The primary assets are:

- Deployment scripts (`install.sh`) and generated service files.
- Configuration inputs (`config.yaml`, `.env`) and their values.
- Container/runtime environment (`docker-compose.yml`, service networking, exposed ports).
- Install logs, validation output, and support artifacts.

## Trust boundaries

- Operator machine: reads repository content and executes installer commands.
- GitHub-hosted repository: publishes installer and docs consumed by operators.
- Runtime host: runs hermes process, container runtime, and webhook ingress.
- External providers/APIs used by Hermes provider settings.

## Key threats

1. **Secret leakage**
   - Risk: bot tokens, API keys, or webhook secrets are committed, logged, or exposed.
   - Impact: unauthorized access and potential cost or data exposure.
   - Controls: `.env` separation, docs guidance, advisory process, and secret-handling checks.

2. **Command and config injection via contributed changes**
   - Risk: PRs introduce unsafe shell usage or weak input handling.
   - Impact: local compromise on deploy targets.
   - Controls: shell check, script review, and focused maintainers’ review before merge.

3. **Installer supply chain manipulation**
   - Risk: compromised or unexpected changes in installer steps.
   - Impact: execution of untrusted logic.
   - Controls: direct review of `install.sh`, reproducible installation instructions in README, and concise validation checks.

4. **Network exposure**
   - Risk: gateway or webhook endpoints exposed without intended access controls.
   - Impact: abuse, command flooding, or spam.
   - Controls: explicit local binding guidance (`127.0.0.1`), reverse proxy guidance, and rate limiting.

5. **Misconfiguration drift**
   - Risk: diverging values from defaults and templates.
   - Impact: outages or weaker controls.
   - Controls: documented defaults, issue triage, and maintainer review for config-affecting PRs.

## Detection and response

- Public issues should be used for non-sensitive failures and reproducible bugs.
- Sensitive incidents and vulnerabilities must go through [SECURITY.md](../SECURITY.md).
- The maintainer response process is documented in [SECURITY.md](../SECURITY.md).
- High-risk incidents should be prioritized for a patch and follow-up release in [docs/RELEASE_PROCESS.md](./RELEASE_PROCESS.md).

## Operational assumptions

- The maintainer model assumes contributors self-validate via `make validate`.
- This repo does not include runtime telemetry or centralized policy enforcement; operators are responsible for environment-level hardening.
