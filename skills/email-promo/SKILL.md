---
name: email-promo
description: Generate RMBC-structured promotional email copy with A/B subject line variants — short-form, high-impact direct response emails.
model: sonnet
user-invocable: true
---

# email-promo

## Purpose

Generate promotional email copy structured around RMBC principles. Emails are short-form DR — every word must earn its place. The subject line is the hook (determines open rate), the preview text is the subhook (supports the open), and the body must drive a single click. This skill produces complete email copy including 3 subject line variants for A/B testing, preview text, body copy, CTA, and PS line. Output adapts to email type: launch, flash sale, cart recovery, or content-to-sale bridge.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `offer_details` | Yes | Price, discount, deadline, bonuses, or whatever makes this email worth sending now |
| `email_type` | Yes | One of: `launch`, `flash_sale`, `cart_recovery`, `content_to_sale` |
| `key_mechanism` | No | The product's unique mechanism (output from `/mechanism-ideation`) |
| `sender_voice` | No | One of: `founder`, `brand`, `expert`, `friend` (default: `founder`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Email applies RMBC in compressed form — Research drives subject line targeting, Mechanism is teased (not fully revealed — that's the landing page's job), Brief structures the email arc, Copy executes with economy.

### Step 2 — Define Email Structure by Type

| Type | Structure | Tone | Length |
|------|-----------|------|--------|
| Launch | Announcement → mechanism tease → offer → scarcity → CTA | Excitement + authority | 300-500 words |
| Flash Sale | Urgency → offer → proof → deadline → CTA | Direct + urgent | 200-350 words |
| Cart Recovery | Reminder → objection handling → guarantee → CTA | Empathetic + helpful | 150-250 words |
| Content-to-Sale | Value content → bridge → product mention → soft CTA | Educational + subtle | 400-600 words |

### Step 3 — Write Subject Lines (3 Variants)

Generate 3 subject lines for A/B testing:

| Variant | Strategy | Example Pattern |
|---------|----------|----------------|
| A | Curiosity | Open a loop — "The weird reason your [problem] won't go away" |
| B | Benefit-direct | State the outcome — "Get [result] in [timeframe]" |
| C | Pattern interrupt | Break inbox expectations — use a question, single word, or emoji |

Rules:
- Max 50 characters (mobile truncation)
- No ALL CAPS words
- No spam triggers (FREE!!!, Act Now, Limited Time)
- Each must work without preview text context

### Step 4 — Write Preview Text

- 40-90 characters
- Must complement (not repeat) the subject line
- Extends the curiosity loop or adds a proof point
- Appears in inbox preview on mobile — treat as a second headline

### Step 5 — Write Email Body

Structure for all types:
1. **Opening line (1-2 sentences)** — Hook that justifies the open. Deliver on the subject line promise immediately.
2. **Body (varies by type)** — Deploy the email-type structure from Step 2. One idea per paragraph. Short paragraphs (1-3 sentences max).
3. **CTA (1 clear link/button)** — One action. One link. Repeat it 2x in the email (mid-body and end).
4. **PS line** — The most-read line after the subject. Use it for: guarantee restatement, deadline reminder, or strongest proof point.

Formatting rules:
- Maximum 2 sentences per paragraph. At least 50% of paragraphs must be exactly 1 sentence. Single-sentence paragraphs create white space that guides the eye down the page on mobile — critical for scroll momentum through the email
- Line breaks between every paragraph
- Bold key phrases sparingly (1-2 per email)
- One link/CTA — never split attention across multiple offers
- No images in the copy output (images reduce deliverability in cold-ish lists)

### Step 6 — Write Sequence Context (if applicable)

If this email is part of a sequence, note:
- What email comes before this (what has the reader already seen?)
- What email comes after (what should this email set up?)
- Suggested send timing relative to previous email

## Output Format

```
## Promo Email: [Product/Offer Name]

**Email Type:** [launch | flash_sale | cart_recovery | content_to_sale]
**Sender Voice:** [founder | brand | expert | friend]
**Word Count:** ~XXX

---

### Subject Lines (A/B Test)

| Variant | Subject Line | Strategy |
|---------|-------------|----------|
| A | [subject] | Curiosity |
| B | [subject] | Benefit-direct |
| C | [subject] | Pattern interrupt |

**Preview Text:** [preview text]

---

### Email Body

**From:** [sender name/brand]

[Full email copy with line breaks between paragraphs]

[CTA BUTTON: Button text]

[Continued copy if needed]

[CTA LINK: Anchor text]

**PS —** [PS line]

---

## Testing Notes

- **Subject line test:** Send A vs B to 20% of list, winner to remaining 80%
- **Best send time for [email_type]:** [recommendation]
- **Sequence note:** [where this fits in a series, if applicable]
```

## Quality Criteria

- Subject lines must be under 50 characters and work on mobile inbox preview
- Preview text must not repeat the subject line
- Body must have only ONE call to action (one offer, one link destination)
- Opening line must deliver on the subject line's promise — no bait-and-switch
- PS line must be a standalone selling argument — many readers skip to PS first
- Email must scan well: short paragraphs, clear CTA, no walls of text
- Cart recovery emails must NOT hard-sell — empathy first, objection handling second

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/hook-battery` for subject line inspiration
- Run `/mechanism-ideation` for mechanism tease content
- Drive email clicks to pages built with `/lander-copy`
- Use `/lead-writer` for opening line variations
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
