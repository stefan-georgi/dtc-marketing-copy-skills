---
name: pricing-strategy
description: Develop DTC pricing strategy — price anchoring, value-comparison economics, tiered pricing, subscription vs one-time, payment plans, and decoy pricing with 3 presentation formats and competitor context.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "pricing-strategy" --product "${_ACTIVE_PRODUCT:-none}" --tier 1 2>/dev/null &
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
# pricing-strategy

## Purpose

Develop pricing strategy for DTC products. Price is the most sensitive element on any sales page — it's where all the trust, mechanism, and proof work either converts or collapses. This skill doesn't just pick a number. It engineers how that number is presented, compared, and justified so the prospect feels the price is a bargain relative to the value. Output: recommended price point with justification, 3 distinct pricing presentations (how to frame it on the page), competitor price context, and payment plan options. Every recommendation ties back to RMBC — because pricing IS copy.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/benefits |
| `cost_per_unit` | Yes | Your cost to produce/fulfill one unit (COGS) |
| `competitor_prices` | No | Competitor products and their prices (as many as known) |
| `target_audience` | Yes | Who the buyer is — income level, price sensitivity, sophistication |
| `product_category` | Yes | One of: `supplement`, `skincare`, `info_product`, `software`, `physical_product`, `service`, `other` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Pricing strategy is the quantitative expression of RMBC — Research reveals what the market will bear and what competitors charge, Mechanism justifies premium pricing through uniqueness, Brief determines how price is positioned on the page, Copy presents the price in the most favorable frame. A strong mechanism supports premium pricing. A weak mechanism forces price competition.

### Step 2 — Analyze Price Position

Map the pricing landscape:

#### Market Context
- **Competitor price range:** Low, mid, and high end (from inputs or category benchmarks)
- **Category norms:** What prospects expect to pay for this type of product
- **Price sensitivity:** How much does this audience shop on price vs. value?

#### Unit Economics
- **COGS per unit:** [from input]
- **Target margin:** Category-appropriate (supplements: 70-85%, info products: 90%+, physical: 40-60%)
- **Breakeven volume:** Units needed at recommended price to cover fixed costs
- **LTV consideration:** If subscription or repeat purchase, factor lifetime value into front-end pricing

#### Mechanism Premium
- Strong unique mechanism → can price 20-50% above market average
- Moderate mechanism → price at or slightly above market
- Weak/no mechanism → must compete on price (flag this as a strategic problem)

### Step 3 — Recommend Price Point

Provide a single recommended price with full justification:

1. **The number** — Specific price (not a range)
2. **Margin analysis** — COGS, margin %, profit per unit
3. **Market position** — Where this sits relative to competitors (premium, mid, value)
4. **Mechanism justification** — Why the mechanism supports this price
5. **Psychological pricing** — Why this specific number (e.g., $47 vs $50, $197 vs $200)
6. **Risk assessment** — What happens if this price is too high or too low

### Step 4 — Build 3 Pricing Presentations

The same price, presented three different ways on the page. Each presentation uses a different psychological frame:

#### Presentation 1: Value-Comparison (Per-Unit Economics)
- Break the price into per-day, per-use, or per-unit cost
- Compare to something the audience already spends on: "Less than your daily coffee"
- Show the math explicitly — transparency builds trust
- Example: "$97/month = $3.23/day for [outcome]"

#### Presentation 2: Price Anchoring
- Establish a higher reference price first, then reveal the actual price
- Anchor options: retail price, competitor prices, component value, cost of the problem
- The anchor must be credible — "$10,000 value for $47" only works if the $10,000 is defensible
- Example: "Competitors charge $297/month. Individual components total $450. Your price today: $197"

#### Presentation 3: Savings/ROI Frame
- Position the price as an investment with measurable return
- Calculate the cost of NOT buying (ongoing problem cost, competitor switching cost, time wasted)
- Show ROI timeline: "Pays for itself within [X weeks/months]"
- Example: "At $197, if this saves you just one $500 mistake, you're ahead by $303"

### Step 5 — Payment Plan and Subscription Options

If applicable, provide structured payment alternatives:

| Option | Structure | Best For |
|--------|-----------|----------|
| **Single pay** | One payment, full price | Simplicity-seekers, maximum discount |
| **Payment plan** | 2-4 installments (slight premium) | Price-sensitive, higher-ticket ($200+) |
| **Subscription** | Monthly recurring with commitment discount | Consumables, software, ongoing services |
| **Decoy tier** | Inferior or superior option that makes target tier look best | Steering toward a specific tier |

For each option: exact pricing, page presentation (which to highlight), and "most popular" positioning.

### Step 6 — Competitor Price Context

Build a comparison frame the sales page can reference:

- **Category average:** "Most [products] in this category cost $X-$Y"
- **Premium alternative:** "High-end solutions run $X+"
- **Budget alternative:** "Cheap options exist at $X, but [what they sacrifice]"
- **Your position:** "At $[price], you get [premium quality] at [mid-market price]"

## Output Format

```
## Pricing Strategy: [Product Name]

**Category:** [product category]
**COGS:** $X per unit
**Recommended Price:** $XX
**Margin:** XX%
**Market Position:** [premium | mid-market | value]

---

### PRICE JUSTIFICATION

- **Margin analysis:** [COGS → price → margin %]
- **Competitor context:** [where this sits in the market]
- **Mechanism premium:** [how mechanism supports this price]
- **Psychological pricing:** [why this specific number]

---

### PRESENTATION 1: Value-Comparison
[Per-unit breakdown + everyday comparison]
> "[ready-to-use pricing copy]"

### PRESENTATION 2: Price Anchoring
[Anchor price → actual price + justification]
> "[ready-to-use pricing copy]"

### PRESENTATION 3: ROI Frame
[Investment framing + cost of not buying]
> "[ready-to-use pricing copy]"

---

### PAYMENT OPTIONS

| Option | Price | Terms | Highlight? |
|--------|-------|-------|-----------|
| Single pay | $XX | One-time | Best value badge |
| Payment plan | X × $XX | [terms] | Most popular badge |
| Subscription | $XX/mo | [terms] | If applicable |

**Recommended default:** [which option to pre-select or highlight]

---

### COMPETITOR CONTEXT (for page use)

- Category average: $X-$Y
- Premium tier: $X+
- Your positioning: "[one-sentence frame]"

---

### RISK ASSESSMENT

- **If price is too high:** [what happens + mitigation]
- **If price is too low:** [what happens + mitigation]
- **Recommended test:** [A/B test strategy for price validation]
```

## Quality Criteria

- Recommended price must be a specific number with margin math — never "somewhere between $97 and $197"
- All three pricing presentations must use genuinely different psychological frames — not three variations of the same anchor
- Value-comparison must use a relatable daily/unit cost the audience already pays for something
- Price anchoring must use credible anchors — inflated "value" claims destroy trust faster than they build it
- Payment plan pricing must account for the installment premium (typically 10-15% over single pay)
- Competitor context must be factual — never fabricate competitor prices or market averages
- Mechanism premium must be justified — premium pricing without a unique mechanism is wishful thinking
- Decoy pricing must feel like a real option to the buyer — obvious decoys insult intelligence

- **Specificity gate:** Every recommendation must include a number, name, or timeframe — no "optimize pricing" or "improve value perception"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Each recommendation must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** Each pricing recommendation must address at least 2 price objections ("too expensive", "cheaper alternatives exist", "what if it doesn't work?") with concrete counters (ROI math, value comparison, guarantee/risk reversal)

## Related Skills

- Run `/offer-stack` to design the full offer that surrounds this price point
- Run `/scarcity-urgency` to add time-sensitive pricing elements
- Run `/order-form-cro` to present the price optimally on the checkout page
- Run `/lander-copy` to integrate pricing presentations into the sales page
- Run `/competitor-offer-analysis` to gather competitor pricing intelligence
- Validate pricing copy with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.
