---
name: vsl-script
description: Generate RMBC-structured video sales letter scripts with timing markers — the highest-converting long-form format in direct response.
model: sonnet
user-invocable: true
---

# vsl-script

## Purpose

Generate a complete VSL (Video Sales Letter) script structured around RMBC principles. VSLs are the highest-converting long-form format in direct response — they combine the persuasive power of long-form copy with the engagement of video. Every VSL follows the same proven arc: hook → problem → mechanism reveal → proof cascade → offer → close. Scripts include timing markers so the client or editor knows pacing at a glance. Mobile-first: 80%+ of VSL viewers watch on phones.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `key_mechanism` | Yes | The product's unique mechanism (output from `/mechanism-ideation`) |
| `price_point` | Yes | Product price and any payment plan options |
| `guarantee` | Yes | Money-back guarantee details (duration, conditions) |
| `proof_points` | No | Testimonials, case studies, clinical data, expert endorsements |
| `target_length` | No | One of: `short` (10-15 min), `standard` (25-35 min), `long` (45-60 min). Default: `standard` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. VSLs deploy all four RMBC phases sequentially — Research informs the hook and problem section, Mechanism drives the core revelation, Brief structures the argument, Copy executes the persuasion.

### Step 2 — Map the VSL Arc

Build a structural outline with timing markers before writing:

| Section | Timing (standard) | Purpose |
|---------|-------------------|---------|
| Hook | 0:00–0:30 | Stop the scroll, open a loop |
| Problem Agitation | 0:30–3:00 | Make the pain vivid and urgent |
| Failed Solutions | 3:00–5:00 | Disqualify alternatives |
| Mechanism Reveal | 5:00–10:00 | Introduce the unique mechanism |
| **Micro-Commitment Checkpoint** | 9:30–10:00 | Rhetorical question forcing mental agreement before proof — "So if [root cause] is the real problem... doesn't it make sense to address [root cause] directly?" Creates a yes-ladder that makes the close feel inevitable. |
| Proof Cascade | 10:00–18:00 | Stack evidence — testimonials, data, demos |
| Product Introduction | 18:00–22:00 | Bridge mechanism to product |
| Offer Stack | 22:00–27:00 | Value stack with price anchoring |
| Risk Reversal | 27:00–29:00 | Guarantee removes objection |
| Close + Urgency | 29:00–32:00 | Final CTA with scarcity/urgency |
| PS / Second Close | 32:00–35:00 | Recap for skimmers, restate guarantee |

Scale timing proportionally for `short` or `long` formats.

### Step 3 — Write Each Section

For each section, write:
- **Screen direction** — What's shown on screen (text slides, b-roll, talking head)
- **Voiceover script** — Exact words to be spoken
- **Transition cue** — How this section flows into the next

Rules:
- One idea per slide. Mobile screens are small.
- Use pattern interrupts every 2-3 minutes (story, question, visual shift)
- Mechanism section must use analogy or metaphor — make the complex simple
- Proof cascade: lead with strongest proof, alternate types (testimonial → data → expert → testimonial)
- Offer stack: anchor high, reveal real price as a contrast

### Step 4 — Write CTA Blocks

Include 3 CTA insertion points:
1. **Soft CTA** after proof cascade (~60% mark) — for ready buyers
2. **Main CTA** after offer stack — full close with urgency
3. **PS CTA** at end — recap, guarantee restatement, final push

Each CTA must include: what to do, what they get, guarantee reminder.

## Output Format

```
## VSL Script: [Product Name]

**Audience:** [target audience summary]
**Mechanism:** [key mechanism name]
**Format:** [short | standard | long] (~XX minutes)
**Price:** [price point]
**Guarantee:** [guarantee summary]

---

### [0:00–0:30] HOOK

**Screen:** [visual direction]
**Script:**
[voiceover copy]

**→ Transition:** [bridge to next section]

---

### [0:30–3:00] PROBLEM AGITATION

[...continue for each section...]

---

## Production Notes

- **Total word count:** ~X,XXX words (~XX minutes at 150 wpm)
- **CTA count:** 3 (soft at XX:XX, main at XX:XX, PS at XX:XX)
- **Pattern interrupts:** [list timestamps]
- **Key slides to design:** [list 3-5 critical visual moments]
```

## Quality Criteria

- Hook must work in the first 5 seconds — no preamble, no "Hi, my name is..."
- Mechanism section must make a complex idea simple through analogy
- Proof cascade must include 3+ distinct proof types (not all testimonials)
- Every CTA must restate the guarantee
- Script must read naturally when spoken aloud — no written-language constructions
- Timing markers must be realistic at ~150 words per minute speaking pace

- **Specificity gate:** Every claim in the script must include a number, name, or timeframe — no "get results" or "feel better"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The script must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The script must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` first to develop the core mechanism
- Run `/hook-battery` for hook options to open the VSL
- Run `/lead-writer` for alternative opening approaches
- Use `/ingredient-research` for proof points and clinical data
- Validate the script with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
