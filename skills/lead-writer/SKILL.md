---
name: lead-writer
description: Generate the opening lead section of long-form DR copy — the first 200-500 words that determine whether the prospect reads or bounces.
model: sonnet
user-invocable: true
---

# lead-writer

## Purpose

Generate the opening lead of long-form direct response copy. The lead is the first 200-500 words after the headline — it determines whether a prospect commits to reading or bounces. A great hook earns attention; a great lead earns the next 2,000 words. This skill produces 3 lead variations across different lead types so the copywriter can test or choose the strongest opening for their format (sales page, VSL, advertorial, email).

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `lead_type` | Yes | One of: `story`, `problem_agitation`, `curiosity`, `news`, `contrarian` — or `auto` to get best-fit recommendation |
| `key_mechanism` | No | The product's unique mechanism (output from `/mechanism-ideation`) |
| `format_context` | No | Where this lead will be used: `sales_page`, `vsl`, `advertorial`, `email`, `general` (default: `general`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. The lead sits between the hook (first line) and the body copy — it must sustain the curiosity the hook created while building enough emotional investment to carry the reader into the mechanism reveal.

### Step 2 — Analyze Audience Sophistication

Determine market awareness level (Eugene Schwartz scale):
- **Most Aware** — Knows product, needs deal → Lead with offer
- **Product Aware** — Knows product, not convinced → Lead with proof/differentiation
- **Solution Aware** — Knows solutions exist, not yours → Lead with mechanism
- **Problem Aware** — Feels pain, no solution → Lead with problem agitation
- **Unaware** — Doesn't know they have a problem → Lead with story or news

Match lead type to awareness level. If `lead_type: auto`, recommend based on this analysis.

### Step 3 — Write 3 Lead Variations

Generate 3 distinct leads (200-500 words each):

#### Story Lead
- Open with a specific person, moment, or scene
- Use sensory details — what they saw, felt, heard
- The story must connect to the prospect's situation within 3 paragraphs
- End with a pivot toward the problem or mechanism

#### Problem-Agitation Lead
- Name the problem in the first sentence
- Agitate with specific consequences (financial, emotional, social, physical)
- Use "you" language — make it personal
- Escalate from annoying to urgent
- End with implied promise of a solution

#### Curiosity Lead
- Open a knowledge gap immediately
- Reference something specific and unexpected
- Tease a mechanism or discovery without revealing it
- Use specificity to build credibility ("a 47-year-old accountant from Tulsa")
- End with a promise to reveal

#### News Lead
- Open with a time reference ("Last month...", "In a recent study...")
- Frame the mechanism as a discovery or breakthrough
- Use institutional credibility (universities, journals, experts)
- Keep tone neutral/editorial in the first paragraph, then shift to personal relevance

#### Contrarian Lead
- Challenge a belief the audience currently holds
- Be specific about what conventional wisdom says
- Provide a credible reason why the common approach fails
- Position the mechanism as the unconventional alternative

If `lead_type` is specific, write 3 variations of that type. If `auto`, write the top 3 recommended types.

### Step 4 — Assess Each Lead

For each variation, provide:
- **Strength score** (1-5) with reasoning
- **Best format fit** — which copy format this lead works best in
- **Awareness match** — which awareness level this lead targets
- **Risk factor** — what could cause this lead to fail

## Output Format

```
## Lead Variations: [Product Name]

**Audience:** [target audience summary]
**Awareness Level:** [assessed level]
**Mechanism:** [key mechanism, if provided]

---

### Lead 1: [Type] — Strength: X/5

[Full lead copy, 200-500 words]

**Assessment:**
- Best for: [format]
- Awareness match: [level]
- Risk: [what could cause failure]

---

### Lead 2: [Type] — Strength: X/5

[Full lead copy, 200-500 words]

**Assessment:**
- Best for: [format]
- Awareness match: [level]
- Risk: [what could cause failure]

---

### Lead 3: [Type] — Strength: X/5

[Full lead copy, 200-500 words]

**Assessment:**
- Best for: [format]
- Awareness match: [level]
- Risk: [what could cause failure]

---

## Recommendation

**Strongest lead:** Lead #X
**Reasoning:** [why this lead wins for this product + audience combo]
**Suggested test:** [which two leads to A/B test and why]
```

## Quality Criteria

- Each lead must hook within the first 2 sentences — no slow warmups
- Story leads must use specific, concrete details — not generic scenarios
- Problem-agitation leads must name real consequences, not vague discomfort
- Curiosity leads must tease something specific — not empty intrigue
- All leads must transition naturally into a mechanism reveal or body copy
- Word count must stay in 200-500 range — leads that run long lose their purpose

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/hook-battery` for the headline/hook that precedes the lead
- Run `/mechanism-ideation` for the mechanism the lead must set up
- Use leads in `/vsl-script`, `/lander-copy`, or `/advertorial-writer`
- Validate full copy with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
