---
name: rmbc-context
description: Foundational RMBC methodology hub — provides shared framework context that all RMBC generative skills read during execution
user-invocable: false
disable-model-invocation: false
---

# rmbc-context

## Purpose

This skill is the methodology hub for all RMBC generative skills. It defines the shared framework, terminology, quality dimensions, and structural patterns that downstream skills (research, mechanism, brief, copy) reference to ensure consistent application of Stefan Georgi's RMBC direct response copywriting system. No skill in the package generates output without first loading rmbc-context.

## RMBC Framework Overview

RMBC (Research, Mechanism, Brief, Copy) is Stefan Georgi's direct response copywriting framework with $700M+ in attributed client results. The core insight is "Copy Thinking" over writing — strategic thinking about the prospect's context, awareness level, and traffic source determines copy structure before a single word is written. RMBC treats copywriting as an engineering discipline: systematic research feeds a novel mechanism, which informs a strategic brief, which produces high-converting copy.

## Phase Definitions

### Research (R)

ICP identification, pain points, desires, and market awareness levels. The 4-step research framework:

1. **Product/Market Awareness Analysis** — Map where the prospect sits on the awareness spectrum (unaware → most aware). This determines copy length, directness, and education burden.
2. **Competitor Analysis** — Study competing offers, their mechanisms, proof claims, and positioning gaps. Find what's overused and what's missing.
3. **Psychographic Research** — Deep-dive into ICP language, emotional triggers, objections, and desire hierarchy. Mine reviews, forums, support tickets.
4. **Ingredient Research** — For supplements/products: study compounds, clinical data, dosage ranges, and differentiators. For services/info: study methodology components and proof points.

Output: Unified Research Document — all four pillars merged into a copy-ready brief.

### Mechanism (M)

The unique solution angle — a novel, specific explanation of WHY the product works. Not "it works" but "the patented tri-phase absorption complex delivers 3x bioavailability because..."

Mechanism ideation branches by vertical:
- **Supplements** — Ingredient-based: unique compounds, delivery systems, synergistic combinations
- **E-commerce** — Design/engineering-based: materials, manufacturing process, structural innovation
- **Info products** — Methodology-based: proprietary framework, unique sequencing, contrarian approach

A strong mechanism passes the "only we" test: only this product can claim this specific mechanism.

### Brief (B)

Strategic creative direction — the bridge between research and copy. The brief defines:
- **Angle** — The emotional/logical entry point (which pain, desire, or curiosity gap to lead with)
- **Tone** — Voice calibration based on traffic source and awareness level
- **Proof strategy** — Which evidence types to deploy and in what order
- **CTA approach** — The specific action and urgency framework

### Copy (C)

Execution following RMBC structure: lead → mechanism reveal → proof → CTA.

Key principles:
- **Mobile-first** — 80-90% of DTC traffic converts on mobile. Structural hierarchy must prioritize mobile view: short paragraphs, visual breaks, scannable subheads.
- **Context-dependent length** — Copy tone and length vary by traffic source (Meta vs Native vs Search vs Email) and prospect awareness level. Cold traffic from native ads needs longer education; warm retargeting needs shorter, proof-heavy copy.
- **PDP extraction** — Study top-performing product detail pages and extract proven structures before writing.

## Copy Structure Guidelines

**Lead patterns:** curiosity gap, fear/consequence, desire/aspiration, social proof anchor, contrarian claim

**Mechanism reveal patterns:** problem-agitate-mechanism, story-to-discovery, scientific breakdown, before/after contrast

**Proof patterns:** specificity over generality — "73% of participants in a 12-week UCLA study" beats "clinically proven." Stack proof types: clinical, testimonial, demonstration, logical, authority.

**CTA patterns:** clear specific action + reason why now + risk reversal. Never vague. "Click the button below to claim your 3-bottle supply at 40% off before midnight" not "Learn more."

## Quality Dimensions

Every piece of RMBC copy is evaluated on 4 dimensions (0-25 each, 0-100 total):

1. **Result specificity** (0-25) — Outcome-focused with concrete details, not vague promises
2. **Mechanism novelty** (0-25) — Unique explanation that passes the "only we" test
3. **Proof believability** (0-25) — Specific, verifiable evidence stacked in multiple proof types
4. **CTA clarity** (0-25) — Clear action with specific next step, urgency, and risk reversal

Scores below 60 indicate structural issues. Scores 80+ indicate production-ready copy.

## Common Terminology

| Term | Meaning |
|------|---------|
| ICP | Ideal Customer Profile |
| DR | Direct Response |
| DTC | Direct to Consumer |
| Mechanism | Unique explanation of why the product works |
| Hook | First line/element that stops the scroll |
| Lead | Opening section of copy (first 100-300 words) |
| Control | Current best-performing version of an ad/page |
| Swipe file | Collection of proven copy examples for reference |
| Split test | A/B test comparing copy variations |
| CPA | Cost Per Acquisition |
| ROAS | Return on Ad Spend |
| Copy chief | Senior reviewer who evaluates and improves copy |
| Value-comparison pricing | Showing unit economics explicitly |

## Integration

Downstream skills load rmbc-context before generating any output. The integration pattern:

1. Skill reads `rmbc-context/SKILL.md` for framework overview and quality dimensions
2. Skill reads `rmbc-context/resources/rmbc-methodology.md` for detailed phase guidance relevant to its function
3. Skill applies phase-specific methodology to its generation task
4. Skill evaluates output against the 4 quality dimensions before returning results

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
