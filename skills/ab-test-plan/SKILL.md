---
name: ab-test-plan
description: Generate structured A/B test plans for DTC funnels — hypothesis, control vs variant, primary metric, sample size estimate, test duration, and success criteria using RMBC principles.
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
if [ -n "$_WORKSPACE" ] && [ -d "$_WORKSPACE" ]; then
  _R_DONE=$([ -f "$_WORKSPACE/research.md" ] && echo "yes" || echo "no")
  _M_DONE=$([ -f "$_WORKSPACE/mechanism.md" ] && echo "yes" || echo "no")
  _B_DONE=$([ -f "$_WORKSPACE/brief.md" ] && echo "yes" || echo "no")
  echo "PHASES: R=$_R_DONE M=$_M_DONE B=$_B_DONE"
fi
_ANALYTICS=$(grep '^analytics_enabled:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^analytics_enabled:[[:space:]]*//' || echo "true")
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "ab-test-plan" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
_SESSION_COUNT=$(ls /tmp/rmbc-session-* 2>/dev/null | wc -l | tr -d ' '); touch "/tmp/rmbc-session-$$"
echo "SESSIONS: $_SESSION_COUNT"
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
# ab-test-plan

## Purpose

Generate structured A/B test plans for DTC funnels. Testing is how you turn opinions into revenue data. Most teams waste tests by changing too many variables, running too short, or measuring the wrong metric. This skill produces a single, clean test plan with a falsifiable hypothesis, defined control and variant, primary metric, sample size estimate, expected duration, and success criteria. Every test plan connects back to RMBC — you're testing Research assumptions, Mechanism angles, Brief strategies, or Copy execution.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `page_type` | Yes | What you're testing: `landing_page`, `order_form`, `upsell`, `email`, `ad`, `checkout` |
| `current_metric` | Yes | Baseline performance: conversion rate, CTR, AOV, or revenue per visitor |
| `hypothesis` | Yes | What you believe will improve performance and why |
| `traffic_volume` | Yes | Daily unique visitors or impressions to the test page |
| `test_element` | Yes | One of: `headline`, `price`, `offer`, `layout`, `copy_length`, `mechanism`, `cta`, `guarantee`, `social_proof` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. A/B testing validates RMBC decisions with data — Research assumptions get tested through audience-facing copy, Mechanism strength gets tested through conversion lift, Brief strategy gets tested through engagement, Copy execution gets tested through click and purchase behavior.

### Step 2 — Classify the Test Type

| Test Type | What Changes | Typical Lift | Risk Level |
|-----------|-------------|-------------|------------|
| **Headline** | Lead/hook copy only | 5-30% | Low — copy swap, no structural change |
| **Price** | Price point or framing | 10-50% | Medium — affects AOV and refund rate |
| **Offer** | What's included in the deal | 15-60% | Medium — may affect fulfillment |
| **Layout** | Page structure, element order | 5-20% | Low-Medium — design change only |
| **Copy Length** | Long vs short form | 10-40% | Low — same offer, different depth |
| **Mechanism** | Which "why it works" angle | 10-35% | Low — copy change, different angle |
| **CTA** | Button text, placement, urgency | 5-15% | Low — smallest change, quickest test |
| **Guarantee** | Risk reversal type or duration | 5-25% | Low-Medium — may affect refund rate |
| **Social Proof** | Testimonials, numbers, authority | 5-20% | Low — additive element |

### Step 3 — Build the Test Plan

#### 3a: Hypothesis Statement
Write a falsifiable hypothesis in this format:
"Changing [element] from [control version] to [variant version] will increase [primary metric] by [estimated %] because [RMBC-grounded reason]."

The reason must connect to an RMBC phase:
- **Research-based:** "Our ICP research shows the audience responds more to fear than desire"
- **Mechanism-based:** "The current mechanism angle is too generic — the variant names a specific process"
- **Brief-based:** "The page leads with features when proof should come first for this awareness level"
- **Copy-based:** "The CTA is vague — benefit-driven button text reduces friction"

#### 3b: Control vs Variant
Define exactly what stays the same and what changes. Only ONE variable changes per test.

#### 3c: Primary Metric
Choose ONE primary metric. Secondary metrics are tracked but don't determine the winner.

| Page Type | Primary Metric | Secondary Metrics |
|-----------|---------------|-------------------|
| Landing page | Conversion rate (visitor → buyer) | Bounce rate, time on page, scroll depth |
| Order form | Checkout completion rate | Cart abandonment rate, AOV |
| Upsell | Take rate (% who accept) | Revenue per visitor, refund rate |
| Email | Click-through rate | Open rate, unsubscribe rate, conversion |
| Ad | CTR or CPA | CPM, frequency, relevance score |

#### 3d: Sample Size Estimate
Calculate minimum sample size per variation using:
- **Baseline conversion rate** (from `current_metric`)
- **Minimum detectable effect (MDE):** 10-20% relative improvement (default 15%)
- **Statistical significance:** 95% confidence (p < 0.05)
- **Statistical power:** 80%

Provide the estimate and the formula reasoning. Flag if traffic volume means the test will take longer than 4 weeks — long tests accumulate confounding variables.

#### 3e: Test Duration
`Duration = (Sample size per variation × 2) / Daily traffic`

Rules:
- Minimum 7 days (capture full weekly cycle)
- Maximum 4 weeks (diminishing returns, external variables)
- Must include at least one full weekend cycle
- If duration exceeds 4 weeks at 15% MDE, recommend increasing MDE to 20-25% or testing a higher-impact element

#### 3f: Success Criteria
Define before launch — never move the goalposts mid-test:
- Primary metric improvement at 95% confidence
- Minimum sample size reached
- No significant negative movement in secondary metrics (especially refund rate for price/offer tests)

### Step 4 — Risk Assessment

Flag risks specific to this test type:
- **Price tests:** Monitor refund rate for 30 days post-test
- **Offer tests:** Verify fulfillment capacity for the variant
- **Layout tests:** Check mobile rendering before launch
- **Copy length tests:** Ensure tracking captures scroll depth

## Output Format

```
## A/B Test Plan: [Test Name]

**Page:** [page_type]
**Element:** [test_element]
**Current Metric:** [baseline]
**Daily Traffic:** [volume]

---

### HYPOTHESIS
[Falsifiable hypothesis statement with RMBC reasoning]

### CONTROL (A)
[Exact description of current version]

### VARIANT (B)
[Exact description of changed version — only ONE variable different]

### METRICS

| | Primary | Secondary |
|---|---------|-----------|
| **Metric** | [metric] | [metric 1], [metric 2] |
| **Current** | [baseline] | [baselines if known] |
| **Target** | [+X% improvement] | [monitor only] |

### SAMPLE SIZE & DURATION

- **Sample per variation:** [number]
- **Total sample needed:** [number]
- **Estimated duration:** [X days]
- **MDE:** [X%]
- **Confidence:** 95%

### SUCCESS CRITERIA
1. [Primary metric criteria]
2. [Sample size criteria]
3. [Secondary metric guardrails]

### RISKS
- [Risk 1 + mitigation]
- [Risk 2 + mitigation]

### NEXT STEPS
- [ ] Implement variant
- [ ] QA on mobile and desktop
- [ ] Set up tracking and dashboards
- [ ] Launch test on [recommended day]
- [ ] Check results at [midpoint] — do NOT stop early
- [ ] Call winner at [end date] if criteria met
```

## Quality Criteria

- Hypothesis must be falsifiable and grounded in a specific RMBC phase — "I think this will work better" is not a hypothesis
- Only ONE variable may change between control and variant — multi-variable tests produce unusable data
- Sample size must be calculated, not guessed — underpowered tests declare false winners
- Duration must include at least one full weekly cycle — weekday-only data skews results
- Success criteria must be defined before launch — post-hoc criteria are just confirmation bias
- Price and offer tests must track refund rates for 30 days — a "winning" price that doubles refunds loses money

- **Specificity gate:** Every recommendation must include a number, name, or timeframe — no "test for improvement" or "optimize results"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Each recommendation must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode

## Related Skills

- Run `/funnel-audit` to identify which funnel step needs testing most
- Run `/hook-battery` to generate headline variants for headline tests
- Run `/order-form-cro` for checkout element test ideas
- Run `/lander-copy` to generate landing page variant copy
- Run `/guarantee-writer` for guarantee variant options
- Validate test copy with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/rmbc-copy-audit` — score both variants
- `/funnel-audit` — audit test context
- `/hook-battery` — generate test variants

### RMBC Completeness

Always deliver the full framework implementation. AI makes the marginal cost of completeness near-zero:
- Include ALL hook types (not just 2-3)
- Cover ALL awareness levels (not just most-aware)
- Handle ALL major objections (not just the obvious ones)
- Show the mechanism (not just the result)

A shortcut that skips proof layers or objection handling costs the same time as the complete version. Always deliver complete.

### Completion Protocol

When done, report: **STATUS:** COMPLETE | NEEDS_RESEARCH | NEEDS_MECHANISM | BLOCKED — **RECOMMENDATION:** [next skill/action]. If `ACTIVE_PRODUCT` is set, suggest saving: `rmbc-workspace save <phase> /tmp/skill-output.md`

### Prerequisite Detection

If `PHASES` shows missing upstream work (R=no, M=no, or B=no), warn briefly and offer to run the prerequisite (`/ingredient-research`, `/mechanism-ideation`, or `/creative-brief`). Present "[Run prerequisite] [Skip — generate anyway]" via AskUserQuestion. Never block.

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.

