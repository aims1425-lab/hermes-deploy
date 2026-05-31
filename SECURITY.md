# Security Policy

## Supported versions

This repository currently tracks development on the default branch and supports usage with the current file set and scripts in this project.

## Reporting a vulnerability

If you discover a security issue, please report it privately and do not open a public issue.

1. Open a [GitHub private security advisory](https://github.com/aims1425-lab/hermes-deploy/security/advisories/new).
2. Include clear reproduction steps and impacted files.
3. Do not include secrets, tokens, or private keys in your report.

The maintainer will acknowledge reports as soon as possible and coordinate fixes and release notes.

## Security best practices for this repository

- Never commit real credentials or API keys.
- Use `.env` for local secrets and keep `.env` in `.gitignore`.
- Pin deployment host firewall and webhook exposure as needed for your environment.
- Prefer HTTPS endpoints and rotate provider tokens regularly.
