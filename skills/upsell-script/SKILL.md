---
name: upsell-script
description: Generate RMBC-structured one-time offer (OTO) / upsell page scripts — post-purchase pages that capitalize on buying momentum with a complementary offer.
model: sonnet
user-invocable: true
---

# upsell-script

## Purpose

Generate a complete upsell / OTO (one-time offer) page script structured around RMBC principles. Upsell pages appear immediately after purchase — the buyer's credit card is still warm, trust is at peak, and buying momentum is highest. The script must be short, urgent, and frictionless. Structure: congratulations on their purchase → "but wait" transition → complementary offer with its own mechanism → price anchoring against the value → single yes/no CTA. No navigation, no distractions — one decision only. Target: 60-90 seconds to read.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `main_product` | Yes | What the customer just purchased — name, price, core promise |
| `upsell_product` | Yes | What you're offering next — name, what it does, how it complements the main product |
| `upsell_price` | Yes | Price of the upsell and any discount framing (e.g., "normally $197, today only $67") |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, desires, sophistication level |
| `key_mechanism` | No | The upsell product's unique mechanism (output from `/mechanism-ideation`) |
| `guarantee` | No | Money-back guarantee details (default: same as main product guarantee) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Upsell scripts compress the full RMBC arc into a single page — Research validates the complementary need, Mechanism justifies urgency, Brief structures the one-page argument, Copy executes with radical brevity.

### Step 2 — Map the Emotional State

The buyer just said yes to the main product. Map their current psychology:
- **Momentum** — They're in buying mode, credit card already entered
- **Trust peak** — They just trusted you with money; reciprocity is high
- **Desire gap** — What adjacent problem does the main product NOT solve?
- **Completion instinct** — How does the upsell complete what they just started?

### Step 3 — Write the Upsell Script

#### Section 1: Congratulations (2-3 sentences)
- Validate their purchase decision
- Reinforce what they're about to receive
- Build excitement about what's coming

#### Section 2: "But Wait" Transition (2-3 sentences)
- Identify the gap — what the main product alone can't do
- Frame it as the ONE thing that could slow their results
- Must feel like a genuine insight, not a sales trick

#### Section 3: Introduce the Upsell (3-5 sentences)
- Name the upsell product
- Connect it directly to the main product's promise
- If mechanism provided: explain WHY they need this NOW (mechanism-driven urgency)
- If no mechanism: use complementary logic ("X works best when paired with Y")

#### Section 4: Price Anchoring (2-3 sentences)
- Anchor against a higher reference price (retail, standalone, competitor)
- Reveal the "today only" price as a sharp contrast
- Frame as a fraction of what they just paid OR fraction of the value received

#### Section 5: Single CTA (yes/no format)
- One button: "Yes, Add [Upsell] To My Order"
- One text link below: "No thanks, I don't want [specific benefit]"
- The "no" text must name what they're declining in benefit language

### Step 4 — Validate Brevity

The entire script must be readable in 60-90 seconds. If any section exceeds its sentence count, cut. The buyer has momentum — don't kill it with length.

## Output Format

```
## Upsell Script: [Upsell Product Name]

**Main Product:** [what they just bought]
**Upsell Product:** [what you're offering]
**Price:** [upsell price with anchoring]
**Read Time:** ~60-90 seconds

---

### CONGRATULATIONS

[2-3 sentences]

### THE GAP

[2-3 sentences — "but wait" transition]

### THE SOLUTION

[3-5 sentences — upsell introduction with mechanism if provided]

### THE PRICE

[2-3 sentences — anchoring and reveal]

### CTA

[YES BUTTON]: "Yes, Add [Product] To My Order — Just $XX"

[NO LINK]: "No thanks, I don't want [specific benefit they're declining]"

---

## Conversion Notes

- **Emotional lever:** [primary emotion driving this upsell]
- **Complement logic:** [how upsell + main product work together]
- **Price psychology:** [why this price point works against the anchor]
```

## Quality Criteria

- Total script must be readable in 60-90 seconds — ruthless brevity
- Congratulations section must validate the main purchase, not sell the upsell yet
- "But wait" transition must feel like genuine insight, not manipulative
- Upsell must logically complement the main product — not a random add-on
- Price anchor must be credible (real retail price, not inflated fiction)
- "No thanks" link must name the specific benefit being declined
- No navigation elements, sidebars, or distractions in the output — single-path page

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` for the upsell product's mechanism
- Run `/lander-copy` for the main product's sales page (feeds the congratulations section)
- Feed into `/upsell-sequence-writer` for post-purchase email follow-up
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
