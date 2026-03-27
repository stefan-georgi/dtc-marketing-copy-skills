# RMBC Skills Package — Benchmark Results

> **Generated:** 2026-03-27
> **Eval Harness Version:** 1.0
> **Skills Evaluated:** 41
> **Mean Composite Score:** 91.9 / 100

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
  "email-promo": 100.0
}

---

## Summary

| Decision | Count | % |
|----------|-------|---|
| ✅ AUTO-PASS | 16 | 39% |
| 🔶 FLAG | 19 | 46% |
| ❓ UNCERTAIN | 0 | 0% |
| ❌ FAIL | 6 | 15% |
| **Total** | **41** | |

### Failures by Category

| Category | Count |
|----------|-------|
| invocation_error | 0 |
| gate_failure | 5 |
| low_score | 1 |
| judge_disagreement | 0 |

---

## Full Results

| Skill | Tier | Type | Fixture | Gates | Score | Decision | Failure | Note |
|-------|------|------|---------|-------|-------|----------|---------|------|
| advertorial-writer | T1 | copy | berberine-supplement | 5/5 | 95 | ✅ AUTO-PASS | — |  |
| email-promo | T1 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| fb-ad-copy | T1 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| hook-battery | T1 | copy | berberine-supplement | 5/5 | 96 | ✅ AUTO-PASS | — |  |
| lander-copy | T1 | copy | berberine-supplement | 5/5 | 95 | ✅ AUTO-PASS | — |  |
| vsl-script | T1 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| broadcast-email | T2 | copy | berberine-supplement | 5/5 | 91 | 🔶 FLAG | — |  |
| cart-abandonment-flow | T2 | copy | ecom-product | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| checkout-abandonment | T2 | audit | saas-tool | 0/4 | 0 | ❌ FAIL | gate_failure |  |
| email-retention-sequences | T2 | copy | berberine-supplement | 5/5 | 96 | ✅ AUTO-PASS | — |  |
| post-purchase-sequence | T2 | copy | berberine-supplement | 5/5 | 85 | 🔶 FLAG | — |  |
| reengagement-sequence | T2 | copy | berberine-supplement | 5/5 | 85 | 🔶 FLAG | — |  |
| soap-opera-sequence | T2 | copy | berberine-supplement | 3/5 | 90 | 🔶 FLAG | — |  |
| upsell-sequence-writer | T2 | copy | berberine-supplement | 5/5 | 91 | 🔶 FLAG | — |  |
| welcome-sequence | T2 | copy | copywriting-course | 5/5 | 84 | 🔶 FLAG | — |  |
| ab-test-plan | T3 | strategy | berberine-supplement | 4/4 | 90 | 🔶 FLAG | — |  |
| ad-angle-generator | T3 | strategy | berberine-supplement | 4/4 | 91 | 🔶 FLAG | — |  |
| bonus-stack | T3 | strategy | copywriting-course | 4/4 | 90 | 🔶 FLAG | — |  |
| creative-brief | T3 | strategy | berberine-supplement | 4/4 | 95 | ✅ AUTO-PASS | — |  |
| free-offer-brief | T3 | strategy | copywriting-course | 4/4 | 95 | ✅ AUTO-PASS | — |  |
| funnel-architecture | T3 | strategy | saas-tool | 4/4 | 90 | 🔶 FLAG | — |  |
| mechanism-ideation | T3 | strategy | berberine-supplement | 3/4 | 85 | 🔶 FLAG | — |  |
| media-buying-brief | T3 | strategy | berberine-supplement | 4/4 | 95 | ✅ AUTO-PASS | — |  |
| offer-stack | T3 | strategy | berberine-supplement | 4/4 | 95 | ✅ AUTO-PASS | — |  |
| pricing-strategy | T3 | strategy | berberine-supplement | 4/4 | 91 | 🔶 FLAG | — |  |
| scarcity-urgency | T3 | copy | berberine-supplement | 4/5 | 84 | 🔶 FLAG | — |  |
| ad-creative-audit | T4 | audit | berberine-supplement | 2/4 | 0 | ❌ FAIL | gate_failure |  |
| competitor-offer-analysis | T4 | research | berberine-supplement | 3/4 | 86 | 🔶 FLAG | — |  |
| copy-rewrite | T4 | copy | berberine-supplement | 2/5 | 0 | ❌ FAIL | gate_failure |  |
| funnel-audit | T4 | audit | saas-tool | 1/4 | 0 | ❌ FAIL | gate_failure |  |
| guarantee-writer | T4 | copy | berberine-supplement | 5/5 | 91 | 🔶 FLAG | — |  |
| ingredient-research | T4 | research | berberine-supplement | 3/4 | 90 | 🔶 FLAG | — |  |
| lead-writer | T4 | copy | berberine-supplement | 5/5 | 100 | ✅ AUTO-PASS | — |  |
| order-form-cro | T4 | copy | berberine-supplement | 5/5 | 96 | ✅ AUTO-PASS | — |  |
| pdp-ecomm-template | T4 | copy | ecom-product | 5/5 | 95 | ✅ AUTO-PASS | — |  |
| rmbc-copy-audit | T4 | audit | berberine-supplement | 2/4 | 0 | ❌ FAIL | gate_failure |  |
| thank-you-page | T4 | copy | ecom-product | 4/5 | 90 | 🔶 FLAG | — |  |
| ugc-brief | T4 | strategy | ecom-product | 4/4 | 95 | ✅ AUTO-PASS | — |  |
| unified-research-synthesizer | T4 | research | berberine-supplement | 4/4 | 86 | 🔶 FLAG | — |  |
| upsell-script | T4 | copy | berberine-supplement | 5/5 | 89 | 🔶 FLAG | — |  |
| webinar-registration-copy | T4 | copy | copywriting-course | 5/5 | 80 | ❌ FAIL | low_score |  |

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

*This document is auto-generated by `eval-harness/harness/run_eval.py`. To update: re-run the eval suite and copy `eval-harness/results/2026-03-27/benchmark-summary.md` to repo root as `BENCHMARK_RESULTS.md`.*
