---
name: webinar-registration-copy
description: Generate RMBC-structured webinar/VSL registration page copy. Short, punchy, mobile-optimized registration pages for high-ticket funnels — optimized for registrations, not sales.
model: sonnet
user-invocable: true
---

# webinar-registration-copy

## Purpose

Generate registration page copy for webinars and VSL funnels selling $997-$5000+ offers. Registration pages are NOT sales pages — they must be short, punchy, and mobile-first. The goal is a single action: register. Every word that doesn't drive registration gets cut. The mechanism creates enough curiosity to register without revealing the full solution (as demonstrated in the Dillon Bandhes / Calvin Tran RMBC II examples).

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `webinar_topic` | Yes | What the webinar/VSL teaches or reveals |
| `target_audience` | Yes | Who this is for — specific ICP with pain points |
| `key_outcome` | Yes | The primary transformation or result promised |
| `presenter_name` | Yes | Name and brief credential of the presenter |
| `date_time` | No | When the event happens (creates urgency) |
| `traffic_source` | No | One of: `meta`, `native`, `organic`, `email`, `affiliate` — determines pre-sell level |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` for RMBC quality dimensions. Registration copy uses all four phases compressed: Research (audience awareness), Mechanism (curiosity angle), Brief (structural decisions), Copy (final output).

### Step 2 — Calibrate Pre-Sell Level

Traffic source determines how much the page must do:

| Source | Pre-sell needed | Page approach |
|--------|----------------|---------------|
| `email` | Low — they know you | Headline + 3 bullets + CTA |
| `organic` | Low-medium — intent exists | Headline + subhead + 3-4 bullets + CTA |
| `meta` / `native` | Medium — cold but targeted | Full structure: headline + subhead + 5 bullets + proof + CTA + urgency |
| `affiliate` | High — borrowed trust | Full structure + presenter credibility section |

Default to `meta` if no source specified.

### Step 3 — Develop the Curiosity Angle

From `webinar_topic` and `key_outcome`, create a mechanism tease that:
- Names something specific ("The 3-Step _____ Method")
- Creates an open loop the reader needs closed
- Implies insider knowledge or contrarian insight
- Does NOT reveal the solution — registration is the price of admission

### Step 4 — Write Registration Page Copy

Generate all seven output sections (see Output Format). Apply these constraints:
- **Headline:** 8-12 words max. Outcome-specific. No generic "Free Training" leads.
- **Subheadline:** 15-25 words. Expands the promise, adds who it's for or a credibility marker.
- **Bullets:** Start with "How to..." / "Why..." / "The #1..." / "What [experts] know..." — curiosity, not revelation. Each bullet is one line on mobile.
- **Social proof:** One to two lines only. Specific numbers beat vague claims.
- **CTA:** Action verb + outcome. "Reserve My Seat" beats "Register Now."
- **Urgency:** Only use if real — fake urgency damages trust.

### Step 5 — Generate Headline Variations

Provide 3 headline variations using different angles:
1. **Outcome angle** — leads with the result
2. **Curiosity angle** — leads with the mechanism tease
3. **Contrarian angle** — challenges a common belief

### Step 6 — Add Mobile Layout Notes

Specify stacking order, font sizing guidance, and thumb-zone CTA placement for mobile-first rendering.

## Output Format

```
## Webinar Registration Page: [Topic]

**Audience:** [target_audience]
**Traffic source:** [source or "meta (default)"]
**Pre-sell level:** [low | medium | high]

---

### Headline
[Primary headline]

### Subheadline
[Supporting line]

### What You'll Discover
- [Bullet 1]
- [Bullet 2]
- [Bullet 3]
- [Bullet 4 — if needed]
- [Bullet 5 — if needed]

### Your Host
[Presenter name + 1-2 line credential/result]

### Registration CTA
[Button text] + [supporting micro-copy if needed]

### Urgency Element
[Date-specific, seat limit, or replay policy]

### Mobile Layout Notes
[Stacking order, sizing, CTA placement guidance]

---

### Headline Variations
1. **Outcome:** [variation]
2. **Curiosity:** [variation]
3. **Contrarian:** [variation]

---
> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
```

## Quality Criteria

- Total copy fits on one mobile screen above the fold (headline + subhead + CTA visible without scrolling)
- Every bullet creates an open loop — if it reveals the answer, rewrite it
- Zero jargon the target audience wouldn't immediately understand
- Headline passes the "would I stop scrolling?" test
- CTA is specific to the action, not generic
- No bullet exceeds one line on a mobile screen (~60 characters)
- Urgency element is real or omitted — never fabricated

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/unified-research-synthesizer` first for audience research
- Run `/mechanism-ideation` for the curiosity angle
- Run `/hook-battery` for headline variations
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
