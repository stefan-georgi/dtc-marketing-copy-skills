---
name: free-offer-brief
description: Design free lead magnets and tripwire offers that demonstrate RMBC quality — each brief includes offer name, format, hook angle, landing page headline, perceived value, production cost, and email follow-up strategy.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "free-offer-brief" --product "${_ACTIVE_PRODUCT:-none}" --tier 1 2>/dev/null &
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
# free-offer-brief

## Purpose

Design free lead magnets and tripwire offers that serve as funnel entry points. The free offer IS the first impression — it must demonstrate the same RMBC quality as paid products. A weak lead magnet trains prospects to ignore you. A strong one builds trust, establishes mechanism credibility, and creates reciprocity that drives paid conversions. This skill outputs a complete brief for each offer type: name, format, hook angle, landing page headline, perceived value framing, production cost estimate, and the email follow-up strategy that converts free leads into buyers.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_line` | Yes | The paid product(s) this free offer will lead into — name, price, core promise |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, awareness level |
| `offer_type` | Yes | One of: `guide`, `checklist`, `quiz`, `free_shipping`, `trial`, `sample` |
| `budget_constraint` | No | Maximum production/fulfillment cost per lead (default: $0 for digital, specify for physical) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Free offers apply RMBC in miniature — Research identifies what the audience values enough to trade their email for, Mechanism gives the free offer a unique angle that previews the paid product's approach, Brief structures the offer for maximum perceived value, Copy makes the landing page convert.

### Step 2 — Assess Offer Type Fit

Evaluate the chosen offer type against the audience and product line:

| Offer Type | Best For | Perceived Value Driver | Fulfillment Cost |
|------------|----------|----------------------|-----------------|
| **Guide** | Info products, services — audience wants education | Depth of insight, specificity | $0 (digital PDF) |
| **Checklist** | Action-oriented audiences — want quick wins | Immediate usability, saves time | $0 (digital) |
| **Quiz** | Broad audiences — curiosity-driven, personalization | Self-knowledge, custom results | $0 (software) |
| **Free+Shipping** | Physical products — supplements, beauty, gadgets | Tangible product in hand | $3-15 COGS + shipping |
| **Trial** | Software, subscriptions — need to experience value | Risk-free experience of the real product | Variable (usage cost) |
| **Sample** | Consumables — supplements, food, skincare | Taste/test before committing to full supply | $2-8 COGS + shipping |

If the chosen type is a poor fit for the product line, flag the mismatch and recommend a better type before proceeding.

### Step 3 — Design the Offer

Build the complete offer brief:

#### Offer Name
- Must be specific and outcome-driven: "The 7-Day Gut Reset Checklist" not "Free Health Guide"
- Include a number, timeframe, or specificity marker
- The name alone should communicate value

#### Format and Scope
- Define exactly what the prospect receives and in what format
- For digital: page count, sections, bonus elements
- For physical: product specs, quantity, packaging
- Scope rule: solve ONE specific problem completely — never try to cover everything

#### Hook Angle
- The single most compelling reason to claim this offer NOW
- Must connect to the paid product's mechanism without giving it all away
- The hook should create a curiosity gap that the paid product fills

#### Landing Page Headline
- 3 headline variations, each using a different RMBC lead pattern:
  1. Curiosity/mechanism-led
  2. Outcome/desire-led
  3. Problem/pain-led

#### Perceived Value Framing
- What this would cost if sold separately (credible anchor)
- Why it's being offered free (the reason must be believable)
- What makes it genuinely valuable, not just "free content"

#### Production Cost Estimate
- Itemized: content creation, design, fulfillment, platform/software
- Cost per lead at projected volume (100, 1000, 5000 leads)
- Flag if cost exceeds budget constraint

### Step 4 — Map the Email Follow-Up Strategy

The free offer is the beginning, not the end. Define the conversion path:

| Email | Timing | Purpose | Content Direction |
|-------|--------|---------|-------------------|
| Delivery | Immediate | Deliver the offer + set expectations | Here's your [offer] + what to do first |
| Quick Win | Day 1-2 | Help them USE the offer and get a result | One action step from the guide/checklist |
| Mechanism Tease | Day 3-4 | Introduce the paid product's mechanism | "The guide covers X, but here's what it can't do alone..." |
| Social Proof | Day 5-6 | Show results from paid customers | Testimonial + before/after |
| Offer | Day 7 | Present the paid product with a transition incentive | Special pricing for free offer recipients |

### Step 5 — Validate the Funnel Bridge

Confirm the free offer creates a logical bridge to the paid product:

- [ ] The free offer solves a real problem (not manufactured)
- [ ] Consuming the free offer naturally reveals the need for the paid product
- [ ] The mechanism preview in the free offer matches the paid product's mechanism
- [ ] The email sequence has a clear, non-pushy path from free to paid
- [ ] The perceived value justifies giving up an email address

## Output Format

```
## Free Offer Brief: [Offer Name]

**Type:** [guide | checklist | quiz | free_shipping | trial | sample]
**Paid Product Bridge:** [product name + price]
**Target Audience:** [ICP summary]
**Budget Constraint:** [amount or "digital only"]

---

### OFFER DESIGN

**Name:** [specific, outcome-driven name]
**Format:** [what they receive — format, length, delivery method]
**Scope:** [the ONE problem this solves]
**Hook Angle:** [the compelling reason to claim it now]

---

### LANDING PAGE HEADLINES

1. **Curiosity:** "[headline]"
2. **Outcome:** "[headline]"
3. **Pain:** "[headline]"

---

### VALUE FRAMING

- **Perceived value:** $[anchor price] if sold separately
- **Why free:** [believable reason]
- **Genuine value:** [what makes this worth their email]

---

### PRODUCTION COST

| Item | Cost |
|------|------|
| [content/design/fulfillment] | $X |
| **Cost per lead (at 1000 leads):** | $X.XX |

---

### EMAIL FOLLOW-UP SEQUENCE

| # | Timing | Subject Line Direction | Purpose |
|---|--------|----------------------|---------|
| 1 | Immediate | [direction] | Deliver + set expectations |
| 2 | Day 1-2 | [direction] | Quick win |
| 3 | Day 3-4 | [direction] | Mechanism tease |
| 4 | Day 5-6 | [direction] | Social proof |
| 5 | Day 7 | [direction] | Paid offer |

---

### FUNNEL BRIDGE VALIDATION

[Pass/fail on each bridge criterion]
```

## Quality Criteria

- Offer name must be specific and outcome-driven — generic names like "Free Guide" signal low value
- Hook angle must create a curiosity gap that the paid product fills — not give away the whole mechanism
- Landing page headlines must use three distinct RMBC lead patterns — not three variations of the same angle
- Perceived value anchor must be credible — a $5 checklist positioned as "$497 value" destroys trust
- Production cost must be itemized and compared against budget constraint — no surprises
- Email follow-up must bridge to the paid product within 7 days — longer sequences lose momentum
- The free offer must solve a real problem completely enough to build trust, but not so completely that the paid product feels unnecessary

- **Specificity gate:** Every recommendation must include a number, name, or timeframe — no "high value" or "strong appeal"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The brief must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The brief must address "what's the catch?" and "is this worth my email?" — include at least 2 trust-building elements (social proof, no-spam promise, instant access, preview of value)

## Related Skills

- Run `/welcome-sequence` to expand the 5-email follow-up into a full onboarding sequence
- Run `/lander-copy` to write the full landing page from the headline directions
- Run `/hook-battery` to generate additional headline and ad hook variations
- Run `/funnel-architecture` to see where this free offer fits in the complete funnel
- Run `/offer-stack` to design the paid offer this free offer leads into
- Validate the landing page with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.
