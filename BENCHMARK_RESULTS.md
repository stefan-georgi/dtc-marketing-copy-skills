# RMBC Skills Package — Benchmark Results

> **Generated:** 2026-04-01
> **Eval Harness Version:** 1.0
> **Skills Evaluated:** 41
> **Mean Composite Score:** 97.7 / 100

## ⚠️ Scope Caveat

This benchmark measures **Generative Protocol Quality** — the quality of output when each skill's
instructions are given ideal pre-filled inputs via direct Claude API invocation.

**What this eval tests:**
- Quality of R/M/B/C dimensions in generated output
- Output type completeness (semantic gates)
- Consistency across dual-pass judge runs

**What this eval does NOT test:**
- Live session execution (bash preambles, workspace loading, analytics hooks)
- AskUserQuestion interaction flows (bypassed by pre-filling all inputs)
- Real-time external tool calls (ingredient-research web search substituted with fixture data)
- Session persistence across turns

Subprocess smoke tests (live `claude -p "/skill-name"` invocations) cover session execution separately.

---

## Calibration

| Threshold | Value | Meaning |
|-----------|-------|---------|
| AUTO_PASS | 92 | Score ≥ this with full judge agreement = no review needed |
| FLAG | 82 | Score ≥ this = spot-check recommended |
| < FLAG | 82 | Must review before publishing benchmark claims |

Thresholds calibrated empirically from benchmark skills:
{
  "hook-battery": 96.0,
  "email-promo": 100.0,
  "copy-rewrite": 95.0
}

---

## Summary

| Decision | Count | % |
|----------|-------|---|
| ✅ AUTO-PASS | 39 | 95% |
| 🔶 FLAG | 2 | 5% |
| ❓ UNCERTAIN | 0 | 0% |
| ❌ FAIL | 0 | 0% |
| **Total** | **41** | |

### Failures by Category

| Category | Count |
|----------|-------|
| invocation_error | 0 |
| gate_failure | 0 |
| low_score | 0 |
| judge_disagreement | 0 |

---

## Full Results

| Skill | Tier | Type | Fixture | Gates | Score | Decision | Failure | Note |
|-------|------|------|---------|-------|-------|----------|---------|------|
| advertorial-writer | T1 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| email-promo | T1 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| fb-ad-copy | T1 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| hook-battery | T1 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| lander-copy | T1 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| vsl-script | T1 | copy | berberine-supplement | 5/5 | 95 | ✅ AUTO-PASS | — |  |
| broadcast-email | T2 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| cart-abandonment-flow | T2 | copy | ecom-product | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| checkout-abandonment | T2 | audit | saas-tool | 4/4 | 100 | ✅ AUTO-PASS | — | ⚠️ changed |
| email-retention-sequences | T2 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| post-purchase-sequence | T2 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| reengagement-sequence | T2 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| soap-opera-sequence | T2 | copy | berberine-supplement | 5/5 | 95 | ✅ AUTO-PASS | — |  |
| upsell-sequence-writer | T2 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| welcome-sequence | T2 | copy | copywriting-course | 5/5 | 95 | ✅ AUTO-PASS | — |  |
| ab-test-plan | T3 | strategy | berberine-supplement | 4/4 | 100 | ✅ AUTO-PASS | — |  |
| ad-angle-generator | T3 | strategy | berberine-supplement | 4/4 | 100 | ✅ AUTO-PASS | — |  |
| bonus-stack | T3 | strategy | copywriting-course | 4/4 | 100 | ✅ AUTO-PASS | — |  |
| creative-brief | T3 | strategy | berberine-supplement | 4/4 | 100 | ✅ AUTO-PASS | — |  |
| free-offer-brief | T3 | strategy | copywriting-course | 4/4 | 100 | ✅ AUTO-PASS | — |  |
| funnel-architecture | T3 | strategy | saas-tool | 4/4 | 100 | ✅ AUTO-PASS | — |  |
| mechanism-ideation | T3 | strategy | berberine-supplement | 4/4 | 96 | ✅ AUTO-PASS | — |  |
| media-buying-brief | T3 | strategy | berberine-supplement | 4/4 | 95 | ✅ AUTO-PASS | — |  |
| offer-stack | T3 | strategy | berberine-supplement | 4/4 | 100 | ✅ AUTO-PASS | — |  |
| pricing-strategy | T3 | strategy | berberine-supplement | 4/4 | 100 | ✅ AUTO-PASS | — |  |
| scarcity-urgency | T3 | copy | berberine-supplement | 5/5 | 89 | 🔶 FLAG | — | Module-type skill: B/C=5, R/M lower by design (contextually dependent on upstream) |
| ad-creative-audit | T4 | audit | berberine-supplement | 4/4 | 96 | ✅ AUTO-PASS | — |  |
| competitor-offer-analysis | T4 | research | berberine-supplement | 3/4 | 96 | ✅ AUTO-PASS | — |  |
| copy-rewrite | T4 | copy | berberine-supplement | 4/5 | 95 | ✅ AUTO-PASS | — |  |
| funnel-audit | T4 | audit | saas-tool | 4/4 | 96 | ✅ AUTO-PASS | — |  |
| guarantee-writer | T4 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| ingredient-research | T4 | research | berberine-supplement | 4/4 | 96 | ✅ AUTO-PASS | — |  |
| lead-writer | T4 | copy | berberine-supplement | 5/5 | 96 | ✅ AUTO-PASS | — |  |
| order-form-cro | T4 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| pdp-ecomm-template | T4 | copy | ecom-product | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| rmbc-copy-audit | T4 | audit | berberine-supplement | 4/4 | 96 | ✅ AUTO-PASS | — |  |
| thank-you-page | T4 | copy | ecom-product | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| ugc-brief | T4 | strategy | ecom-product | 4/4 | 95 | ✅ AUTO-PASS | — |  |
| unified-research-synthesizer | T4 | research | berberine-supplement | 3/4 | 96 | ✅ AUTO-PASS | — |  |
| upsell-script | T4 | copy | berberine-supplement | 5/5 | 94 | ✅ AUTO-PASS | — |  |
| webinar-registration-copy | T4 | copy | copywriting-course | 5/5 | 84 | 🔶 FLAG | — | Fixture-sensitive: scores higher with supplement fixtures |

---

## Validation Methodology

1. **Pre-processor** strips bash preambles and injects `rmbc-context` as shared context
2. **Invoker** calls `claude-sonnet-4-6` with all required inputs pre-filled from product fixture
3. **Gate checker** runs output-type-aware semantic gates via `claude-haiku-4-5-20251001` (~$0.005/skill)
4. **Judge** scores R/M/B/C dimensions at temperature=0.3, dual-pass, 3rd-pass tiebreaker on divergence
5. **Calibration** sets AUTO_PASS/FLAG thresholds empirically from 3 A/B validated benchmark skills

**External tool substitutions (scope limitations):**
- `ingredient-research`: web search substituted with fixture-provided ingredient research data
- `competitor-offer-analysis`: live competitor lookup substituted with fixture competitor profiles
- All `multi-turn-interactive` skills: AskUserQuestion calls bypassed by pre-filling all inputs

**Change detection:** SKILL.md SHA256 hashes stored per-run. Modified skills flagged in results.

---

*This document is auto-generated by `eval-harness/harness/run_eval.py`. To update: re-run the eval suite and copy `eval-harness/results/2026-04-01/benchmark-summary.md` to repo root as `BENCHMARK_RESULTS.md`.*
