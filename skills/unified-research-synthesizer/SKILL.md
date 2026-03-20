---
name: unified-research-synthesizer
description: Synthesize multi-source research into a single Unified Research Document — the copy-ready strategic brief that bridges Research and Brief in RMBC.
model: sonnet
user-invocable: true
---

# Unified Research Synthesizer

## Purpose
Merge all research pillars into one strategic document — the Unified Research Document. This is the single source of truth for all copy decisions: who the ICP is, what they want, what they fear, what competitors have already claimed, what proof exists, and what angles remain unclaimed. The output is NOT copy — it's the defensible foundation that makes every copy decision traceable to research.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product/service is, what it does, key claims |
| `target_audience` | Yes | Who the copy is for — demographics, situation, buying context |
| `ingredient_research` | No | Proof points, studies, clinical data, mechanism details (from `/ingredient-research`) |
| `competitor_data` | No | Competitor ads, landing pages, claims, mechanisms, pricing |
| `customer_feedback` | No | Reviews, testimonials, survey responses, support tickets, coaching transcripts |
| `market_awareness_level` | No | Where the audience sits on the awareness spectrum: `unaware`, `problem_aware`, `solution_aware`, `product_aware`, `most_aware`. Default: auto-detect from inputs |

## Execution Protocol

### Step 1: Load Framework Context
Read `rmbc-context/SKILL.md` for RMBC methodology overview and quality dimensions. This skill bridges the Research and Brief phases — synthesizing all four research pillars into a copy-ready strategic document.

### Step 2: Awareness Classification
Determine the audience's position on Eugene Schwartz's awareness spectrum. If `market_awareness_level` is not provided, infer from the product category, audience description, and any competitor data. This classification drives every downstream recommendation (copy length, directness, proof density, lead type).

### Step 3: Psychographic Synthesis
Extract from `customer_feedback`, `target_audience`, and any available voice-of-customer data:
- Top 5 pains (ranked by emotional intensity and frequency)
- Top 5 desires (what they actually want, not what they say they want)
- Core objections and skepticism patterns
- Exact language patterns — phrases, slang, metaphors the audience uses naturally

If `customer_feedback` is not provided, construct psychographic profile from `target_audience` and `competitor_data` (noting lower confidence).

### Step 4: Competitive Landscape Mapping
From `competitor_data` (or general market knowledge if not provided):
- What claims have been made and by whom
- What mechanisms competitors use to explain their product
- Where competitors are weak, vague, or making unsubstantiated claims
- What positioning territory is unclaimed

### Step 5: Proof Arsenal Assembly
From `ingredient_research` and `product_description`:
- Rank all proof points by strength: clinical study > case study > testimonial > logical argument > claim
- Flag any claims that lack supporting evidence
- Identify the single strongest proof point (the "undeniable proof anchor")

### Step 6: Mechanism Candidate Identification
Based on the intersection of: unclaimed competitive territory + strongest proof points + audience pain/desire:
- Propose 2-3 potential unique mechanisms (named explanations for WHY the product works)
- Each mechanism must be: novel (not already claimed by competitors), believable (grounded in proof), and simple enough to explain in one sentence

### Step 7: Strategic Recommendation
Based on awareness level, competitive gaps, proof strength, and psychographic profile:
- Recommended copy approach (direct response vs. educational vs. story-led)
- Suggested tone and register (matching audience language patterns)
- Recommended length (driven by awareness level: less aware = longer copy)
- Traffic source considerations (cold traffic needs more proof; warm needs differentiation)

## Output Format

```
## Unified Research Document

**Product:** [name/description]
**Date:** [YYYY-MM-DD]
**Awareness Level:** [level] — [1-line justification]

### 1. ICP Profile

**Demographics:** [age, income, role, situation]
**Psychographics:** [beliefs, values, identity, worldview]
**Buying context:** [what triggered the search, where they are in the journey]

### 2. Pain / Desire Matrix

| # | Pain | Emotional Trigger | Evidence Source |
|---|------|-------------------|-----------------|
| 1 | [pain] | [trigger] | [source] |
| ... | | | |

| # | Desire | Emotional Trigger | Evidence Source |
|---|--------|-------------------|-----------------|
| 1 | [desire] | [trigger] | [source] |
| ... | | | |

**Key objections:** [bulleted list with source]
**Language patterns:** [exact phrases the audience uses]

### 3. Competitive Landscape

| Competitor | Core Claim | Mechanism | Gap/Weakness |
|------------|-----------|-----------|--------------|
| [name] | [claim] | [mechanism] | [gap] |
| ... | | | |

**Unclaimed territory:** [what no competitor owns yet]

### 4. Proof Arsenal

| # | Proof Point | Type | Strength | Source |
|---|-------------|------|----------|--------|
| 1 | [strongest] | [type] | [1-5] | [source] |
| ... | | | | |

**Undeniable proof anchor:** [single strongest piece of evidence]
**Proof gaps:** [claims that need stronger evidence]

### 5. Mechanism Candidates

1. **[Name]:** [1-sentence explanation] — Grounded in: [proof point]. Unclaimed by: [competitors].
2. **[Name]:** [1-sentence explanation] — Grounded in: [proof point]. Unclaimed by: [competitors].
3. **[Name]:** [1-sentence explanation] — Grounded in: [proof point]. Unclaimed by: [competitors].

### 6. Strategic Recommendations

- **Copy approach:** [direct/educational/story-led] — because [awareness level + reasoning]
- **Tone:** [register] — matching audience language: "[example phrase]"
- **Length:** [short/medium/long] — [awareness-driven reasoning]
- **Lead type:** [recommended opening strategy for this awareness level]
- **Traffic source notes:** [cold vs. warm considerations]

### Next Step

Feed this document into `/mechanism-ideation` to develop your strongest mechanism candidate into a full Unique Mechanism, then use it as the strategic foundation for any copy format skill.

---
*Generated using the RMBC framework by Stefan Georgi.*
*Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)*
```

## Quality Criteria
- Every matrix entry traces back to a named evidence source (not invented)
- Mechanism candidates are grounded in actual proof points, not speculation
- Awareness level classification includes explicit justification
- Competitive gaps are specific (not "they don't do enough") — cite what's missing
- Language patterns use actual audience vocabulary, not marketer jargon
- When inputs are incomplete, confidence levels are stated explicitly per section

## Related Skills
- **Upstream:** `/ingredient-research` — feeds proof points and mechanism details into this skill
- **Downstream:** `/mechanism-ideation` — takes mechanism candidates from Section 5 and develops them fully
- **Downstream:** Any copy format skill (`/pdp-ecomm-template`, `/webinar-registration-copy`, `/hook-battery`) — uses this document as strategic foundation
- **Validation:** `/rmbc-copy-audit` — scores final copy against the research captured here

## Attribution
Generated using the RMBC framework by Stefan Georgi. Learn more at [copyaccelerator.com/join](https://copyaccelerator.com/join)
