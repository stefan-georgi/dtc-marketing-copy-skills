---
name: advertorial-writer
description: Generate RMBC-structured advertorial and native ad copy that reads like editorial content but drives direct response conversions.
model: sonnet
user-invocable: true
---

# advertorial-writer

## Purpose

Generate advertorial copy that looks and feels like editorial content but sells. Advertorials are the bridge between paid traffic and a sales page — the prospect clicks an ad, lands on what looks like a news article or blog post, and by the end they're ready to buy. The key tension: it must feel editorial (not salesy) while still deploying RMBC persuasion structure. Traffic source context matters — native ad platforms (Taboola, Outbrain) have different compliance and style requirements than social traffic.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `angle` | Yes | The editorial angle — the "news peg" or story that frames the product (e.g., "new study reveals...", "local mom discovers...") |
| `traffic_source` | Yes | One of: `native` (Taboola/Outbrain), `facebook`, `google`, `email`, `organic` |
| `key_mechanism` | No | The product's unique mechanism (output from `/mechanism-ideation`) |
| `tone` | No | One of: `news`, `personal_story`, `investigative`, `listicle` (default: `personal_story`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Advertorials deploy RMBC through an editorial lens — the Research phase becomes "reporting," the Mechanism becomes the "discovery," and the Brief structures the narrative arc.

### Step 2 — Select Advertorial Format

Based on `tone` input:

| Format | Structure | Best For |
|--------|-----------|----------|
| News | Headline → dateline → discovery → expert quotes → mechanism → product mention → CTA | Health, finance, tech |
| Personal Story | "I" narrative → problem → failed attempts → discovery → results → recommendation | Weight loss, beauty, self-improvement |
| Investigative | Question headline → industry exposé → hidden truth → mechanism → solution → CTA | Supplements, skincare, finance |
| Listicle | Number headline → tips/facts → mechanism woven in → product as #1 solution → CTA | Broad audiences, social traffic |

### Step 3 — Write the Advertorial

Structure (all formats):

1. **Headline** — Must look editorial, not like an ad. Include the angle. No price, no "buy now."
2. **Byline + Date** — Author name, publication-style date. Adds credibility.
3. **Lead (100-150 words)** — Open with the angle. Story, stat, or news hook. No product mention yet.
4. **Problem Section (150-200 words)** — Establish the problem through the editorial lens. Use data, quotes, or story details.
5. **Failed Solutions (100-150 words)** — Why conventional approaches fall short. Builds frustration.
6. **Mechanism Reveal (200-300 words)** — The "discovery" — present the mechanism as news, not as a sales pitch. Use expert language, study references, analogies.
7. **Product Introduction (100-150 words)** — Natural transition from mechanism to product. "One company has figured out how to..."
8. **Social Proof (150-200 words)** — Testimonials framed as interviews or case studies. Editorial voice. Include 2-3 blockquoted pull-quotes positioned at section breaks throughout the advertorial (not just in this section). Each pull-quote must be a concrete, quotable claim with a specific number, specific result, or named source. Format as editorial callouts that readers scanning the page will see. These serve as proof anchors at decision points — a reader who skims should encounter at least 2 pull-quotes with hard data before reaching the CTA.
9. **CTA Section (100-150 words)** — Soft sell. "Learn more" framing, not "Buy Now." Include link placement.

**Section transition rule:** Every section (1-8) must end with a forward-looking sentence that makes the next section feel required reading. Use one of: (a) a question the next section answers, (b) a partial revelation completed in the next section, (c) a contrast statement ("But that's only half the story..."). The reader must never reach a natural stopping point mid-article. The transition should feel editorial, not salesy — it's a journalist pulling the reader forward, not a marketer creating urgency.

### Step 4 — Compliance Check

Verify against traffic source requirements:
- **Native:** No before/after claims, no income claims, disclaimer required
- **Facebook:** No personal attributes ("Are you overweight?"), no exaggerated claims
- **Google:** No superlatives without substantiation, landing page must match ad
- **Email/Organic:** More latitude, but maintain editorial voice

Flag any lines that may trigger platform rejection.

## Output Format

```
## Advertorial: [Headline]

**Angle:** [editorial angle]
**Format:** [news | personal_story | investigative | listicle]
**Traffic Source:** [platform]
**Word Count:** ~X,XXX

---

**[Byline]** | [Date]

[Full advertorial copy with section markers]

---

## Compliance Notes

- [Any flagged lines or platform-specific concerns]
- [Suggested disclaimer text if needed]

## A/B Test Variants

### Headline Variant A
[Original headline]

### Headline Variant B
[Alternative headline — different angle or hook type]

### Lead Variant
[Alternative opening paragraph]
```

## Quality Criteria

- Must read like real editorial content — if it obviously reads as an ad, it fails
- No product mention in the first 30% of copy
- Mechanism section must educate, not pitch
- CTA must feel like a natural next step, not a hard close
- Headline must work as a native ad thumbnail — curiosity-driven, not salesy
- Social proof must be framed editorially (interviews, case studies) not as testimonial blocks

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` to develop the mechanism "discovery"
- Run `/hook-battery` for headline and angle options
- Run `/unified-research-synthesizer` for audience language and data points
- Feed advertorial traffic to landing pages built with `/lander-copy`
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
