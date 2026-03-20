---
name: upsell-sequence-writer
description: Generate post-purchase email upsell sequences (3-5 emails) that ascend customers from initial purchase to higher-ticket offers using RMBC-structured persuasion.
model: sonnet
user-invocable: true
---

# upsell-sequence-writer

## Purpose

Generate a post-purchase email sequence (3-5 emails) that ascends customers from their initial purchase to a higher-ticket complementary offer. These emails deploy after the buyer has already said yes — trust is established, the product is in hand (or arriving), and the window for ascension is open. Each email must deliver genuine value before bridging to the upsell. The sequence arc moves from gratitude through value delivery to the offer, with urgency closing the window. Every email uses RMBC principles compressed into short-form format.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `initial_product` | Yes | What the customer already purchased — name, price, core promise |
| `upsell_product` | Yes | The higher-ticket offer — name, price, what it does, how it complements the initial purchase |
| `upsell_price` | Yes | Price of the upsell with any discount framing |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, desires, sophistication level |
| `sequence_length` | No | Number of emails: 3, 4, or 5 (default: 5) |
| `key_mechanism` | No | The upsell product's unique mechanism (output from `/mechanism-ideation`) |
| `send_timing` | No | Days between emails (default: Day 1, 3, 5, 7, 9) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Upsell sequences deploy RMBC across multiple touchpoints — Research informs the value content, Mechanism justifies the upsell, Brief structures the sequence arc, Copy executes each email.

### Step 2 — Define the Sequence Arc

Map the emotional journey across the sequence:

| Email | Role | Emotional State | RMBC Focus |
|-------|------|----------------|------------|
| 1 — Thank You | Validate purchase, deliver quick win | Excited, hopeful | Research (reinforce their decision) |
| 2 — Value Delivery | Teach something useful related to their purchase | Engaged, learning | Research → Mechanism tease |
| 3 — Bridge | Connect initial product's limitation to upsell need | Curious, aware of gap | Mechanism reveal |
| 4 — Offer | Present the upsell with full value stack | Desire, trust | Brief → Copy (full pitch) |
| 5 — Urgency Close | Final window, scarcity, guarantee restatement | Fear of missing out | Copy (close) |

For 3-email sequences: combine emails 1+2, 3+4, and keep 5. For 4-email sequences: combine emails 1+2 and keep 3, 4, 5.

### Step 3 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, mobile-optimized)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** appropriate to the email's position (soft early, hard late)

Rules per email position:
- **Emails 1-2:** No selling. Pure value delivery. Build goodwill.
- **Email 3:** Bridge only. Reveal the gap, tease the solution. Soft CTA at most.
- **Email 4:** Full offer with mechanism, value stack, price anchoring, guarantee.
- **Email 5:** Urgency, deadline, guarantee restatement, final CTA. Short and direct.

### Step 4 — Validate Sequence Coherence

Read all emails in order. Check:
1. Does each email build on the previous? No redundant points.
2. Does the value-to-pitch ratio feel earned? (At least 2 value emails before the offer)
3. Does the urgency in the final email feel real? (Deadline, limited quantity, or price increase)
4. Could a reader skip to email 4 and still understand the offer? (It must standalone too)

## Output Format

```
## Upsell Sequence: [Initial Product] → [Upsell Product]

**Sequence Length:** [3-5] emails
**Send Schedule:** [Day 1, Day 3, Day 5, ...]
**Audience:** [target audience summary]

---

### Email 1: [Role Label] — Day [X]

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body]

[CTA or sign-off appropriate to position]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Sequence Strategy Notes

- **Value-to-pitch ratio:** [X value emails : Y pitch emails]
- **Mechanism reveal timing:** Email [X] — [why this timing]
- **Urgency type:** [deadline | limited quantity | price increase | bonus expiration]
- **Standalone test:** Email [4] works as a standalone pitch: [yes/no + why]
```

## Quality Criteria

- First 1-2 emails must deliver genuine value — no selling, no "by the way" pitches
- Each email must have a clear single purpose aligned to its arc position
- Subject lines must be under 50 characters and work on mobile
- The bridge email (3) must make the upsell feel like a logical next step, not a random offer
- Offer email (4) must work as a standalone pitch if read in isolation
- Urgency in final email must be real — name the specific deadline, quantity, or trigger
- Sequence must feel like a relationship, not a drip campaign of pitches

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` for the upsell product's mechanism
- Run `/upsell-script` for the immediate post-purchase OTO page (before this sequence)
- Run `/email-promo` for standalone promotional emails outside a sequence
- Run `/hook-battery` for subject line inspiration
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
