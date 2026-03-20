---
name: fb-ad-copy
description: Generate RMBC-structured Facebook/Meta ad copy across single image, carousel, and video formats — 3 hook variations per format with character limits enforced.
model: sonnet
user-invocable: true
---

# fb-ad-copy

## Purpose

Generate direct response ad copy for Facebook/Meta campaigns using the RMBC framework. Each output delivers 3 variations (different hooks) for the chosen format — single image, carousel, or video script. Every variation includes primary text, headline, description, and CTA button recommendation with platform character limits enforced.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, awareness level |
| `ad_format` | Yes | One of: `single_image`, `carousel`, `video` |
| `key_mechanism` | Yes | The product's unique mechanism (output from `/mechanism-ideation`) |
| `offer` | Yes | What the prospect gets — price, discount, bonus, guarantee |
| `tone` | No | One of: `aggressive`, `conversational`, `professional`. Default: `conversational` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Facebook ads compress the full RMBC arc into tight space — the hook carries Research (pain/desire), the body reveals Mechanism, proof stacks in mid-copy, and the CTA closes.

### Step 2 — Map Awareness to Copy Length

| Awareness Level | Primary Text Approach |
|----------------|----------------------|
| Unaware | Story/curiosity lead, longer primary text, educate before mechanism |
| Problem-aware | Lead with pain, mechanism as solution, proof to close |
| Solution-aware | Lead with mechanism differentiation, proof-heavy, direct CTA |
| Product-aware | Lead with offer, social proof, urgency |
| Most aware | Lead with new offer/angle, minimal education needed |

### Step 3 — Generate 3 Variations

Each variation uses a different hook type (e.g., curiosity, fear, desire, social proof, contrarian). No two variations should use the same hook type.

#### Character Limits (enforced)

| Element | Visible Limit | Max Limit | Notes |
|---------|--------------|-----------|-------|
| Primary text | 125 chars | 2,200 chars | First 125 visible before "See more" |
| Headline | 40 chars | 255 chars | First 40 visible in feed |
| Description | 30 chars | 255 chars | May not display on all placements |

The first 125 characters of primary text MUST work as a standalone hook — assume most users never click "See more." Structure the first 125 characters as a 3-part pattern: (1) specific stat or contradiction (≤50 chars), (2) mechanism tease or knowledge gap (≤50 chars), (3) implicit promise that rewards reading past "See more" (≤25 chars). Example: "327 patients stopped taking glucosamine. | Their joints got better, not worse. | Here's why →"

#### Format-Specific Requirements

**Single Image:**
- Primary text: Hook + mechanism + proof + CTA (aim for 3-5 short paragraphs)
- Image direction: 1 sentence describing what the static image should convey

**Carousel:**
- Card count: 3-5 cards
- Each card: headline (40 chars) + description (30 chars)
- Card 1: Hook/problem. Card 2-3: Mechanism/proof. Final card: CTA/offer
- Primary text above carousel: condensed hook + mechanism + CTA

**Video:**
- Script outline: Hook (0-3s), problem (3-10s), mechanism (10-25s), proof (25-40s), CTA (40-60s)
- Primary text: Hook + offer summary (viewers may read this instead of watching)
- First 3 seconds must deliver the hook visually and verbally

### Step 4 — CTA Button Recommendation

Select from Meta's CTA options: `Shop Now`, `Learn More`, `Sign Up`, `Get Offer`, `Book Now`, `Contact Us`, `Subscribe`, `Order Now`. Choose based on awareness level and offer type.

### Step 5 — Attach Attribution

## Output Format

```
## Facebook Ad Copy: [Product Name]

**Format:** [single_image | carousel | video]
**Audience:** [target audience summary]
**Awareness Level:** [detected level]
**Offer:** [offer summary]

---

### Variation 1: [Hook Type]

**Primary Text:**
[Full primary text — first 125 chars marked with ||]

**Headline:** [40 chars max]
**Description:** [30 chars max]
**CTA Button:** [Meta CTA option]
[Format-specific elements: image direction / card breakdowns / video script]

---

### Variation 2: [Hook Type]
[Same structure]

---

### Variation 3: [Hook Type]
[Same structure]

---

## Testing Recommendation

| Priority | Variation | Hook Type | Why Test First |
|----------|-----------|-----------|---------------|
| 1 | [#] | [type] | [reasoning] |
| 2 | [#] | [type] | [reasoning] |
| 3 | [#] | [type] | [reasoning] |
```

## Quality Criteria

- First 125 characters of every primary text must stand alone as a compelling hook
- Headline stays under 40 characters — no truncation allowed
- Each variation uses a different hook type — no duplication
- Mechanism is present in every variation, not just features
- CTA is specific with a reason to act now — never "Learn More" without justification
- Carousel cards tell a sequential story — not disconnected slides
- Video scripts have a visual hook in the first 3 seconds

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` first to develop the core mechanism (required input)
- Run `/ad-angle-generator` for strategic angle direction before writing ad copy
- Run `/hook-battery` to generate hook candidates to test across variations
- Validate finished ads with `/ad-creative-audit`
- Build UGC-style video ads with `/ugc-brief`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
