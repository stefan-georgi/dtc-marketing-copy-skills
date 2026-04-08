---
name: bonus-stack
description: Design bonus stacks that increase perceived value without increasing fulfillment cost — 3-5 bonuses with name, description, perceived value, actual cost, and core offer complement rationale using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "bonus-stack" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# bonus-stack

## Purpose

Design bonus stacks that increase perceived value without increasing fulfillment cost. Bonuses are the leverage in an offer — they add perceived value at a fraction of the actual cost, tipping the buyer's internal math from "maybe" to "yes." The best bonuses aren't random giveaways; they address a specific objection, complement the core product's mechanism, and feel expensive while costing almost nothing to deliver. This skill produces 3-5 bonuses with names, descriptions, perceived values, actual costs, and explicit rationale for why each one belongs in the stack.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `core_product` | Yes | What the main product is, its mechanism, what transformation it delivers |
| `price_point` | Yes | Price of the core product — bonuses must feel proportional |
| `target_audience` | Yes | Who the buyer is — their objections, desires, and what they'd pay for separately |
| `fulfillment_constraint` | Yes | One of: `digital_only` (no physical shipping), `physical_ok` (can include physical items) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Bonus design is an RMBC exercise — Research reveals which objections bonuses must kill, the Mechanism determines which bonuses naturally extend the "why it works" story, the Brief sequences bonuses for maximum perceived value, and Copy names each bonus to feel like a standalone product.

### Step 2 — Map the Objection Landscape

Before designing bonuses, identify the buyer's top 5 objections at the point of purchase. Every bonus must kill at least one:

| Objection Type | Example | Bonus Strategy |
|----------------|---------|----------------|
| **"Will it work for ME?"** | Skepticism about personal results | Case study guide, assessment tool, personalization element |
| **"I don't have time"** | Implementation overwhelm | Quick-start guide, templates, checklists that reduce time to value |
| **"What if I get stuck?"** | Fear of confusion or complexity | FAQ resource, troubleshooting guide, community access |
| **"Is it worth the money?"** | Value skepticism | Bonus that would cost more than the product if purchased separately |
| **"I can find this free"** | Commodity perception | Unique/proprietary bonus that isn't available anywhere else |
| **"I've tried X before and it failed"** | Past failure baggage | Differentiation guide showing why this approach is different |

### Step 3 — Design Each Bonus

For each bonus (3-5 total), define all of the following:

#### Bonus Anatomy

| Field | What It Is | Example |
|-------|-----------|---------|
| **Name** | Branded, benefit-loaded title | "The 7-Day Quick-Start Blueprint" not "a guide" |
| **Type** | Category of deliverable | Digital guide, template, checklist, video training, community access, live session |
| **Description** | 2-3 sentences: what it is + why it matters for their outcome | Focuses on transformation, not features |
| **Perceived Value** | What a buyer would expect to pay for this if sold separately | Must be defensible — could you sell this standalone? |
| **Actual Cost** | What it costs you to create and deliver | One-time creation cost amortized across all buyers |
| **Value Multiplier** | Perceived Value / Actual Cost | Higher = better leverage. Target: 10x+ |
| **Objection Killed** | Which specific buyer objection this neutralizes | Must map to the objection landscape from Step 2 |
| **Core Offer Connection** | How it extends the main product's mechanism | Must reinforce, not distract from, the core mechanism |

#### Bonus Type Selection Guide

| Type | Perceived Value | Creation Cost | Delivery Cost | Best For |
|------|:-:|:-:|:-:|---------|
| **Digital guide/PDF** | Medium ($47-197) | Low (4-8 hours) | Zero | Any product — fastest to create |
| **Template/toolkit** | High ($97-297) | Low (2-4 hours) | Zero | Products with implementation steps |
| **Checklist/cheatsheet** | Medium ($27-97) | Very low (1-2 hours) | Zero | Quick-start items, fast wins |
| **Video training** | High ($197-497) | Medium (1-2 days) | Zero | Courses, info products, coaching |
| **Community access** | High ($97-497/mo perceived) | Low ongoing | Low (moderation time) | Subscriptions, programs |
| **Live session/call** | Very high ($297-997) | Medium (your time per cohort) | Zero | High-ticket, coaching, premium |

### Step 4 — Sequence the Stack

Order matters. Bonuses should be presented in this sequence:

1. **Fast-start bonus** — Reduces time-to-value, addresses "I don't have time" objection
2. **Deep-value bonus** — Highest perceived value, addresses "is it worth the money" objection
3. **Differentiation bonus** — Unique to this offer, addresses "I can find this free" objection
4. **Support bonus** — Reduces implementation risk, addresses "what if I get stuck" objection
5. **Surprise bonus** (optional) — Unrelated delight that exceeds expectations

### Step 5 — Validate the Stack

| Criterion | Test | Pass |
|-----------|------|------|
| **Total perceived value** | Sum all bonus values | Must be 3-5x the core product price |
| **Total actual cost** | Sum all creation + delivery costs | Must be under 15% of core product price |
| **Objection coverage** | Map bonuses to objections | Top 3 objections must be addressed |
| **Mechanism alignment** | Does each bonus reinforce the core mechanism? | No bonus should contradict or distract |
| **Fulfillment constraint** | All bonuses match `digital_only` or `physical_ok` | No physical bonuses if constraint is digital_only |
| **Standalone test** | Could each bonus be sold on its own? | If not, the perceived value claim is weak |

## Output Format

```
## Bonus Stack: [Core Product Name]

**Core Product Price:** $XX
**Fulfillment Constraint:** [digital_only / physical_ok]
**Target Audience:** [ICP summary]

---

### OBJECTION MAP

| # | Objection | Addressed By |
|---|-----------|-------------|
| 1 | [objection] | Bonus [#] |
| 2 | [objection] | Bonus [#] |
| 3 | [objection] | Bonus [#] |
| 4 | [objection] | Bonus [#/Core] |
| 5 | [objection] | Bonus [#/Core] |

---

### BONUS 1: [Bonus Name]
**Type:** [bonus type]
**Perceived Value:** $XXX
**Actual Cost:** $XX (one-time creation) / $X per unit delivery
**Value Multiplier:** XXx

[2-3 sentence description — what it is + why it matters]

- **Objection killed:** "[specific objection]"
- **Core offer connection:** [how it extends the mechanism]
- **Sequence position:** Fast-start — gets them results in [timeframe]

### BONUS 2-5: [Same format]

---

### STACK ECONOMICS

| Component | Perceived Value | Actual Cost |
|-----------|---------------:|------------:|
| Bonus 1: [name] | $XXX | $XX |
| Bonus 2: [name] | $XXX | $XX |
| Bonus 3: [name] | $XXX | $XX |
| [Bonus 4-5 if applicable] | $XXX | $XX |
| **Total Bonus Value** | **$X,XXX** | **$XX** |
| **Core Product** | **$XXX** | — |
| **Total Stack Value** | **$X,XXX** | — |
| **Customer Pays** | **$XX** | — |
| **Bonus Value Multiplier** | **XXx** | — |
| **Total Stack Ratio** | **X:1** | — |

---

### VALIDATION
- Total bonus value vs core price: [X:1 — pass/fail]
- Total actual cost vs core price: [X% — pass/fail]
- Top 3 objections addressed: [pass/fail]
- Mechanism alignment: [pass/fail]
- Fulfillment constraint met: [pass/fail]
- Standalone test: [pass/fail for each bonus]
```

## Quality Criteria

- Every bonus must kill a named objection — bonuses that don't address a specific "why not buy" are filler
- Perceived values must be defensible — could you sell this bonus standalone at the stated price?
- Actual costs must be realistic — don't claim zero cost for a video series that takes 2 days to produce
- Value multiplier (perceived / actual) should be 10x+ per bonus — below 5x means poor leverage
- Total bonus value should be 3-5x the core product price — below 3x and the stack doesn't feel generous
- No bonus should contradict or distract from the core product's mechanism
- Fulfillment constraints must be respected — digital_only means no physical items, no exceptions
- Each bonus must have a branded name — "Bonus 1: A PDF" doesn't add perceived value

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/offer-stack` to integrate bonuses into the full offer architecture with guarantee and urgency
- Run `/guarantee-writer` for the risk-reversal element of the offer
- Run `/mechanism-ideation` to ensure bonuses extend the core mechanism
- Run `/lander-copy` to write the sales page that reveals the bonus stack
- Run `/ab-test-plan` to test different bonus configurations
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/offer-stack` — build complete offer
- `/pricing-strategy` — validate perceived value
- `/lander-copy` — integrate into sales page

### RMBC Completeness

Always deliver the full framework implementation. AI makes the marginal cost of completeness near-zero:
- Include ALL hook types (not just 2-3)
- Cover ALL awareness levels (not just most-aware)
- Handle ALL major objections (not just the obvious ones)
- Show the mechanism (not just the result)

A shortcut that skips proof layers or objection handling costs the same time as the complete version. Always deliver complete.

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.

