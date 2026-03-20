---
name: competitor-offer-analysis
description: Analyze competitor offers to find positioning gaps — break down pricing, guarantees, bonuses, mechanism claims, proof elements, and weaknesses to generate differentiation recommendations.
model: sonnet
user-invocable: true
---

# competitor-offer-analysis

## Purpose

Analyze competitor offers to find positioning gaps and differentiation opportunities. This is the competitive intelligence arm of RMBC Research — Step 2 (Competitor Analysis) from the 4-step research framework. Most brands compete on surface features and price. RMBC-driven analysis goes deeper: what mechanism does each competitor claim, how do they prove it, where is their offer architecture weak, and what does no one in the market say that your prospect needs to hear? Output: per-competitor offer breakdown, competitive landscape summary, gap opportunities, and positioning recommendations for differentiation.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | Your product — what it does, key features, price point, mechanism (if defined) |
| `competitors` | Yes | List of competitor names and/or URLs (minimum 2, ideally 3-5) |
| `target_audience` | Yes | Shared ICP — demographics, pain points, desires, awareness level |
| `your_key_differentiator` | Yes | What you believe makes your offer unique (will be pressure-tested) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Competitor analysis maps directly to RMBC Research Step 2 — studying competing offers, their mechanisms, proof claims, and positioning gaps. The goal is not just to know what competitors do, but to find what they fail to do, fail to say, and fail to prove.

### Step 2 — Build Competitor Profiles

For each competitor, analyze across 7 dimensions:

| # | Dimension | Key Questions |
|---|-----------|--------------|
| 1 | **Offer Architecture** | Core product, price point, offer stack (core + bonuses + add-ons), delivery method |
| 2 | **Mechanism Claims** | Primary mechanism, specificity (vague vs concrete), "only we" test, RMBC novelty score (0-25) |
| 3 | **Proof Elements** | Proof types (clinical, testimonial, expert, media, demo, data), quality, gaps, RMBC believability score (0-25) |
| 4 | **Guarantee** | Terms (duration, conditions), strength (unconditional vs conditional), positioning (prominent vs buried) |
| 5 | **Bonuses** | What's included, relevance to core offer, filler quality assessment |
| 6 | **Copy & Positioning** | Lead type, tone, awareness level targeting, CTA approach |
| 7 | **Weaknesses** | Offer gaps, proof gaps, mechanism gaps, experience gaps (onboarding, support, results) |

### Step 3 — Map the Competitive Landscape

Synthesize individual profiles into a landscape view:

| Dimension | Competitor A | Competitor B | Competitor C | Your Offer |
|-----------|-------------|-------------|-------------|-----------|
| Price | | | | |
| Mechanism | | | | |
| Proof depth | | | | |
| Guarantee | | | | |
| Bonuses | | | | |
| CTA/Urgency | | | | |

Identify patterns:
- **Market consensus:** What does every competitor do the same way?
- **Market gaps:** What does NO competitor address?
- **Overused claims:** What messages are so common they've lost impact?
- **Underserved objections:** What prospect concerns does no one address?

### Step 4 — Identify Gap Opportunities

Rank the top 3-5 positioning gaps by impact:

For each gap:
1. **The gap** — What's missing from the competitive landscape
2. **Why it matters** — How this gap affects the prospect's buying decision
3. **Your ability to fill it** — Can your product/offer genuinely own this position?
4. **Implementation** — What changes to your offer, copy, or proof would claim this gap
5. **Risk** — What happens if a competitor fills this gap first

### Step 5 — Pressure-Test Your Differentiator

Take the user's stated key differentiator and stress-test it:

- **Is it unique?** Can any competitor make the same claim?
- **Is it provable?** Do you have evidence that supports it?
- **Does the audience care?** Is this differentiator relevant to a buying decision?
- **Is it defensible?** Can competitors easily copy or neutralize it?
- **Is it communicable?** Can it be explained in one sentence on a sales page?

If the differentiator fails any test, recommend a stronger positioning angle based on the gap analysis.

## Output Format

```
## Competitor Offer Analysis: [Your Product/Market]

**Competitors Analyzed:** [count]
**Your Differentiator (stated):** [from input]
**Differentiator Status:** VALIDATED / NEEDS STRENGTHENING / REPLACE

---

### COMPETITOR PROFILES

#### [Competitor 1 Name]

| Dimension | Assessment |
|-----------|-----------|
| **Offer** | [core product, price, stack] |
| **Mechanism** | [claim + specificity + uniqueness] |
| **Proof** | [types used + quality + gaps] |
| **Guarantee** | [terms + strength] |
| **Bonuses** | [list + relevance] |
| **Copy approach** | [lead type + tone + awareness level] |
| **Weaknesses** | [offer, proof, mechanism, experience gaps] |

**RMBC Scores:** Mechanism: X/25 | Proof: X/25

---

[...repeat for each competitor...]

---

### COMPETITIVE LANDSCAPE

| Dimension | [Comp A] | [Comp B] | [Comp C] | You |
|-----------|----------|----------|----------|-----|
| Price | | | | |
| Mechanism | | | | |
| Proof | | | | |
| Guarantee | | | | |
| Urgency | | | | |

---

### GAP OPPORTUNITIES (Ranked by Impact)

#### Gap 1: [Name]
- **What's missing:** [description]
- **Why it matters:** [prospect impact]
- **Your ability to fill:** [high/medium/low + why]
- **Implementation:** [what to change]

#### Gap 2: [Name]
[same format]

#### Gap 3: [Name]
[same format]

---

### DIFFERENTIATOR STRESS TEST

| Test | Pass/Fail | Notes |
|------|-----------|-------|
| Unique? | | |
| Provable? | | |
| Audience cares? | | |
| Defensible? | | |
| Communicable? | | |

**Recommendation:** [validate, strengthen, or replace — with specific alternative if needed]

---

### POSITIONING RECOMMENDATIONS

1. **Lead with:** [the strongest gap opportunity your offer can own]
2. **Prove with:** [the proof type competitors underuse]
3. **Differentiate on:** [validated or recommended differentiator]
4. **Avoid:** [overused market claims that have lost impact]
```

## Quality Criteria

- Each competitor must be analyzed across all 7 dimensions — no skipping because information is limited (flag what's unknown instead)
- Mechanism claims must be evaluated for the "only we" test — generic mechanisms that any competitor could claim don't count as differentiation
- Proof evaluation must distinguish between strong (specific, verifiable) and weak (vague, unsubstantiated) evidence
- Gap opportunities must be ranked by impact on buying decisions — not just what's interesting to the analyst
- Differentiator stress test must be honest — a failing differentiator helps more than a validated weak one
- Positioning recommendations must be actionable and specific — "be different" is not a recommendation
- RMBC scores must follow rmbc-context quality dimensions (0-25 per dimension) consistently across competitors

- **Specificity gate:** Every finding must include a number, name, or timeframe — no "they perform well" or "strong results"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Each finding must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode

## Related Skills

- Run `/unified-research-synthesizer` to complete the full 4-step RMBC research framework
- Run `/mechanism-ideation` to develop a mechanism that fills identified gaps
- Run `/ad-angle-generator` to create angles that exploit competitor weaknesses
- Run `/pricing-strategy` to position pricing against the competitive landscape
- Run `/offer-stack` to build an offer that addresses gaps competitors miss
- Validate your differentiated positioning with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
