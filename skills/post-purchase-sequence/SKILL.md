---
name: post-purchase-sequence
description: Generate a 4-5 email post-purchase sequence that reduces buyer's remorse, increases product usage, generates reviews, and sets up the next purchase using RMBC principles.
model: sonnet
user-invocable: true
---

# post-purchase-sequence

## Purpose

Generate a post-purchase email sequence (4-5 emails) that maximizes customer lifetime value by guiding buyers from order confirmation through product mastery to repeat purchase. The post-purchase window is the most underleveraged moment in email marketing — the buyer just trusted you with their money and attention is at peak. This sequence reduces refund rates, increases product usage (which drives results, which drives reviews), generates social proof, and primes the next sale. RMBC applies as value delivery architecture: Research identifies usage barriers, Mechanism explains how to get results, Brief structures the onboarding arc, Copy executes with support and warmth.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Name and core promise of the purchased product |
| `target_audience` | Yes | Who the buyer is — demographics, goals, experience level |
| `usage_instructions` | Yes | Key steps to use the product effectively — the "how to get results" guide |
| `complementary_products` | Yes | 1-3 products that pair with the purchase for cross-sell in final email |
| `sequence_length` | No | Number of emails: 4 or 5 (default: 5) |
| `review_platform` | No | Where to leave reviews — Amazon, Trustpilot, website, Google (default: `website`) |
| `delivery_timeline` | No | Expected shipping/delivery window (default: `3-5 business days`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Post-purchase sequences flip RMBC from persuasion to fulfillment — the sale is made, now the framework ensures the product delivers on its promise. Mechanism explains HOW to get results. Proof is generated (reviews), not deployed.

### Step 2 — Map the Post-Purchase Arc

| Email | Timing | Role | Focus |
|-------|--------|------|-------|
| 1 — Confirmation | Day 0 | Validate the purchase, set expectations | Order details, delivery timeline, what to expect, immediate quick win |
| 2 — Usage Tips | Day 3-5 | Teach them how to get results | Top 3 usage tips, common mistakes to avoid, "do this first" action |
| 3 — Results Check-In | Day 10-14 | Ask how it's going, provide support | Check on their experience, offer help, deepen engagement |
| 4 — Review Request | Day 21-30 | Ask for a review at peak satisfaction | Specific review prompt, make it easy (direct link), show gratitude |
| 5 — Cross-Sell | Day 30-45 | Introduce complementary product | "Based on your purchase, you might also like..." — value-first bridge |

For 4-email sequences: combine emails 3+4 (check-in + review request in one email).

### Step 3 — Calibrate Tone by Phase

| Phase | Emails | Tone | What to Avoid |
|-------|--------|------|---------------|
| Onboarding | 1-2 | Supportive, excited, educational | Selling anything — they just bought |
| Engagement | 3 | Curious, caring, helpful | Pushy follow-up — this is a check-in, not a sales call |
| Proof Generation | 4 | Grateful, specific, easy | Generic "leave a review" — give them a prompt |
| Ascension | 5 | Helpful, relevant, low-pressure | Hard sell — frame as "customers who bought X also loved Y" |

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, warm and non-promotional)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** appropriate to the email's purpose (value action, not purchase — until email 5)

Rules:
- Email 1: Confirm the order, reduce anxiety, deliver one immediate value piece (tip, guide, video).
- Email 2: Practical and actionable — numbered tips, common mistakes, "do this first" guidance.
- Email 3: Genuine check-in — ask how it's going, offer support channels, provide advanced tips.
- Email 4: Make the review request specific — "What result have you noticed?" not "Leave a review."
- Email 5: Cross-sell as recommendation — "Customers who got results with X found that Y accelerated..." — not a cold pitch.
- No selling in emails 1-4. The cross-sell in email 5 must feel earned by the value delivered in 1-4.
- Tone throughout: peer-to-peer, supportive. Never "Dear Valued Customer."

### Step 5 — Validate Post-Purchase Coverage

Check that the sequence addresses:
1. Buyer's remorse prevention (email 1 — immediate value + confirmation)
2. Product usage education (email 2 — they know HOW to succeed)
3. Engagement deepening (email 3 — they feel supported, not abandoned)
4. Social proof generation (email 4 — review captured at peak satisfaction)
5. Revenue expansion (email 5 — cross-sell at natural timing)

If any stage is missing, revise.

## Output Format

```
## Post-Purchase Sequence: [Product Name]

**Sequence Length:** [4-5] emails
**Send Schedule:** Day 0, 3, 14, 25, 35
**Audience:** [target audience summary]
**Review Platform:** [where to leave reviews]

---

### Email 1: Order Confirmation — Day 0

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body — confirmation, expectations, immediate value]

[CTA — value action: read the guide, watch the video, do step 1]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Post-Purchase Strategy Notes

- **Buyer's remorse window:** Day 0-3 — Emails 1-2 address this
- **Peak satisfaction timing:** Day [X] — Review request timed here
- **Cross-sell bridge:** [how email 5 connects the original purchase to the recommendation]
- **Support escalation:** Email 3 offers [support channel] for customers with issues
- **Success metrics:** [refund rate reduction, review count, cross-sell conversion, repeat purchase rate]
```

## Quality Criteria

- Email 1 must confirm the order AND deliver immediate value — not just a receipt
- Usage tips in email 2 must be specific and actionable — numbered steps, not vague advice
- Check-in email must feel genuine — not a scripted "How are you?" that leads to a pitch
- Review request must include a specific prompt — "What's the first result you noticed?" not "Leave a review"
- Cross-sell must connect logically to the original purchase — not a random product push
- No selling in emails 1-4 — pure value delivery, support, and relationship building
- Tone must be warm and supportive throughout — these people trusted you with money
- Review link must go directly to the review form — minimize friction

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/email-retention-sequences` for subscription products needing ongoing retention
- Run `/upsell-sequence-writer` for higher-ticket ascension after this sequence
- Run `/email-promo` for standalone promotions to existing customers
- Run `/mechanism-ideation` to explain how the product works (feeds email 2)
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
