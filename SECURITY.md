# Security Policy

## Supported versions

| Version | Status | Notes |
|---------|--------|-------|
| `0.1.x` / `main` | Supported | Security fixes and maintenance are applied on the default branch during OSS readiness hardening. |
| Older tags | Unsupported | Please upgrade to `main` for the latest security guidance. |

Support scope is limited to documented features in this repository and current installer/configuration patterns.

## Reporting a vulnerability

If you discover a security issue, please report it privately and do not open a public issue.

1. Open a [GitHub private security advisory](https://github.com/aims1425-lab/hermes-deploy/security/advisories/new).
2. Include clear reproduction steps and impacted files.
3. Do not include secrets, tokens, or private keys in your report.

The maintainer will acknowledge reports as soon as possible and coordinate fixes and release notes.

## Response expectations

- Acknowledgment: within 5 business days.
- Initial investigation/update: within 10 business days.
- Fix window: assessed per severity; critical issues are prioritized.
- Public disclosure: coordinated only after a mitigation is ready and verified.

## Security best practices for this repository

- Never commit real credentials or API keys.
- Use `.env` for local secrets and keep `.env` in `.gitignore`.
- Pin deployment host firewall and webhook exposure as needed for your environment.
- Prefer HTTPS endpoints and rotate provider tokens regularly.

## Secret-handling policy

- Do not include real secrets in issue descriptions, commits, logs, or screenshots.
- If a secret may have been committed, revoke and rotate it immediately and report from a secure channel.
- Do not leave old tokens in `.env`, CI logs, or shell history where possible.
- If in doubt, start from `[secret-handling guidance](docs/THREAT_MODEL.md)` and remove shared artifacts before continuing.

## Security references

- Threat model: [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md)
- Release process: [docs/RELEASE_PROCESS.md](docs/RELEASE_PROCESS.md)
