---
name: offer-stack
description: Design irresistible offer stacks — core offer, bonuses, guarantee, urgency, and price anchoring structured to hit a 10:1 perceived-value-to-price ratio using RMBC principles.
model: sonnet
user-invocable: true
---

# offer-stack

## Purpose

Design irresistible offer stacks that make the price feel like a steal. An offer stack is the complete package a prospect receives — the core offer plus bonuses, guarantee, urgency, and price anchoring. The target: 10:1 perceived value to actual price. If the product costs $97, the stack should feel worth $970+. This skill structures every component with a name, description, retail value, and a reason it matters to the ICP. The offer stack is where Mechanism meets money — every bonus reinforces the core mechanism and removes a specific objection.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `core_product` | Yes | What the main product/service is, what it does, key features or deliverables |
| `price_point` | Yes | Actual price the customer pays, plus any payment plan options |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, desires, awareness level |
| `num_bonuses` | No | Number of bonuses to include (default: 3, range: 2-5) |
| `guarantee_type` | No | Preferred guarantee: `money_back`, `conditional`, `better_than_money_back`, `performance`, `double_money_back` (default: `money_back`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Offer stacking applies RMBC at the deal level — Research reveals which objections the bonuses must neutralize, the Mechanism determines what "only we" bonuses make sense, the Brief structures the stack for maximum perceived value, and Copy names each component compellingly.

### Step 2 — Analyze the Value Architecture

Before building the stack, map the prospect's decision framework:

| Factor | Question | How It Shapes the Stack |
|--------|----------|------------------------|
| **Core desire** | What outcome do they want most? | Core offer messaging leads with this |
| **Primary objection** | Why would they NOT buy? | Guarantee and key bonus address this |
| **Secondary objections** | What else holds them back? | Remaining bonuses address these |
| **Comparison set** | What else could they spend this money on? | Price anchoring uses this as reference |
| **Time to value** | How quickly do they need results? | Fast-start bonus accelerates perceived time to value |

### Step 3 — Build the Offer Stack

#### Component 1: Core Offer
- **Name:** A benefit-loaded name, not a product description ("The 90-Day Metabolic Reset System" not "Weight Loss Course")
- **Description:** 2-3 sentences focused on the transformation, not the features
- **Retail Value:** Anchored to market comparables (what would an equivalent service/product cost?)
- **Key deliverables:** Bullet list of what's included — specific and tangible

#### Component 2: Bonuses (default 3)
Each bonus must pass three tests:
1. **Objection killer** — Does it neutralize a specific reason NOT to buy?
2. **Mechanism reinforcer** — Does it connect to the core product's mechanism?
3. **Low fulfillment cost** — Can it be delivered without significant additional cost?

Bonus types ranked by perceived value:
| Type | Perceived Value | Fulfillment Cost | Best For |
|------|----------------|-------------------|----------|
| Live session/call | Very high | Medium (time) | High-ticket, coaching, services |
| Video training | High | Low (one-time creation) | Courses, info products |
| Template/toolkit | High | Very low | Any product with implementation |
| Digital guide/PDF | Medium | Very low | Supplements, physical products |
| Community access | High | Low (ongoing moderation) | Subscriptions, courses |
| Checklist/cheatsheet | Medium | Very low | Quick wins, fast-start items |

For each bonus:
- **Name:** Named and branded ("The Quick-Start Implementation Checklist" not "a checklist")
- **Description:** 1-2 sentences — what it is AND why it matters for their outcome
- **Retail Value:** What this would cost if purchased separately (be defensible, not absurd)
- **Objection it kills:** Which specific objection this bonus neutralizes

#### Component 3: Guarantee
Frame the guarantee as confidence, not risk — "We're so confident because [mechanism-based reason]."

| Guarantee Type | Copy Frame | Best For |
|----------------|-----------|----------|
| **Money-back** | "Try it for [X] days. If you don't [outcome], we refund every penny." | Standard, low-risk |
| **Conditional** | "Follow the [system] for [X] days. If you don't [outcome], we refund you." | Courses, coaching (filters tire-kickers) |
| **Better-than-money-back** | "If it doesn't work, keep [bonus] AND get your money back." | High-confidence offers |
| **Performance** | "If you don't [specific measurable result], we [specific compensation]." | Results-based services |
| **Double-money-back** | "If you don't [outcome], we'll refund double your investment." | Very high-confidence, attention-grabbing |

#### Component 4: Urgency
Only include if the urgency is genuine. Types:
- **Deadline:** Specific date the offer expires
- **Quantity:** Limited units, spots, or seats available
- **Bonus expiry:** Bonuses available only until [date]
- **Price increase:** Price goes up after [date/event]

Never fabricate urgency. If no genuine urgency exists, skip this component and note that the offer is evergreen.

#### Component 5: Price Anchoring
Structure the value reveal to make the price feel small:
1. Stack total retail value of all components
2. Show the "value" total prominently
3. Reveal the actual price as a fraction
4. Calculate the ratio: Total Value / Actual Price = X:1
5. Target: 10:1 minimum. Below 5:1 means the stack needs more perceived value.

### Step 4 — Validate the Stack

Check the complete offer against these criteria:
- [ ] Value ratio is 10:1 or higher
- [ ] Every bonus kills a specific objection (no "filler" bonuses)
- [ ] Guarantee duration is long enough to try the product (30 days minimum)
- [ ] Price anchoring uses defensible retail values — not inflated nonsense
- [ ] A first-time visitor could understand the full offer in under 60 seconds
- [ ] The stack works on mobile — the value breakdown must be scannable

## Output Format

```
## Offer Stack: [Core Product Name]

**Target Audience:** [ICP summary]
**Price:** [actual price]
**Target Value Ratio:** 10:1

---

### CORE OFFER
**[Product Name]** — Retail Value: $X,XXX
[2-3 sentence description focused on transformation]

Key deliverables:
- [Deliverable 1]
- [Deliverable 2]
- [Deliverable 3]

---

### BONUS 1: [Bonus Name] — Value: $XXX
[1-2 sentence description]
**Kills objection:** "[specific objection]"

### BONUS 2: [Bonus Name] — Value: $XXX
[1-2 sentence description]
**Kills objection:** "[specific objection]"

### BONUS 3: [Bonus Name] — Value: $XXX
[1-2 sentence description]
**Kills objection:** "[specific objection]"

---

### GUARANTEE
**[Guarantee Name]** ([type] — [duration])
[2-3 sentence guarantee copy]

---

### URGENCY
[Urgency element — or "Evergreen offer: no artificial urgency"]

---

### PRICE ANCHOR

| Component | Value |
|-----------|------:|
| [Core Offer] | $X,XXX |
| [Bonus 1] | $XXX |
| [Bonus 2] | $XXX |
| [Bonus 3] | $XXX |
| **Total Value** | **$X,XXX** |
| **You Pay** | **$XX** |
| **Value Ratio** | **X:1** |

---

### STACK VALIDATION
- Value ratio: [X:1 — pass/fail]
- Every bonus kills an objection: [pass/fail]
- Guarantee duration adequate: [pass/fail]
- Retail values defensible: [pass/fail]
- Mobile-scannable: [pass/fail]
```

## Quality Criteria

- Value ratio must hit 10:1 minimum — below this the offer doesn't feel irresistible
- Every bonus must name the specific objection it neutralizes — "nice to have" bonuses dilute the stack
- Retail values must be defensible — if someone Googled the bonus, the value should hold up
- Guarantee must be specific about duration, process, and conditions — vague guarantees feel like loopholes
- Urgency must be genuine or explicitly omitted — fake scarcity is worse than no urgency
- The stack must be presentable on a mobile sales page — if the value table is unreadable on a phone, it fails

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/bonus-stack` for deeper bonus design with fulfillment cost analysis
- Run `/guarantee-writer` for extended guarantee copy variations
- Run `/lander-copy` to write the sales page that presents this offer stack
- Run `/hook-battery` for headlines that lead into the offer reveal
- Run `/mechanism-ideation` to ensure bonuses reinforce the core mechanism
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
