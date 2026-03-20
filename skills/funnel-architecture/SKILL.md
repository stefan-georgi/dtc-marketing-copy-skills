---
name: funnel-architecture
description: Design complete DTC sales funnel architecture — maps the full customer journey from ad to email follow-up with RMBC-aligned copy approach, conversion goals, and KPI targets per step.
model: sonnet
user-invocable: true
---

# funnel-architecture

## Purpose

Design a complete DTC sales funnel from first click to post-purchase follow-up. Every funnel is a series of micro-conversions — ad click → landing page → order form → upsell 1 → upsell 2 → thank you → email sequence. Each step has a single job, a copy approach calibrated to the prospect's awareness level at that point, and a measurable KPI. This skill outputs the full blueprint: page purposes, copy strategies, conversion goals, and target metrics — ready for copywriters and designers to execute step by step.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_line` | Yes | Product name, category, core promise, and price range |
| `price_points` | Yes | Array of prices across the funnel: front-end, upsell 1, upsell 2, bump, subscription tier |
| `target_audience` | Yes | ICP — demographics, pain points, desires, sophistication level |
| `funnel_type` | Yes | One of: `tripwire`, `webinar`, `vsl`, `quiz`, `free_plus_shipping` |
| `traffic_sources` | Yes | Primary traffic channels: `paid_social`, `native`, `search`, `email`, `organic` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Funnel architecture applies RMBC at the macro level — Research determines awareness stages across funnel steps, Mechanism threads through every page as the consistent "why," Brief structures each page's strategic intent, Copy executes per-page with escalating commitment.

### Step 2 — Select Funnel Template

Map the funnel type to its canonical step sequence:

| Type | Steps |
|------|-------|
| **Tripwire** | Ad → Advertorial/Presell → Landing Page → Order Form (w/ bump) → Upsell 1 → Upsell 2 → Thank You → Email Sequence |
| **Webinar** | Ad → Registration Page → Confirmation Page → Webinar → Replay Page → Order Form → Upsell → Thank You → Email Sequence |
| **VSL** | Ad → VSL Page (video + hidden CTA) → Order Form (w/ bump) → Upsell 1 → Upsell 2 → Thank You → Email Sequence |
| **Quiz** | Ad → Quiz Landing → Quiz Steps (3-5) → Results Page → Recommended Offer → Order Form → Upsell → Thank You → Email Sequence |
| **Free+Shipping** | Ad → Landing Page → Order Form (shipping only) → Upsell 1 (core offer) → Upsell 2 → Thank You → Email Sequence |

### Step 3 — Define Each Funnel Step

For every step in the sequence, specify:

1. **Page purpose** — The single job this page must accomplish
2. **Awareness level** — Where the prospect sits at this point (unaware → most aware)
3. **Copy approach** — RMBC-aligned strategy (which phase dominates this step)
4. **Conversion goal** — The specific action that counts as success
5. **KPI target** — Benchmark conversion rate for this step
6. **Key elements** — Must-have page components (headline, video, form fields, trust badges, etc.)
7. **Transition hook** — What moves them to the next step (curiosity, commitment, urgency)

### Step 4 — Map Revenue Projections

Calculate funnel economics:
- **Front-end AOV** — Base price + bump offer take rate
- **Upsell stack value** — Upsell 1 take rate × price + Upsell 2 take rate × price
- **Blended AOV** — Total revenue per buyer across all steps
- **Break-even CPA** — Blended AOV × margin = maximum allowable CPA
- **Target ROAS** — By traffic source

### Step 5 — Traffic Source Alignment

Adjust the funnel entry point and messaging for each traffic source:
- **Paid Social** — Hook-heavy ad, shorter presell, visual landing page
- **Native** — Advertorial entry, editorial tone, longer education
- **Search** — Intent-matched landing page, features prominent, comparison-ready
- **Email** — Skip presell, direct to offer with personalization
- **Organic** — Content-first entry, SEO-optimized landing page, trust building

## Output Format

```
## Funnel Architecture: [Product Line]

**Funnel Type:** [type]
**Target Audience:** [ICP summary]
**Traffic Sources:** [sources]
**Price Points:** Front-end $XX | Bump $XX | Upsell 1 $XX | Upsell 2 $XX

---

### STEP 1: [Step Name]

- **Page purpose:** [single job]
- **Awareness level:** [unaware → most aware]
- **Copy approach:** [RMBC phase emphasis + strategy]
- **Conversion goal:** [specific action]
- **KPI target:** [benchmark %]
- **Key elements:** [must-haves]
- **Transition hook:** [what moves them forward]

---

[...repeat for each step...]

---

### REVENUE MODEL

| Metric | Target |
|--------|--------|
| Front-end conversion rate | X% |
| Bump take rate | X% |
| Upsell 1 take rate | X% |
| Upsell 2 take rate | X% |
| Front-end AOV | $XX |
| Blended AOV | $XX |
| Break-even CPA | $XX |
| Target ROAS | X.Xx |

---

### FUNNEL FLOW DIAGRAM

[Step 1] → [Step 2] → [Step 3] → ... → [Final Step]
  X%          X%          X%                 X%
```

## Quality Criteria

- Every step must have exactly ONE conversion goal — no split objectives
- Awareness level must escalate logically through the funnel (never regress)
- KPI targets must be realistic benchmarks for the funnel type and traffic source
- Upsell products must logically complement the front-end offer — no random add-ons
- Revenue model must show a viable break-even CPA for at least one traffic source
- Email sequence must have a defined purpose (onboarding, consumption, ascension) — not just "follow up"
- Funnel must work on mobile — no steps that require desktop-only interactions

- **Specificity gate:** Every recommendation must include a number, name, or timeframe — no "optimize for conversions" or "improve flow"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The architecture must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** Each funnel step must map which objections are resolved at that stage — if a prospect reaches checkout with unaddressed objections, the funnel leaks

## Related Skills

- Run `/lander-copy` to write landing page copy for any funnel step
- Run `/order-form-cro` to optimize checkout page copy and layout
- Run `/upsell-script` for upsell page scripts
- Run `/thank-you-page` for order confirmation and post-purchase upsell copy
- Run `/funnel-audit` to score an existing funnel against this architecture
- Run `/email-retention-sequences` for post-purchase email flows

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
