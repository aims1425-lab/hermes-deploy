# Release Process

## Current process

This repository currently releases changes through normal commits on `main` and explicit tags in GitHub.

There is no fixed release calendar. Releases are made when security updates, documentation hardening, or maintenance items are complete.

## Suggested flow

1. **Candidate prep**
   - Confirm issue/PR scope and owner.
   - Run `make validate` and record the result.
   - Update `CHANGELOG.md` under `Unreleased` with user-facing items.

2. **Pre-release checks**
   - Review installer and validation changes for unintended behavior.
   - Confirm `.env.example`, `docs/`, and issue templates are updated together when relevant.
   - Reconcile known risks in PR description and label high-risk items.

3. **Release package**
   - Cut a release branch or commit point.
   - Tag using semantic versioning if release artifacts are created.
   - Draft release notes from `CHANGELOG.md`.

4. **Communication**
   - Publish changelog notes and migration notes where behavior changes users might notice.
   - Keep `README.md` installation and maintainer links current.

## Patch and security releases

- Security fixes should be prioritized and included in the next possible release.
- If an issue requires immediate response, security triage may issue a faster release.
- Security-related changes should reference the corresponding advisory in `SECURITY.md`.

## Maintainer checklist

- [ ] PR/issue status verified as `ready`
- [ ] `make validate` completed
- [ ] `CHANGELOG.md` updated
- [ ] Documentation pointers verified (README + relevant docs)
- [ ] Threat model impact reviewed (`docs/THREAT_MODEL.md`)
