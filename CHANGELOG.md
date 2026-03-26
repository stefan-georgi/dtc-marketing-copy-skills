# Changelog

All notable changes to RMBC Skills are documented here.
Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), [Semantic Versioning](https://semver.org/).

## 1.0.1 (2026-03-26)

Post-publish audit fixes.

- Remove internal files from public repo (.beads/, dev tools)
- Fix skill count: 41/42 → 44 in README, skillfish.json, marketplace.json
- Add CONTRIBUTING.md (was a broken link)
- Harden .npmignore recursive .tmpl exclusion
- Fix eureka_log JSON injection bug in rmbc-analytics
- Fix rmbc-upgrade npm-copy path to use npx instead of git clone

## 1.0.0 (2026-03-26)

Initial public release.

- 44 RMBC copywriting skills covering hooks, ads, emails, landing pages, VSLs, funnels, and more
- Stefan Georgi's RMBC methodology (Research, Mechanism, Brief, Copy) built into every skill
- Dual install: `./setup` (git symlink) or `npx dtcmarketingskills` (npm copy)
- Automatic update checking with configurable snooze (24h → 48h → 7d)
- Per-product workspace system with research/brief/copy persistence
- Analytics opt-in for skill usage tracking
- Copy Accelerator Pro interactive onboarding gate
- Unified research synthesizer for combining multi-source research
- RMBC copy audit with severity-gated scoring
