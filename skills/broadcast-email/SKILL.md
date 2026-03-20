---
name: broadcast-email
description: Generate one-off broadcast emails for list engagement — content, story, controversy, case study, or flash promo types with 3 subject line options using RMBC principles.
model: sonnet
user-invocable: true
---

# broadcast-email

## Purpose

Generate standalone broadcast emails for ongoing list engagement. Unlike sequences, broadcasts are one-off sends that keep the list warm, build authority, and drive revenue between automated flows. Each broadcast type serves a different strategic purpose — content emails build trust, story emails build connection, controversy emails drive engagement, case studies build proof, and flash promos drive immediate revenue. This skill produces complete email copy with 3 subject line variants, preview text, body, CTA, and PS line.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `email_type` | Yes | One of: `content`, `story`, `controversy`, `case_study`, `flash_promo` |
| `topic` | Yes | The specific topic, story, hot take, case study, or promotion |
| `target_audience` | Yes | Who the reader is — demographics, pain points, desires |
| `product_mention` | No | Product to reference or link to (omit for pure engagement emails) |
| `brand_voice` | No | One of: `founder`, `expert`, `friend`, `provocateur` (default: `founder`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Broadcasts deploy RMBC in single-email format — Research drives topic relevance, Mechanism adds unique insight, Brief selects the angle, Copy executes with clarity and impact.

### Step 2 — Select Structure by Type

| Type | Structure | Tone | Length | CTA Style |
|------|-----------|------|--------|-----------|
| Content | Teach one thing → actionable takeaway → optional product bridge | Educational, generous | 400-600 words | Soft: "Try this today" or link to resource |
| Story | Scene → tension → resolution → lesson → bridge | Conversational, personal | 350-500 words | Soft: reply, share, or subtle product link |
| Controversy | Hot take → evidence → "here's what most people get wrong" → reframe | Bold, direct, opinionated | 300-500 words | Engagement: "Reply and tell me if I'm wrong" |
| Case Study | Situation → challenge → what they did → results → lesson | Proof-driven, specific | 400-600 words | Medium: "Want similar results? Here's how" |
| Flash Promo | Offer → reason why now → proof → scarcity → CTA | Urgent, direct | 200-350 words | Hard: "Buy now before midnight" |

### Step 3 — Write Subject Lines (3 Variants)

Generate 3 subject lines for A/B testing:

| Variant | Strategy | Best For |
|---------|----------|----------|
| A | Curiosity gap | Content, story, case study |
| B | Direct benefit or bold claim | Controversy, flash promo |
| C | Personal/conversational | Story, content |

Rules:
- Max 50 characters (mobile truncation)
- No ALL CAPS words or spam triggers
- Controversy subject lines should provoke without being offensive
- Flash promo subject lines can include one emoji if appropriate
- Each must work without preview text context

### Step 4 — Write Preview Text

- 40-90 characters
- Complements (not repeats) the subject line
- Extends the curiosity loop or adds a proof point
- Must work as a standalone teaser in mobile inbox

### Step 5 — Write Email Body

Structure per type:

**Content:**
1. Hook — why this topic matters right now (1-2 sentences)
2. One core insight — teach the idea with a specific example
3. Actionable takeaway — what the reader can do today
4. Bridge — optional: connect the insight to your product/service

**Story:**
1. Scene-setting — drop the reader into a moment (sensory details)
2. Tension — what went wrong or what was at stake
3. Resolution — what happened and what it revealed
4. Lesson — the universal takeaway
5. Bridge — optional: how this connects to what you offer

**Controversy:**
1. Hot take — state the contrarian position clearly in the first line
2. Evidence — why most people are wrong about this
3. Reframe — the correct way to think about it
4. Challenge — invite the reader to disagree or engage

**Case Study:**
1. Context — who the person/company is (relatable to audience)
2. Challenge — the specific problem they faced
3. Action — what they did (with enough detail to be credible)
4. Results — specific, measurable outcomes
5. Lesson — what the reader can learn from this

**Flash Promo:**
1. Offer — what it is, what they get, the discount/deal
2. Reason why — why this offer exists now (inventory, anniversary, mistake)
3. Proof — one strong proof point (testimonial, result, guarantee)
4. Scarcity — specific deadline or quantity limit
5. CTA — clear, urgent, repeated

Formatting rules:
- Short paragraphs: 1-3 sentences max
- Bold key phrases sparingly (1-2 per email)
- One primary CTA — do not split attention
- PS line: strongest proof point, deadline reminder, or engagement prompt

## Output Format

```
## Broadcast Email: [Topic]

**Type:** [content | story | controversy | case_study | flash_promo]
**Voice:** [founder | expert | friend | provocateur]
**Word Count:** ~XXX

---

### Subject Lines (A/B Test)

| Variant | Subject Line | Strategy |
|---------|-------------|----------|
| A | [subject] | [strategy] |
| B | [subject] | [strategy] |
| C | [subject] | [strategy] |

**Preview Text:** [preview text]

---

### Email Body

**From:** [sender name/brand]

[Full email copy]

[CTA]

**PS —** [PS line]

---

## Broadcast Notes

- **Best send day/time for [type]:** [recommendation]
- **Engagement metric to watch:** [open rate | reply rate | click rate | revenue]
- **Follow-up opportunity:** [what to send next based on engagement]
```

## Quality Criteria

- Subject lines must be under 50 characters and A/B testable
- Preview text must not repeat the subject line
- Content emails must deliver a genuine, actionable insight — not thinly veiled pitches
- Story emails must include specific sensory details — not generic anecdotes
- Controversy emails must take a real position — not a safe "both sides" hedge
- Case study results must be specific and measurable — not "they saw great results"
- Flash promo urgency must be real — name the deadline, quantity, or trigger
- PS line must work as a standalone selling argument
- Product mentions in non-promo types must feel natural, not forced

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/hook-battery` for subject line inspiration
- Run `/mechanism-ideation` for unique angles in content and controversy emails
- Run `/email-promo` for more structured promotional emails
- Run `/soap-opera-sequence` to expand a strong story broadcast into a full sequence
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
