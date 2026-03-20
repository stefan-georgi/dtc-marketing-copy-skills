---
name: soap-opera-sequence
description: Generate a soap opera email sequence (5-7 emails) that uses narrative tension and cliffhangers to build desire and drive conversions through RMBC-structured storytelling.
model: sonnet
user-invocable: true
---

# soap-opera-sequence

## Purpose

Generate a soap opera email sequence (5-7 emails) inspired by Andre Chaperon's serialized storytelling approach, adapted through the RMBC lens. Each email tells a chapter of a compelling narrative arc — backstory, rising tension, epiphany, hidden benefits, and urgency — with every email ending on a cliffhanger that compels the next open. The story IS the selling mechanism. RMBC applies as narrative architecture: Research identifies the audience's emotional triggers, Mechanism is revealed through the story's epiphany moment, Brief structures the dramatic arc, Copy executes with cinematic pacing.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, core promise |
| `target_audience` | Yes | Who the reader is — demographics, pain points, desires |
| `origin_story_hook` | Yes | The inciting incident — a struggle, failure, or discovery that starts the story |
| `key_mechanism` | Yes | The unique solution angle revealed as the story's epiphany |
| `sequence_length` | No | Number of emails: 5, 6, or 7 (default: 5) |
| `protagonist` | No | Who tells the story — founder, customer, or fictional archetype (default: `founder`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Soap opera sequences deploy RMBC through narrative — the framework is invisible to the reader but structures every story beat. The mechanism reveal is the story's climax, not a sales pitch.

### Step 2 — Map the Narrative Arc

| Email | Story Beat | Dramatic Purpose | Cliffhanger Type |
|-------|-----------|-----------------|-----------------|
| 1 — Backstory | Set the scene, introduce the protagonist's struggle | Identification — reader sees themselves | "But then something happened that changed everything..." |
| 2 — High Drama | The crisis point — things get worse before they get better | Tension — stakes are raised | "I was about to give up when I noticed something strange..." |
| 3 — Epiphany | The discovery moment — mechanism revealed through story | Revelation — the key insight clicks | "But what I discovered next was even more surprising..." |
| 4 — Hidden Benefits | Unexpected advantages beyond the main promise | Desire expansion — more reasons to want this | "And that wasn't even the best part..." |
| 5 — Urgency/CTA | The transformation is complete — time to act | Resolution — but only for those who act | Story closes, offer opens, window is finite |

For 6-email sequences: split email 2 into rising tension + crisis point. For 7-email sequences: add a "false solution" email after email 2 (things that didn't work) and a social proof email after email 4.

### Step 3 — Build the Story Engine

Before writing, define:
- **Protagonist:** Who is telling this story? (founder, customer, composite character)
- **Core struggle:** What problem mirrors the reader's situation?
- **False solutions:** What did the protagonist try that failed? (builds relatability)
- **Discovery moment:** How was the mechanism found? (must feel organic, not pitched)
- **Transformation proof:** What changed after the discovery? (specific, measurable)

The story must pass the "campfire test" — would someone want to hear the next chapter even if there were no product to sell?

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, story-driven — not promotional)
- **Preview text** (40-90 characters, extends the narrative hook)
- **Body copy** following the story beat with cinematic pacing
- **Cliffhanger ending** (emails 1-4) or **CTA** (email 5+)

Rules:
- Every email opens by resolving the previous cliffhanger — reward the open.
- Short paragraphs: 1-3 sentences. Pacing matters — white space creates tension.
- Sensory details over abstractions: "my hands were shaking" not "I was nervous."
- The product is NEVER mentioned by name until email 3 at the earliest.
- No selling in emails 1-2. The story IS the pitch — trust it.
- Email 5 transitions from story to offer — the CTA must feel like the story's natural conclusion.

### Step 5 — Validate Narrative Integrity

Read the full sequence as one continuous story. Check:
1. Does each cliffhanger compel the next open? Would you click?
2. Does the epiphany (email 3) feel earned — not forced or premature?
3. Is the protagonist relatable to the target audience?
4. Does the mechanism reveal feel like a story discovery, not a sales pitch?
5. Does the final CTA feel like the logical conclusion of the narrative?
6. Could you remove the product and still have a compelling story?

## Output Format

```
## Soap Opera Sequence: [Product Name]

**Protagonist:** [founder | customer | archetype]
**Sequence Length:** [5-7] emails
**Send Schedule:** [Daily for maximum narrative momentum]
**Audience:** [target audience summary]
**Story Hook:** [one-line origin story hook]

---

### Email 1: Backstory — Day 1

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body — story chapter]

**Cliffhanger:** [closing hook]

---

### Email 2: [Beat Label] — Day [X]

[...continue for each email...]

---

## Narrative Strategy Notes

- **Story type:** [rags-to-riches | discovery | overcoming-the-monster | quest]
- **Mechanism reveal timing:** Email [3] — disguised as the protagonist's epiphany
- **Emotional arc:** [identification → tension → revelation → desire → action]
- **Send cadence:** Daily recommended — momentum breaks kill soap operas
- **Cliffhanger strength:** Rate each 1-5 — weakest cliffhanger = rewrite priority
```

## Quality Criteria

- Each cliffhanger must create genuine curiosity — not clickbait that doesn't pay off
- The story must be specific and sensory — no generic "I struggled with X" filler
- The mechanism must be revealed through the story's epiphany, not inserted as a pitch
- Product name should not appear until email 3 at the earliest
- No selling in emails 1-2 — pure narrative that builds identification and tension
- The protagonist's struggle must mirror the target audience's actual situation
- Final CTA must feel like the story's natural resolution, not an interruption
- Daily send cadence is strongly recommended — gaps kill narrative momentum

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` to develop the epiphany moment's mechanism
- Run `/hook-battery` for subject line variations across the sequence
- Run `/lead-writer` for opening line options per email
- Run `/email-promo` for follow-up promotional emails after the sequence
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
