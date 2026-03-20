---
name: pricing-strategy
description: Develop DTC pricing strategy — price anchoring, value-comparison economics, tiered pricing, subscription vs one-time, payment plans, and decoy pricing with 3 presentation formats and competitor context.
model: sonnet
user-invocable: true
---

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

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Pricing strategy is the quantitative expression of RMBC — Research reveals what the market will bear and what competitors charge, Mechanism justifies premium pricing through uniqueness, Brief determines how price is positioned on the page, Copy presents the price in the most favorable frame. A strong mechanism supports premium pricing. A weak mechanism forces price competition.

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

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
