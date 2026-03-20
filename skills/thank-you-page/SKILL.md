---
name: thank-you-page
description: Generate RMBC-structured thank you / order confirmation page copy — the highest-converting upsell real estate where buyer trust peaks and post-purchase momentum drives action.
model: sonnet
user-invocable: true
---

# thank-you-page

## Purpose

Generate complete thank you / order confirmation page copy structured around RMBC principles. The thank you page is the most underused conversion asset in DTC funnels — the customer just bought, trust is at its absolute peak, and they're actively looking for confirmation they made the right decision. This page must do three things: confirm their purchase, set expectations, and (optionally) present one more offer while the buying window is wide open. Structure: order confirmation → "what happens next" → surprise bonus → upsell offer → social share prompt.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_purchased` | Yes | What the customer just bought — name, price, core promise |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, desires |
| `delivery_details` | Yes | What happens next — shipping timeline, digital access instructions, onboarding steps |
| `upsell_product` | No | Optional next offer — name, price, how it complements the purchase |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Thank you pages apply RMBC in post-purchase mode — Research validates what buyers need to hear after committing, Mechanism reinforces why their purchase decision was smart, Brief structures the page for both confirmation and conversion, Copy executes with warmth first, sell second.

### Step 2 — Map Post-Purchase Psychology

The buyer is in a unique emotional state. Map the psychology driving this page:

- **Validation hunger** — They just spent money and need confirmation it was smart
- **Peak trust** — Payment is complete; they have nothing left to fear from you
- **Consumption anxiety** — "Did I make the right choice? Will this actually work for me?"
- **Reciprocity window** — You delivered on the sale; they feel inclined to give back (share, review, buy more)
- **Attention spike** — They're actively reading this page, not passively scrolling

### Step 3 — Write the Thank You Page

#### Section 1: Order Confirmation (3-5 sentences)
- Confirm the order with specifics (product name, order number placeholder)
- Express genuine gratitude — not generic "thanks for your order"
- Reinforce the outcome they're about to experience
- Include a receipt summary block (product, price, order number, email confirmation note)

#### Section 2: What Happens Next (3-5 bullet points)
- Step-by-step: what they should expect and when
- For physical products: shipping timeline, tracking info, expected delivery
- For digital products: access instructions, login details, first-step guidance
- Set clear expectations to prevent support tickets and buyer's remorse

#### Section 3: Surprise Bonus (2-3 sentences)
- Introduce an unexpected bonus they didn't know about during checkout
- This could be: bonus content, extended guarantee, priority support, community access
- Frame it as a reward for being a customer — "Because you just joined..."
- This section builds goodwill before any upsell attempt

#### Section 4: Upsell Offer (if `upsell_product` provided)
- Transition: "One more thing before you go..."
- Connect the upsell directly to maximizing results from what they just bought
- Keep it to 3-5 sentences — they already bought; don't oversell
- Single CTA button: "Add [Product] To My Order"
- If no upsell_product provided, skip this section entirely

#### Section 5: Social Share Prompt (2-3 sentences)
- Ask them to share their purchase or excitement on social media
- Provide a pre-written share template they can copy
- Optional: incentive for sharing (discount code for next purchase, bonus content)

### Step 4 — Add Consumption Triggers

Include 1-2 elements that drive immediate product consumption:
- **Quick-start guide** — "Do this first" instruction (reduces refund rates)
- **Community link** — Facebook group, forum, or support channel
- **First milestone** — "Within 24 hours, you'll notice..." (sets expectations)

## Output Format

```
## Thank You Page: [Product Name]

**Product Purchased:** [name + price]
**Delivery Method:** [physical/digital]
**Upsell Included:** [yes/no]

---

### ORDER CONFIRMED

[3-5 sentences — confirmation + gratitude + outcome reinforcement]

**Order Summary:**
- Product: [name]
- Price: $XX
- Order #: [placeholder]
- Confirmation email sent to: [your email]

---

### WHAT HAPPENS NEXT

1. [Step 1 — immediate]
2. [Step 2 — within X hours/days]
3. [Step 3 — ongoing]

---

### YOUR BONUS

[2-3 sentences — surprise bonus reveal]

---

### [UPSELL SECTION — if applicable]

[3-5 sentences — complementary offer]

**[CTA BUTTON]:** "Add [Product] To My Order — Just $XX"

---

### SHARE THE LOVE

[2-3 sentences + pre-written share template]

---

## Quick Start

- **Do this first:** [immediate action]
- **Join the community:** [link placeholder]
- **Your first milestone:** [what to expect within 24 hours]
```

## Quality Criteria

- Order confirmation must include specific product details — never generic "your order is confirmed"
- "What happens next" must set concrete timelines — no vague "soon" or "shortly"
- Surprise bonus must be genuinely unexpected — not something already promised during checkout
- Upsell section (if present) must be shorter than the confirmation section — confirmation first, sell second
- Social share template must be pre-written and copy-pasteable — don't ask them to compose from scratch
- Quick-start section must include one immediately actionable step — not "wait for delivery"
- Page tone must be warm and celebratory — this is a relationship moment, not a transaction

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/upsell-script` for a dedicated upsell page (separate from thank-you page upsell section)
- Run `/post-purchase-sequence` for the email follow-up after this page
- Run `/funnel-architecture` to see where this page fits in the full funnel
- Run `/order-form-cro` for the checkout page that precedes this page
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
