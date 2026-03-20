---
name: cart-abandonment-flow
description: Generate a 3-4 email cart abandonment recovery sequence with escalating urgency — from gentle reminder to final scarcity close using RMBC principles.
model: sonnet
user-invocable: true
---

# cart-abandonment-flow

## Purpose

Generate a cart abandonment email sequence (3-4 emails) that recovers lost sales from shoppers who added to cart but did not complete checkout. Cart abandoners are the highest-intent non-buyers in your funnel — they wanted the product enough to add it. Something stopped them: price doubt, distraction, shipping concern, or comparison shopping. Each email addresses a different recovery angle with escalating urgency. RMBC applies as objection architecture: Research identifies why they left, Mechanism reinforces why this product is the right choice, Brief escalates the urgency arc, Copy recovers the sale.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Name and brief description of the product left in cart |
| `price_point` | Yes | Product price — used for value framing and objection handling |
| `target_audience` | Yes | Who the shopper is — demographics, pain points, desires |
| `guarantee` | Yes | Money-back guarantee, return policy, or risk reversal offer |
| `shipping_info` | Yes | Shipping cost, free shipping threshold, or delivery timeline |
| `discount_offer` | No | Discount or incentive for completing purchase (e.g., 10% off, free gift) |
| `sequence_length` | No | Number of emails: 3 or 4 (default: 4) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Cart abandonment sequences invert typical RMBC — the prospect already wants the product. The job is removing friction, not building desire. Mechanism reinforces their original interest. Proof handles objections. CTA removes the final barrier.

### Step 2 — Map the Recovery Arc

| Email | Timing | Role | Approach |
|-------|--------|------|----------|
| 1 — Reminder | 1 hour | Gentle nudge — "You left something behind" | Helpful, not pushy. Show the product. Simple CTA to return to cart. |
| 2 — Social Proof | 24 hours | Build confidence — "Here's why others love it" | Testimonials, ratings, results. Address the unspoken "is it worth it?" |
| 3 — Objection Handling | 48 hours | Remove barriers — address price, shipping, quality | Name the top objection directly. Deploy guarantee. Answer FAQ. |
| 4 — Scarcity/Final Offer | 72 hours | Last chance — urgency + sweetener | Stock warning, discount (if applicable), deadline. Final CTA. |

For 3-email sequences: combine emails 2+3 (social proof + objection handling in one email).

### Step 3 — Identify the Abandonment Objections

Before writing, map the likely objections for this product and price point:

| Price Range | Primary Objection | Secondary Objection |
|-------------|-------------------|---------------------|
| Under $30 | "Do I really need this?" (impulse doubt) | Shipping cost exceeds perceived value |
| $30-$100 | "Is this the best option?" (comparison shopping) | "Can I find it cheaper elsewhere?" |
| $100-$300 | "Can I justify this expense?" (budget concern) | "What if it doesn't work for me?" |
| $300+ | "This is a big decision" (commitment anxiety) | "I need to think about it / ask someone" |

Email 3 must address the primary objection for the given price range directly.

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, appropriate to urgency level)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** — always links back to their cart with item(s) preserved

Rules:
- Email 1: NO discounts, NO urgency. Just a helpful reminder.
- Email 2: NO discounts. Let social proof do the work.
- Email 3: Deploy the guarantee prominently. Address objections by name.
- Email 4: Deploy discount (if provided) and scarcity. This is the last touch.
- Tone: empathetic throughout. They are not leads — they are almost-customers.
- Every email must show/reference the specific product they abandoned.
- Short and focused: cart emails compete with every other recovery email. Respect attention.

### Step 5 — Validate Recovery Coverage

Check that the sequence addresses:
1. Simple forgetfulness (email 1 — "you left this behind")
2. Social validation need (email 2 — "others love this")
3. Specific purchase objections (email 3 — named and resolved)
4. Decision urgency (email 4 — reason to act now, not later)

If any gap exists, revise.

## Output Format

```
## Cart Abandonment Flow: [Product Name]

**Product:** [product name] — $[price]
**Sequence Length:** [3-4] emails
**Send Schedule:** 1h → 24h → 48h → 72h
**Audience:** [target audience summary]
**Primary Objection:** [identified objection for this price point]

---

### Email 1: Reminder — 1 Hour

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body — gentle, helpful, product image reference]

[CTA: Return to cart]

---

### Email 2: [Role Label] — 24 Hours

[...continue for each email...]

---

## Recovery Strategy Notes

- **Primary objection:** [what stops this audience at this price point]
- **Guarantee placement:** Email [3] — [type of guarantee and how it's framed]
- **Discount strategy:** [if discount offered: which email, what %, why delayed]
- **Expected recovery rate:** [benchmark: 5-15% of abandoners for well-optimized flows]
- **Exit behavior:** Non-converters after email 4 → add to retargeting audience
```

## Quality Criteria

- Email 1 must be purely helpful — no urgency, no discount, no pressure
- Social proof in email 2 must be specific — star ratings, testimonial quotes, unit counts
- Email 3 must name the actual objection for the price point — not a vague "still thinking?"
- Guarantee must be prominently displayed — not buried in a PS line
- Discount (if used) must only appear in the final email — never reward early abandonment
- Every email must reference the specific product left in cart — not generic "items in your cart"
- Tone must be empathetic throughout — these are almost-customers, not cold leads
- CTAs must link back to the preserved cart, not to a product page

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` to reinforce why this product is uniquely effective
- Run `/email-promo` for promotional emails to non-abandoners
- Run `/post-purchase-sequence` for customers who convert from this flow
- Run `/guarantee-writer` for guarantee copy used in email 3
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
