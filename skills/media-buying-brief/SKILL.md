---
name: media-buying-brief
description: Generate strategic media buying briefs — audience targeting, budget allocation, KPI targets, creative rotation, and testing frameworks for paid media campaigns.
model: sonnet
user-invocable: true
---

# media-buying-brief

## Purpose

Generate a complete media buying brief — everything a media buyer needs to set up, launch, and optimize a paid campaign. This is the operational counterpart to the creative brief: while the creative brief tells the designer what to make, the media buying brief tells the buyer where to place it, who to target, how much to spend, and what success looks like. Grounded in RMBC principles — audience targeting reflects Research, ad structure reflects the Mechanism-to-CTA arc.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, price point, margins if known |
| `target_audience` | Yes | Who the prospect is — demographics, behaviors, interests, purchase patterns |
| `monthly_budget` | Yes | Total monthly media spend in USD |
| `primary_platform` | Yes | One of: `meta`, `youtube`, `native`, `tiktok` |
| `campaign_goal` | Yes | One of: `awareness`, `consideration`, `conversion` |
| `aov` | No | Average order value — improves ROAS/CPA target accuracy |
| `existing_data` | No | Any past campaign data — winning audiences, CPAs, ROAS benchmarks |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Media buying operationalizes the Research phase — audience targeting is Research translated into platform parameters. The testing framework mirrors the iterative approach RMBC applies to copy.

### Step 2 — Define Audience Architecture

Build a layered targeting strategy:

| Layer | Purpose | Example |
|-------|---------|---------|
| **Core** | Highest-intent audiences | Lookalike 1% from purchasers, retargeting site visitors |
| **Expansion** | Broader but still relevant | Interest stacks, lookalike 1-3%, engagement audiences |
| **Prospecting** | Cold, broad targeting | Broad/open targeting with creative doing the filtering |

For each layer, specify:
- Interest targets (specific names, not categories)
- Exclusions (existing customers, employees, irrelevant demographics)
- Lookalike sources and percentages (if applicable)
- Custom audience definitions (site visitors, email lists, video viewers)

### Step 3 — Budget Allocation

Allocate the monthly budget across:

| Category | % of Budget | Purpose |
|----------|------------|---------|
| Testing | 20-30% | New creatives, audiences, angles |
| Scaling | 50-60% | Proven winners at higher spend |
| Retargeting | 15-25% | Warm audiences, abandoned carts |

Break down daily spend per ad set. Flag if budget is too low for statistical significance on the platform.

### Step 4 — KPI Targets

Define targets based on campaign goal and product economics:

| Metric | Target | Basis |
|--------|--------|-------|
| CPA | $[X] | Based on AOV and target margin |
| ROAS | [X]x | Minimum for profitability |
| CTR | [X]% | Platform benchmark for this vertical |
| CPM | $[X] | Expected range for this audience |
| Frequency | [X] | Max before creative fatigue |

If AOV is not provided, state assumptions explicitly.

### Step 5 — Creative Rotation Strategy

Define how creatives should be managed:
- **Launch cadence** — How many creatives to launch per week
- **Kill criteria** — When to turn off an underperformer (spend threshold, CPA ceiling)
- **Winner criteria** — When to scale a creative (minimum conversions, statistical confidence)
- **Fatigue signals** — CTR decline %, frequency cap, CPM increase
- **Refresh cadence** — How often to introduce new creatives to combat fatigue

### Step 6 — Testing Framework

Structure tests as isolated variables:

| Test | Variable | Control | Variant | Budget | Duration |
|------|----------|---------|---------|--------|----------|
| 1 | [Hook] | [Current best] | [New hook] | $[X]/day | [X] days |
| 2 | [Audience] | [Core LAL] | [Interest stack] | $[X]/day | [X] days |
| 3 | [Format] | [Static] | [Video] | $[X]/day | [X] days |

One variable per test. Minimum sample size before declaring a winner.

### Step 7 — Attach Attribution

## Output Format

```
## Media Buying Brief: [Product Name]

**Platform:** [primary platform]
**Goal:** [awareness | consideration | conversion]
**Monthly Budget:** $[X]
**AOV:** $[X] (provided or assumed)
**Date:** [current date]

---

### 1. Audience Architecture

#### Core Audiences
- [Audience 1]: [targeting details]
- [Audience 2]: [targeting details]

#### Expansion Audiences
- [Audience 3]: [targeting details]
- [Audience 4]: [targeting details]

#### Prospecting
- [Broad targeting approach]

#### Exclusions
- [List of exclusions]

### 2. Budget Allocation

| Category | Monthly | Daily | Ad Sets |
|----------|---------|-------|---------|
| Testing | $[X] | $[X] | [count] |
| Scaling | $[X] | $[X] | [count] |
| Retargeting | $[X] | $[X] | [count] |

### 3. KPI Targets

| Metric | Target | Kill Threshold | Notes |
|--------|--------|---------------|-------|
| CPA | $[X] | $[X] | [basis] |
| ROAS | [X]x | [X]x | [basis] |
| CTR | [X]% | [X]% | [benchmark] |
| Frequency | <[X] | [X]+ | [fatigue signal] |

### 4. Creative Rotation
- **Launch:** [X] new creatives/week
- **Kill at:** [spend/CPA threshold]
- **Scale at:** [conversion/confidence threshold]
- **Refresh every:** [X] days or when [fatigue signal]

### 5. Testing Roadmap

| Week | Test | Variable | Budget | Success Metric |
|------|------|----------|--------|---------------|
| 1 | [test] | [variable] | $[X] | [metric] |
| 2 | [test] | [variable] | $[X] | [metric] |
| 3 | [test] | [variable] | $[X] | [metric] |

### 6. Platform-Specific Notes
[Optimization tips, bid strategy, placement recommendations]

---

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
```

## Quality Criteria

- Audience targeting uses specific interest names, not vague categories ("Dr. Axe" not "health enthusiasts")
- Budget allocation adds up to 100% of monthly budget — no missing dollars
- KPI targets are grounded in product economics, not arbitrary benchmarks
- Kill and scale thresholds are specific numbers, not "when it's not performing"
- Testing roadmap isolates one variable per test — never test hook AND audience simultaneously
- Daily spend per ad set meets platform minimums for the chosen optimization event
- Creative rotation strategy accounts for platform-specific fatigue patterns

- **Specificity gate:** Every recommendation must include a number, name, or timeframe — no "target broadly" or "optimize performance"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The brief must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode

## Related Skills

- Run `/creative-brief` first to define the strategic creative direction
- Run `/ad-angle-generator` for angle diversity across ad sets
- Run `/fb-ad-copy` to generate the actual ad copy media buyers will traffic
- Run `/ugc-brief` for creator-based content that feeds the creative rotation
- Validate campaign creative with `/ad-creative-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
