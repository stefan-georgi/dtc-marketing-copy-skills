---
name: funnel-architecture
description: Design complete DTC sales funnel architecture — maps the full customer journey from ad to email follow-up with RMBC-aligned copy approach, conversion goals, and KPI targets per step.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "funnel-architecture" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
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

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Funnel architecture applies RMBC at the macro level — Research determines awareness stages across funnel steps, Mechanism threads through every page as the consistent "why," Brief structures each page's strategic intent, Copy executes per-page with escalating commitment.

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

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/funnel-audit` — audit existing funnel first
- `/lander-copy` — write key landing pages
- `/order-form-cro` — optimize checkout step
- `/email-retention-sequences` — build post-purchase flow

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

