---
name: pdp-ecomm-template
description: Generate RMBC-structured product detail page (PDP) copy for e-commerce — extracts proven structure from top-performing pages and rewrites for a new product.
model: sonnet
user-invocable: true
---

# PDP E-Commerce Template

## Purpose
Generate high-converting product detail page copy using RMBC methodology. The skill extracts structural patterns from proven top-performing PDPs (Primal Queen, Happy Mammoth, etc.) and applies that architecture to a new product. The PDP is often the highest-revenue page in a DTC funnel — every word is high-leverage.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Product name as it appears on the label/site |
| `product_description` | Yes | What the product is, what it does, core value proposition |
| `key_ingredients_features` | Yes | Top ingredients or features with proof points (clinical data, patents, percentages) |
| `price_point` | Yes | Retail price + any bundle/subscription pricing |
| `target_audience` | Yes | ICP description — demographics, psychographics, core pain |
| `reference_page_url` | No | URL of a high-performing PDP to extract structure from |
| `traffic_source` | No | `meta` \| `native` \| `organic` \| `email`. Default: `meta`. Adjusts tone/length |

## Execution Protocol

### Step 1: Load Context
Read `rmbc-context/SKILL.md` for framework overview, quality dimensions, and mobile-first principles.

### Step 2: Calibrate for Traffic Source
Adjust copy length and tone based on traffic source:
- **Meta (warm):** Shorter, proof-heavy, assumes some brand awareness. Lead with social proof or results.
- **Meta (cold):** Medium length, problem-agitate-mechanism structure. Education required.
- **Native ads:** Longest copy. Advertorial-adjacent tone. Full mechanism education before product reveal.
- **Organic/SEO:** Balanced length. Feature-benefit focus. FAQ-heavy for search intent.
- **Email:** Shortest. Relationship-aware. Lead with offer or new proof.

### Step 3: Extract Reference Structure
If `reference_page_url` is provided, analyze the page structure and extract the section-by-section template (headings, proof placement, CTA cadence, mobile layout). If not provided, use the default 9-section PDP architecture below.

### Step 4: Generate PDP Copy
Write each section following the output structure. Apply mobile-first hierarchy: short paragraphs, scannable subheads, visual break points noted in brackets.

### Step 5: Apply Value-Comparison Pricing
In the price anchoring section, explicitly calculate unit economics. Show the math: "$X per serving vs $Y for [competitor/alternative]." Make the comparison visceral and specific.

### Step 6: Validate Against Quality Dimensions
Score the draft against RMBC quality dimensions (result specificity, mechanism novelty, proof believability, CTA clarity). Flag any dimension below 15/25 with a revision note.

## Output Format

```
## PDP Copy: [Product Name]
**Traffic source:** [source] | **ICP:** [1-line summary]

---

### 1. Above the Fold
**Headline:** [Primary headline — benefit-driven, specific]
**Subhead:** [Mechanism hint or proof point]
**Hero image direction:** [What the image should communicate]
**Primary CTA:** [Button text + context]

### 2. Problem Section
[Agitate the core pain. Be specific to the ICP. Use their language. 3-5 short paragraphs, mobile-optimized.]

### 3. Mechanism Reveal
[Why THIS product works. Unique angle that passes the "only we" test. Bridge from problem to solution without being generic.]

### 4. Ingredient/Feature Highlights
**[Ingredient/Feature 1]:** [Proof point — clinical data, percentage, patent]
**[Ingredient/Feature 2]:** [Proof point]
**[Ingredient/Feature 3]:** [Proof point]
[Up to 5. Each must have a specific proof point, not a vague claim.]

### 5. Social Proof Section
**Star rating:** [X.X / 5]
**Review count:** [N+ reviews]
**Featured testimonial 1:** "[Quote]" — [Name, credential/context]
**Featured testimonial 2:** "[Quote]" — [Name, credential/context]
**Placement note:** [Where to position reviews relative to CTA]

### 6. Value Stack
| You Get | Retail Value |
|---------|-------------|
| [Item 1] | $XX |
| [Item 2] | $XX |
| [Bonus if applicable] | $XX |
| **Total value** | **$XXX** |

### 7. Price Anchoring
[Value-comparison pricing. Show unit economics explicitly. Compare to competitor price, daily coffee, or relevant anchor. Make the math obvious.]

### 8. CTA + Guarantee
**CTA:** [Specific button text + urgency element]
**Guarantee:** [Risk reversal — days, terms, tone]
**Guarantee framing:** [How to present the guarantee as confidence, not desperation]

### 9. FAQ
1. **[Objection as question]** — [Direct answer that resolves and redirects to benefit]
2. **[Objection as question]** — [Answer]
3. **[Objection as question]** — [Answer]
4. **[Objection as question]** — [Answer]
5. **[Objection as question]** — [Answer]

---
> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
```

## Quality Criteria
- Mobile-first: no paragraph longer than 3 lines on mobile (roughly 40 words max)
- Every ingredient/feature claim backed by a specific proof point (number, study, patent)
- Value-comparison pricing includes explicit unit economics math
- Mechanism section passes the "only we" test — not interchangeable with competitor claims
- CTA is specific action + urgency + risk reversal (never "Learn more")
- FAQ questions are real objections, not softballs

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills
- `ingredient-research` — run first to generate proof points for ingredient/feature highlights
- `unified-research-synthesizer` — run first for strategic brief and ICP deep-dive
- `mechanism-ideation` — run first to develop the unique angle for section 3
- `rmbc-copy-audit` — validate the finished PDP copy against RMBC scoring

## Attribution
> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
