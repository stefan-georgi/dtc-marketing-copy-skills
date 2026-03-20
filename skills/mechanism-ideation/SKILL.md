---
name: mechanism-ideation
description: Ideate novel mechanism angles for a product claim or result — the "M" in RMBC. Use when you need unique, specific explanations of WHY a product delivers its promised outcome. Branches for supplements, e-commerce, and info products.
model: sonnet
user-invocable: true
---

# mechanism-ideation

## Purpose

Generate 5-7 novel mechanism angles for a product's core claim. A mechanism is the unique, specific explanation of WHY a product delivers its result — not "it works" but "because of [specific thing no competitor can claim]." This is Stefan Georgi's "Copy Thinking" — strategic ideation before a single word of copy is written. The mechanism is what separates winning copy from generic copy.

A strong mechanism is:
- **Novel** — the reader thinks "I've never heard of that before"
- **Specific** — names a compound, process, framework, or system
- **Believable** — grounded in real product attributes or research
- **Ownable** — passes the "only we" test (no competitor can claim it)

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key ingredients/features/components |
| `product_category` | Yes | One of: `supplement`, `ecommerce`, `info_product` |
| `target_claim` | No | The specific result or transformation the mechanism must explain |
| `research_context` | No | Prior research output (ingredient data, competitor analysis, ICP insights) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` for framework overview and quality dimensions. The mechanism phase requires a novel explanation that passes the "only we" test.

### Step 2 — Extract Raw Material

From `product_description` and `research_context`, identify:
- **Differentiators** — What does this product have that competitors don't?
- **Process uniqueness** — How is it made, formulated, delivered, or structured differently?
- **Proof anchors** — What clinical data, patents, case studies, or results exist?
- **Naming opportunities** — What can be branded, coined, or reframed?

### Step 3 — Branch by Category

#### Supplements
Focus on ingredient-based mechanisms:
- Unique compounds or proprietary blends
- Delivery systems (liposomal, time-release, nano-emulsion)
- Synergistic combinations ("X amplifies Y by Z%")
- Bioavailability advantages (absorption rates, clinical comparisons)
- Dosage differentiation (therapeutic dose vs competitor underdosing)
- Origin/sourcing story (high-altitude, wild-harvested, patented extraction)

#### E-commerce
Focus on product design and manufacturing mechanisms:
- Material innovation (proprietary fabric, alloy, compound)
- Manufacturing process (hand-finished, 47-step quality check, zero-waste)
- Structural engineering (patented hinge, load distribution, airflow system)
- Sourcing story (single-origin, direct-from-artisan, traceable supply chain)
- Design methodology (tested with 500 users, 3 years R&D, biomechanics lab)
- Performance metric (lasts 3x longer, 40% lighter, withstands 10,000 cycles)

#### Info Products
Focus on methodology and framework mechanisms:
- Proprietary framework (named system, unique sequencing, contrarian model)
- Elimination angle ("removes the one thing that blocks X")
- Speed/compression mechanism ("condenses 10 years into 90 days because...")
- Counter-intuitive principle ("works by doing the opposite of conventional advice")
- Stacking/layering system ("3 phases that compound — each unlocks the next")
- Credential transfer ("developed from [specific experience] that no course covers")

### Step 4 — Generate Mechanism Ideas

For each of the 5-7 mechanisms, develop:

1. **Mechanism name** — A coined or branded term (e.g., "Tri-Phase Absorption Complex," "The Reverse Funnel Method")
2. **One-line explanation** — What it is in plain language
3. **Why it works** — The causal logic (2-3 sentences)
4. **Proof anchor** — What evidence supports this mechanism
5. **Novelty score** — 1-5 (1 = commonly claimed, 5 = never seen before)
6. **Specificity rating** — 1-5 (1 = vague, 5 = precise and concrete)
7. **Believability check** — HIGH / MEDIUM / LOW with one-line rationale

### Step 5 — Rank and Recommend

Rank mechanisms by combined score (novelty + specificity). Flag any with LOW believability — these need additional research before use. Recommend the top 2-3 for copy development.

## Output Format

```
## Mechanism Ideation: [Product Name]

**Category:** [supplement | ecommerce | info_product]
**Target claim:** [what the mechanism must explain]

---

### 1. [Mechanism Name]

**What it is:** [one-line explanation]

**Why it works:** [2-3 sentence causal logic]

**Proof anchor:** [supporting evidence]

| Novelty | Specificity | Believability |
|---------|-------------|---------------|
| X/5     | X/5         | HIGH/MED/LOW  |

[Repeat for each mechanism]

---

## Recommendation

**Top picks:** [ranked top 2-3 with brief rationale]

**Research gaps:** [any mechanisms that need deeper research before use]

**Next steps:** [which downstream skills to run]
```

## Quality Criteria

- Every mechanism must name something specific — no "powerful formula" or "unique blend"
- At least 3 of 7 mechanisms should score 4+ on novelty
- Any mechanism scoring LOW on believability must include a research gap callout
- Mechanisms must be grounded in actual product attributes, not fabricated claims
- Output should give a copywriter enough material to write a mechanism reveal section

- **Specificity gate:** Every mechanism angle must include a number, name, or timeframe — no "unique approach" or "effective process"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Each mechanism must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** Each mechanism must survive skepticism — address "sounds too good to be true" with a grounding proof point and "how is this different?" with an explicit contrast to the conventional approach

## Related Skills

- If research is thin, run `/ingredient-research` or `/unified-research-synthesizer` first
- After mechanism selected, use in `/hook-battery` for mechanism-driven hooks
- Feed chosen mechanism into `/rmbc-copy-audit` to validate mechanism scores

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
