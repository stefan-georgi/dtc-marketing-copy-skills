---
name: funnel-audit
description: Audit existing sales funnels against RMBC and CRO best practices — score each step, identify conversion leaks, and output a prioritized fix matrix.
model: sonnet
user-invocable: true
---

# funnel-audit

## Purpose

Audit an existing DTC sales funnel against RMBC methodology and CRO best practices. Every funnel leaks revenue somewhere — the question is where and how much. This skill evaluates each step in the funnel (traffic → landing → order → upsell → thank you → email) with per-step scoring across five dimensions. Output: a funnel health score (0-100), identification of the top 3 conversion leaks, and a prioritized fix matrix ranked by revenue impact.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `funnel_description` | Yes | Detailed description of each funnel step — pages, copy approach, offers, flow |
| `funnel_type` | Yes | One of: `tripwire`, `webinar`, `vsl`, `quiz`, `free_plus_shipping`, `other` |
| `funnel_url` | No | Live URL to audit (if available — describe what you observe at each step) |
| `current_metrics` | No | Existing performance data: conversion rates per step, AOV, CPA, ROAS, traffic volume |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Funnel auditing applies RMBC as a diagnostic lens — Research quality determines whether copy speaks to the right audience, Mechanism consistency determines whether the "why" threads through every page, Brief alignment determines whether each page has a clear strategic job, Copy execution determines whether the words convert.

### Step 2 — Map the Funnel Steps

Identify every step in the funnel and classify it:

| Step | Type | Examples |
|------|------|----------|
| Traffic | Entry point | Ad, organic post, email, referral |
| Pre-sell | Warm-up | Advertorial, quiz, webinar |
| Landing | Core offer | Sales page, VSL page, product page |
| Order | Checkout | Order form, cart, payment page |
| Upsell | Post-purchase | OTO page, bump offer, cross-sell |
| Thank You | Confirmation | Order confirmation, next steps |
| Email | Follow-up | Welcome sequence, onboarding, ascension |

If a step is missing from the funnel, flag it as a structural gap.

### Step 3 — Score Each Step

Evaluate each funnel step across 5 dimensions. Score each dimension 0-20 points:

| Dimension | What It Measures | 0-5 | 6-10 | 11-15 | 16-20 |
|-----------|-----------------|-----|------|-------|-------|
| **Message Match** | Does the copy match what the prospect expects from the previous step? | No connection | Loose match | Good match | Seamless transition |
| **Friction Level** | How many obstacles stand between the prospect and the conversion goal? | High friction, confusing | Multiple friction points | Minor friction | Frictionless path |
| **Proof Density** | Is there sufficient, varied evidence to support the claims being made? | No proof | Single proof type | Multiple proof types | Stacked, specific proof |
| **CTA Clarity** | Is the desired action obvious, compelling, and easy to take? | No clear CTA | Vague or buried CTA | Clear CTA | Urgent, specific, visible CTA |
| **Mobile Experience** | Does the page work well on mobile (80-90% of DTC traffic)? | Broken on mobile | Functional but poor | Good mobile layout | Mobile-first design |

**Per-step score:** Sum of 5 dimensions (0-100 per step)
**Funnel health score:** Average across all steps (0-100)

### Step 4 — Identify Conversion Leaks

Rank all steps by their scores. The bottom 3 are the primary leaks. For each leak:

1. **The leak** — Which step and what's failing
2. **Revenue impact** — Estimate how much revenue this leak costs (if metrics provided, calculate; if not, estimate based on typical benchmarks)
3. **Root cause** — RMBC diagnosis: is it a Research failure (wrong audience assumptions), Mechanism failure (weak "why"), Brief failure (unclear page strategy), or Copy failure (poor execution)?
4. **Benchmark gap** — Compare the step's performance to industry benchmarks for this funnel type

### Step 5 — Build Fix Priority Matrix

Prioritize fixes by: (Revenue Impact × Ease of Fix). Score both 1-5:

- **Revenue Impact (1-5):** How much revenue will fixing this recover?
- **Ease of Fix (1-5):** How quickly can this be implemented? (5 = copy change, 1 = rebuild)
- **Priority Score:** Impact × Ease (highest score = fix first)

## Output Format

```
## Funnel Audit: [Funnel Name/Product]

**Funnel Type:** [type]
**Steps Audited:** [count]
**Funnel Health Score:** XX/100
**Grade:** [A (80+) | B (60-79) | C (40-59) | D (20-39) | F (0-19)]

---

### STEP-BY-STEP SCORES

| Step | Message Match | Friction | Proof | CTA | Mobile | Total |
|------|:---:|:---:|:---:|:---:|:---:|:---:|
| [Step 1] | /20 | /20 | /20 | /20 | /20 | /100 |
| [Step 2] | /20 | /20 | /20 | /20 | /20 | /100 |
| ... | ... | ... | ... | ... | ... | ... |

---

### TOP 3 CONVERSION LEAKS

#### Leak 1: [Step Name] — Score: XX/100
- **What's failing:** [description]
- **Revenue impact:** [estimated or calculated]
- **Root cause:** [RMBC diagnosis]
- **Benchmark gap:** [current vs expected]

#### Leak 2: [Step Name] — Score: XX/100
[same format]

#### Leak 3: [Step Name] — Score: XX/100
[same format]

---

### FIX PRIORITY MATRIX

| Rank | Fix | Step | Impact (1-5) | Ease (1-5) | Priority | Estimated Lift |
|:---:|------|------|:---:|:---:|:---:|------|
| 1 | [fix description] | [step] | X | X | XX | +X% conversion |
| 2 | [fix description] | [step] | X | X | XX | +X% conversion |
| 3 | [fix description] | [step] | X | X | XX | +X% conversion |
| ... | ... | ... | ... | ... | ... | ... |

---

### STRUCTURAL GAPS

[List any missing funnel steps that should exist but don't]

---

### SUMMARY

- **Biggest win:** [single highest-impact fix]
- **Quick wins:** [fixes with Ease score of 4-5]
- **Requires rebuild:** [fixes with Ease score of 1-2]
```

## Quality Criteria

- Every funnel step must be scored — no skipping steps because they "seem fine"
- Scores must be justified with specific observations, not just numbers
- Revenue impact estimates must show reasoning (conversion rate × traffic × AOV)
- Fix priority matrix must rank by Impact × Ease — not by gut feeling
- Structural gaps must be flagged even if the user didn't mention them
- Mobile experience must be evaluated for every step — it's not optional for DTC
- RMBC root cause diagnosis must map to a specific phase failure, not generic "copy is weak"

- **Specificity gate:** Every finding must include a number, name, or timeframe — no "needs work" or "could improve"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Each finding must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode

## Related Skills

- Run `/funnel-architecture` to design the ideal funnel this audit compares against
- Run `/lander-copy` to rewrite a low-scoring landing page
- Run `/order-form-cro` to fix checkout conversion leaks
- Run `/upsell-script` to improve upsell page scores
- Run `/thank-you-page` to optimize the confirmation step
- Validate individual pages with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
