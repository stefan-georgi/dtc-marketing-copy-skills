---
name: email-retention-sequences
description: Generate retention/nurture email sequences (5-7 emails) to reduce churn, reinforce purchase decisions, and increase customer lifetime value using RMBC principles.
model: sonnet
user-invocable: true
---

# email-retention-sequences

## Purpose

Generate a retention email sequence (5-7 emails) for existing customers that reduces churn and increases lifetime value. Unlike upsell sequences, retention emails are NOT about selling the next thing — they're about making the current purchase successful. The sequence reinforces the buying decision, delivers usage value, builds relationship, surfaces wins, and prevents cancellation before it starts. RMBC principles apply differently here: Research drives personalization, Mechanism explains how to get results, Brief structures the nurture arc, Copy executes with warmth over urgency.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | The product the customer owns — name and core promise |
| `target_audience` | Yes | Who the customer is — demographics, goals, experience level |
| `key_benefits` | Yes | Top 3-5 benefits the product delivers when used correctly |
| `subscription_model` | Yes | One of: `one-time` (prevent refunds, encourage repeat purchase) or `subscription` (prevent cancellation) |
| `sequence_length` | No | Number of emails: 5, 6, or 7 (default: 7) |
| `churn_triggers` | No | Known reasons customers leave — objections, confusion points, competitor pull |
| `send_timing` | No | Days between emails (default: Day 1, 3, 7, 14, 21, 30, 45) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Retention sequences invert the typical RMBC sales arc — instead of moving toward a purchase, they reinforce an existing one. Mechanism explains HOW to get results, not WHY to buy.

### Step 2 — Map the Retention Arc

| Email | Role | Emotional Need | Focus |
|-------|------|---------------|-------|
| 1 — Welcome/Onboard | Set expectations, quick win | Excited but unsure | Show them step 1 — reduce overwhelm |
| 2 — Quick Win | Deliver the fastest visible result | Needs early proof it works | One specific action → one specific result |
| 3 — Deeper Value | Teach an advanced use case or hidden feature | Curious, engaged | Mechanism: HOW the product works behind the scenes |
| 4 — Social Proof | Show other customers' wins | Needs validation | Stories of people like them succeeding |
| 5 — Objection Preempt | Address the #1 reason people quit | Doubt creeping in | Name the objection, resolve it directly |
| 6 — Milestone Check | Celebrate progress, survey for feedback | Wants acknowledgment | "You've been with us X days — here's what you've achieved" |
| 7 — Renewal/Advocacy | Reinforce commitment, invite community or referral | Loyal, ready to advocate | Subscription: renewal framing. One-time: referral or repeat |

For 5-email sequences: combine 2+3 and 5+6. For 6-email sequences: combine 5+6.

### Step 3 — Adapt for Subscription vs One-Time

**Subscription model adjustments:**
- Email 5 must address cancellation directly: "Thinking about canceling? Here's what you'd lose"
- Email 7 frames renewal: "Your next billing cycle starts [date] — here's what's coming"
- Urgency = loss aversion (what they lose), not scarcity

**One-time model adjustments:**
- Email 5 addresses buyer's remorse: "Was this the right choice? Let's look at the evidence"
- Email 7 frames repeat purchase or referral: "Know someone who needs this?"
- Urgency = results timeline (they need to USE the product to get value)

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, warm tone — not salesy)
- **Preview text** (40-90 characters)
- **Body copy** following the email's role from the arc
- **CTA** — always a value action (use the product, read a guide, reply with feedback), never a purchase CTA until email 7

Rules:
- Tone: helpful, warm, peer-to-peer. Not salesy. These people already bought.
- Short paragraphs: 1-3 sentences. Retention emails compete with inbox fatigue.
- Every email must give them a reason to USE the product — not just read the email.
- Personalization cues: reference their purchase, their timeline, their likely stage.

### Step 5 — Validate Anti-Churn Coverage

Check that the sequence addresses:
1. Early overwhelm (emails 1-2)
2. "Is this working?" doubt (emails 3-4)
3. Active cancellation consideration (email 5)
4. Relationship deepening (emails 6-7)

If any stage is missing, revise.

## Output Format

```
## Retention Sequence: [Product Name]

**Model:** [one-time | subscription]
**Sequence Length:** [5-7] emails
**Send Schedule:** [Day 1, 3, 7, ...]
**Audience:** [target audience summary]

---

### Email 1: [Role Label] — Day [X]

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body]

[Value CTA — action to take with the product]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Retention Strategy Notes

- **Churn window:** Highest risk at Day [X] — Email [Y] addresses this
- **Key objection handled:** Email [5] — [the specific objection]
- **Subscription/one-time adaptation:** [how email 7 differs by model]
- **Success metric:** [what to measure — open rate, product usage, reply rate, churn rate]
```

## Quality Criteria

- No selling in emails 1-6 — pure value delivery and relationship building
- Every email must include a specific action the customer can take with the product
- Subject lines must feel personal and warm — not promotional
- Email 5 must name the actual objection/cancellation reason — not a vague "still happy?"
- Social proof in email 4 must feature customers similar to the target audience
- Sequence must adapt clearly between subscription and one-time models
- Tone must be peer-to-peer throughout — never "Dear Valued Customer"

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/upsell-sequence-writer` AFTER retention sequence (ascend only after value is delivered)
- Run `/email-promo` for promotional emails to retained customers
- Run `/mechanism-ideation` to explain how the product works (feeds email 3)
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
