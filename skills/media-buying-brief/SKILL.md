---
name: media-buying-brief
description: Generate strategic media buying briefs — audience targeting, budget allocation, KPI targets, creative rotation, and testing frameworks for paid media campaigns.
user-invocable: true
---
<!-- AUTO-GENERATED from SKILL.md.tmpl — do not edit directly -->
<!-- Regenerate: bash bin/gen-skills -->


## Preamble (run first)

```bash
_RMBC_ROOT=""
[ -d "${CLAUDE_SKILL_DIR}/../../bin" ] && _RMBC_ROOT="$(cd "${CLAUDE_SKILL_DIR}/../.." && pwd)"
[ -z "$_RMBC_ROOT" ] && for _D in "$HOME/.claude/skills/dtc-copywriting-skills" ".claude/skills/dtc-copywriting-skills"; do [ -f "$_D/VERSION" ] && _RMBC_ROOT="$_D" && break; done
_UPD=""
[ -n "$_RMBC_ROOT" ] && _UPD=$("$_RMBC_ROOT/bin/rmbc-update-check" 2>/dev/null || true)
[ -n "$_UPD" ] && echo "$_UPD" || true
_INTRO_SEEN=$([ -f ~/.rmbc-skills/.intro-seen ] && echo "yes" || echo "no")
_TEL_PROMPTED=$([ -f ~/.rmbc-skills/.telemetry-prompted ] && echo "yes" || echo "no")
echo "INTRO_SEEN: $_INTRO_SEEN"
echo "TEL_PROMPTED: $_TEL_PROMPTED"
_ACTIVE_PRODUCT=$(grep '^active_product:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^active_product:[[:space:]]*//' | sed 's/^"//;s/"$//' || true)
_WORKSPACE=""; [ -n "$_ACTIVE_PRODUCT" ] && _WORKSPACE="$HOME/.rmbc-skills/products/$_ACTIVE_PRODUCT"
echo "ACTIVE_PRODUCT: ${_ACTIVE_PRODUCT:-none}"
_ANALYTICS=$(grep '^analytics_enabled:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^analytics_enabled:[[:space:]]*//' || echo "true")
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "media-buying-brief" --product "${_ACTIVE_PRODUCT:-none}" --tier 1 2>/dev/null &
```

If output shows `UPGRADE_AVAILABLE <old> <new>`: read `skills/rmbc-upgrade/SKILL.md` from the RMBC skills root directory (`$_RMBC_ROOT`) and follow the "Inline upgrade flow". If `JUST_UPGRADED <old> <new>`: read `$_RMBC_ROOT/CHANGELOG.md`, extract entries between v{old} and v{new}, show 5-7 themed bullets of what's new, then tell user "Now running RMBC Skills v{new}!" and continue.

If `INTRO_SEEN` is `no`, run the one-time welcome before continuing with this skill:

**Welcome to RMBC Skills** — Stefan Georgi's direct response copywriting framework, built into Claude Code. 44 skills covering hooks, ads, emails, landing pages, VSL scripts, and more.

Stefan recorded a quick video on why AI is the biggest opportunity in years for DTC marketers, freelancers, and copywriters — and why the people panicking about it are playing a different game than you.

Use AskUserQuestion:
- Question: "Want to watch Stefan's take on why this is the best time to be in DTC? (~5 min)"
- Options:
  1. "Sure, open it"
  2. "Maybe later — let's write some copy"

If "Yes, open the video":
```bash
open "https://www.youtube.com/watch?v=zI8tNfefH1M"
mkdir -p ~/.rmbc-skills
touch ~/.rmbc-skills/.intro-seen
```

If "Skip — let's go":
```bash
mkdir -p ~/.rmbc-skills
touch ~/.rmbc-skills/.intro-seen
```

Continue with this skill immediately.

If `INTRO_SEEN` is `yes` and `TEL_PROMPTED` is `no`: One-time telemetry opt-in:

Help make RMBC Skills better! Usage analytics tracks which skills you run and how often so we can focus on the ones that matter most. Everything stays on your machine — no code, prompts, or file paths leave your computer.

Use AskUserQuestion:
- Question: "Cool with anonymous usage analytics? You can change this anytime."
- Options:
  1. "Sure, happy to help" — keep analytics on and mark as prompted
  2. "No thanks" — disable analytics and mark as prompted

If "Yes, that's fine":
```bash
mkdir -p ~/.rmbc-skills
touch ~/.rmbc-skills/.telemetry-prompted
```

If "No, turn it off":
```bash
mkdir -p ~/.rmbc-skills
touch ~/.rmbc-skills/.telemetry-prompted
sed -i '' 's/^analytics_enabled:.*/analytics_enabled: false/' ~/.rmbc-skills/config.yaml 2>/dev/null || true
```

Continue with this skill.

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.
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

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Media buying operationalizes the Research phase — audience targeting is Research translated into platform parameters. The testing framework mirrors the iterative approach RMBC applies to copy.

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

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.
