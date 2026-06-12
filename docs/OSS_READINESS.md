# OSS Readiness Checklist

This checklist keeps the repository ready for OSS support programs, public review, and contributor onboarding.

## Current baseline

- [x] Public repository
- [x] Standard license
- [x] README with quickstart and deployment options
- [x] Security policy
- [x] Threat model
- [x] Contributor guide
- [x] Code of conduct
- [x] Changelog
- [x] Roadmap
- [x] Release process
- [x] Maintainer guide
- [x] Issue templates
- [x] Pull request template
- [x] GitHub Actions CI
- [x] Local validation command: `make validate`
- [x] Local smoke test command: `make test`
- [x] Release tag and release notes

## Before applying to a support program

- [ ] Confirm latest CI is green.
- [ ] Confirm latest release points to the current readiness baseline.
- [ ] Do not include secrets, private customer data, private URLs, or commercial product internals.
- [ ] Keep application answers, grant drafts, and private reviewer notes outside the public repository.
- [ ] Frame the request around public maintainer work: tests, CI, PR review, issue triage, docs, releases, and security.

## Signals to improve over time

These are not official gates, but they make the repository more credible:

- external stars from real users;
- forks or contributors;
- reproducible bug reports;
- closed issues;
- tagged releases;
- screenshots or demo GIFs;
- compatibility notes for more operating systems;
- small real contributions to adjacent OSS projects.

## What not to do

- Do not fake stars or users.
- Do not create shallow spam forks only to look active.
- Do not overclaim production adoption.
- Do not submit private business code or customer data.
- Do not present Codex support as funding for private work.
