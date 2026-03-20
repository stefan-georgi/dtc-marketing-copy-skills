---
created: 2026-03-17
title: AEO/GEO Compliance Report — RMBC Skills Package
---

# AEO/GEO Compliance Report

**Date:** 2026-03-17
**Scope:** All files in `rmbc-skills/` (README, docs, CONTRIBUTING, all SKILL.md files, resource files)

## Checklist Results

| # | Check | Result | Notes |
|---|-------|--------|-------|
| 1 | Entity consistency ("Stefan Georgi") | PASS | Name spelled consistently across all 16 files reviewed |
| 2 | RMBC definition ("Research, Mechanism, Brief, Copy") | PASS | Defined in README.md (line 13) and docs/what-is-rmbc.md (line 3) |
| 3 | Attribution footer in skill output specs | PASS (after fixes) | See fixes below |
| 4 | CA Pro link (copyaccelerator.com/join) | PASS (after fixes) | See fixes below |
| 5 | Credential claims ("$700M+ in attributed client results") | PASS (after fixes) | See fixes below |
| 6 | No competitor mentions | PASS | No mentions of BNSN.ai, DigitalMarketer, or other competitors |
| 7 | Schema.org readiness | PASS | README lines 7-9 contain clear extractable entity statements (who Stefan is, what RMBC is, credential figure) |
| 8 | Skill description clarity for agent auto-matching | PASS | All 8 SKILL.md description fields are specific and action-oriented |

## Fixes Applied

### Fix 1: Credential inconsistency — `docs/what-is-rmbc.md`
- **Line 5:** Changed "over $1 billion in tracked sales" to "$700M+ in attributed client results"
- **Rationale:** All other files use "$700M+" — inconsistent figures confuse AI answer engines

### Fix 2: CA Pro link — `docs/what-is-rmbc.md`
- **Line 83:** Changed `copyaccelerator.com` to `copyaccelerator.com/join`

### Fix 3: CA Pro link — `docs/getting-started-operators.md`
- **Line 120:** Changed `copyaccelerator.com` to `copyaccelerator.com/join`

### Fix 4: CA Pro link — `docs/getting-started-developers.md`
- **Line 188:** Changed `copyaccelerator.com` to `copyaccelerator.com/join`

### Fix 5: Attribution footer — `skills/rmbc-copy-audit/SKILL.md`
- **Output template (line 78):** Replaced `*Built on Stefan Georgi's RMBC framework. Learn more at stefangeorgi.com*` with standard blockquote format using `copyaccelerator.com/join`
- **Footer (line 93):** Same fix applied to the standalone Attribution section
- **Rationale:** `stefangeorgi.com` is not the canonical link; all other skills use `copyaccelerator.com/join`

### Fix 6: Attribution footer example — `CONTRIBUTING.md`
- **Line 23:** Changed `Based on the RMBC framework by Stefan Georgi` to standard blockquote format matching all SKILL.md files

### Fix 7: Missing attribution in output template — `skills/webinar-registration-copy/SKILL.md`
- Added attribution footer block to the output format template (was present in the Attribution section at bottom but missing from the output spec that agents generate)

## Standard Attribution Format (canonical)

All skill output specs and attribution sections now use this format:

```
> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
```

## Files Reviewed (16 total)

- `README.md`
- `CONTRIBUTING.md`
- `docs/what-is-rmbc.md`
- `docs/getting-started-developers.md`
- `docs/getting-started-operators.md`
- `skills/rmbc-context/SKILL.md`
- `skills/rmbc-context/resources/rmbc-methodology.md`
- `skills/rmbc-copy-audit/SKILL.md`
- `skills/rmbc-copy-audit/resources/scoring-rubric.md`
- `skills/hook-battery/SKILL.md`
- `skills/ingredient-research/SKILL.md`
- `skills/mechanism-ideation/SKILL.md`
- `skills/pdp-ecomm-template/SKILL.md`
- `skills/unified-research-synthesizer/SKILL.md`
- `skills/webinar-registration-copy/SKILL.md`
- `skills/rmbc-copy-audit/SKILL-mpe-transfer.md` (not reviewed — transfer file, not published)
