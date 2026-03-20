---
name: welcome-sequence
description: Generate a 5-7 email welcome sequence for new subscribers or buyers — arc from first impression through value delivery to first offer using RMBC principles.
model: sonnet
user-invocable: true
---

# welcome-sequence

## Purpose

Generate a complete welcome email sequence (5-7 emails) that converts new subscribers or first-time buyers into engaged, trusting audience members ready to purchase. The welcome sequence is the highest-ROI automated email flow — open rates are 2-3x higher than any other sequence because the subscriber just opted in. Every email must capitalize on this attention window. RMBC applies here as compressed orientation: Research drives personalization, Mechanism introduces your unique approach, Brief structures the arc from stranger to buyer, Copy executes with warmth and authority.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `brand_name` | Yes | Brand or sender name the subscriber will recognize |
| `product_line` | Yes | Core product(s) or service(s) the brand sells |
| `target_audience` | Yes | Who the subscriber is — demographics, pain points, desires |
| `primary_offer` | Yes | The first offer to present — product, price, discount, or lead magnet follow-up |
| `brand_voice` | Yes | One of: `founder`, `expert`, `friend`, `authority` |
| `sequence_length` | No | Number of emails: 5, 6, or 7 (default: 7) |
| `opt_in_source` | No | How they subscribed — lead magnet, quiz, purchase, homepage (default: `lead_magnet`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Welcome sequences deploy RMBC across a trust-building arc — Research informs audience-specific messaging, Mechanism differentiates the brand, Brief structures the emotional journey, Copy converts attention into relationship.

### Step 2 — Map the Welcome Arc

| Email | Role | Emotional State | Focus |
|-------|------|----------------|-------|
| 1 — Welcome | Deliver promised value, set expectations | Curious, high attention | Fulfill opt-in promise, introduce brand voice |
| 2 — Value | Teach something immediately useful | Engaged, evaluating | One actionable insight that delivers a quick win |
| 3 — Story | Share origin story or founding insight | Curious about the person behind the brand | Build connection through narrative |
| 4 — Credibility | Stack proof — results, testimonials, credentials | Weighing trust | Social proof and authority markers |
| 5 — Soft Offer | Introduce the product as a natural next step | Warm, considering | Mechanism tease + value proposition, low-pressure CTA |
| 6 — Hard Offer | Full pitch with urgency | Ready to decide | Complete offer: mechanism, proof, guarantee, deadline |
| 7 — Recap | Summary of value delivered + final CTA | Last chance | Recap the journey, restate the offer, clean close |

For 5-email sequences: combine 2+3, 4+5, keep 6 and 7. For 6-email sequences: combine 4+5.

**Progressive mechanism disclosure:** The product's unique mechanism must be revealed progressively across the sequence — never in full in a single email. Email 1 teases the mechanism's existence without naming it ("There's a reason your approach hasn't worked — and it has nothing to do with what you've been told"). Email 3 reveals half the mechanism within the story. Emails 5-6 reveal the full mechanism with proof. This creates a serialized discovery arc that mirrors how trust builds: curiosity → partial understanding → full comprehension → conviction. Each email reveals one more layer, giving the subscriber a reason to open the next one.

### Step 3 — Adapt by Opt-In Source

| Source | Email 1 Adjustment | Tone Shift |
|--------|-------------------|------------|
| Lead magnet | Deliver the resource + one key takeaway | Educational first |
| Quiz | Reference their quiz result, personalize | Diagnostic, specific |
| Purchase | Confirm order, set product expectations | Gratitude, onboarding |
| Homepage | Introduce brand mission + quick value | Broad, welcoming |

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, appropriate to sequence position)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** appropriate to position (value action early, purchase action late)

Rules:
- Emails 1-3: Zero selling. Pure value, story, relationship building.
- Email 4: Credibility only — proof stacking, no offer yet.
- Emails 5-7: Graduated selling — soft to hard to recap.
- Every email must give a reason to open the next one (preview the next topic).
- Short paragraphs: 1-3 sentences. Respect inbox fatigue.
- One CTA per email — value-focused early, purchase-focused late.

### Step 5 — Validate Sequence Coherence

Read all emails in order. Check:
1. Does each email build on the previous without repeating?
2. Does the value-to-pitch ratio feel earned? (3+ value emails before first offer)
3. Does the story email feel authentic and specific — not generic brand copy?
4. Does the hard offer email work as a standalone pitch?
5. Does the final email create closure regardless of whether they buy?

## Output Format

```
## Welcome Sequence: [Brand Name]

**Opt-In Source:** [lead_magnet | quiz | purchase | homepage]
**Sequence Length:** [5-7] emails
**Send Schedule:** [Day 0, 1, 3, 5, 7, 9, 11]
**Voice:** [founder | expert | friend | authority]
**Audience:** [target audience summary]

---

### Email 1: Welcome — Day 0

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body]

[CTA — value action]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Sequence Strategy Notes

- **Value-to-pitch ratio:** [X value emails : Y pitch emails]
- **Story placement:** Email [3] — [why this timing builds connection]
- **First offer timing:** Email [5] — [why delay builds trust]
- **Suggested send cadence:** [daily for first 2, then every 2 days]
- **Exit behavior:** Subscribers who purchase → move to post-purchase sequence
```

## Quality Criteria

- Email 1 must deliver the opt-in promise immediately — no "stay tuned" deferrals
- No selling in emails 1-3 — pure value, story, and relationship building
- Story email must include specific details — not a templated "our mission is..." paragraph
- Credibility email must use specific proof (numbers, names, results) — not vague authority claims
- Each email must tease the next — create a reason to open tomorrow
- Subject lines must feel personal, not promotional — these are relationship emails
- Hard offer email must work as a standalone pitch if read in isolation
- Final email must create a clean close — no guilt, no desperation

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/hook-battery` for subject line inspiration across the sequence
- Run `/mechanism-ideation` to develop the mechanism tease for emails 5-6
- Run `/email-promo` for standalone promotional emails after the sequence completes
- Run `/post-purchase-sequence` for subscribers who convert during the welcome flow
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
