---
name: reengagement-sequence
description: Generate a 3-5 email reengagement sequence for inactive subscribers — from "we miss you" through exclusive offer to sunset warning using RMBC principles.
model: sonnet
user-invocable: true
---

# reengagement-sequence

## Purpose

Generate a reengagement email sequence (3-5 emails) that reactivates inactive subscribers or cleanly removes them from the list. Inactive subscribers hurt deliverability, inflate costs, and drag down open rates — but many are recoverable with the right approach. This sequence gives them compelling reasons to re-engage, escalates with an exclusive offer, and ends with a clear sunset warning that either wakes them up or lets you remove them cleanly. RMBC applies as re-persuasion architecture: Research identifies why they disengaged, Mechanism reminds them what makes you different, Brief structures the win-back arc, Copy executes with honesty and value.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `brand_name` | Yes | Brand or sender name they originally subscribed to |
| `target_audience` | Yes | Who the subscriber was — demographics, original interest, likely pain points |
| `key_value_prop` | Yes | The core reason they subscribed — what value they were expecting |
| `win_back_offer` | Yes | Exclusive offer for re-engagement — discount, free resource, or special access |
| `sequence_length` | No | Number of emails: 3, 4, or 5 (default: 4) |
| `inactivity_threshold` | No | How long they've been inactive — used for copy calibration (default: `90 days`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. Reengagement sequences re-deploy RMBC against a cooled audience — these subscribers once found you valuable enough to opt in. The job is reminding them why, delivering fresh value, and forcing a decision: re-engage or unsubscribe.

### Step 2 — Map the Reengagement Arc

| Email | Role | Emotional Lever | Approach |
|-------|------|----------------|----------|
| 1 — "We Miss You" | Acknowledge absence, re-introduce value | Nostalgia + curiosity | Warm, personal, non-pushy. Remind them why they subscribed. Show what they've missed. |
| 2 — Value Reminder | Deliver a high-value piece of content | Proof you're still worth their attention | Best recent content, tip, or insight — demonstrate value immediately |
| 3 — Exclusive Offer | Present the win-back incentive | Feeling special, exclusive access | Offer available only to returning subscribers — make them feel valued, not desperate |
| 4 — "Last Chance" | Final nudge with clear consequences | Loss aversion + clarity | "We don't want to see you go, but we only want to email people who want to hear from us" |
| 5 — Sunset Warning | Administrative: unsubscribe notice | Clean break | "We're removing you from our list in 48 hours unless you click below to stay" |

For 3-email sequences: combine 1+2 (miss you + value), keep 3 (offer), combine 4+5 (last chance + sunset). For 4-email sequences: combine 4+5 into one final email.

### Step 3 — Diagnose Disengagement Reasons

Before writing, identify likely reasons for inactivity:

| Reason | Signal | Sequence Adjustment |
|--------|--------|---------------------|
| Inbox overwhelm | High volume sender | Lead with "we've improved" — less frequent, more valuable |
| Content mismatch | Subscribed for X, got Y | Re-qualify: "What are you most interested in?" |
| Got what they needed | Lead magnet download, no further need | Show new value they haven't seen |
| Forgot who you are | Long gap between emails | Reintroduce the brand — "Quick reminder: I'm [name] and I..." |
| Switched to competitor | Market shift | Differentiate — deploy mechanism to show what's unique |

Email 1 should address the most likely disengagement reason for this audience.

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, designed to break through inbox blindness)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** appropriate to the email's purpose

Rules:
- Email 1: Personal, warm, curious. No selling. Ask a question or invite a reply.
- Email 2: Pure value delivery — best content, not a pitch. Prove you're still worth reading.
- Email 3: Present the exclusive offer clearly — limited to returning subscribers only.
- Email 4-5: Honest, direct, no guilt trips. "We respect your inbox" framing.
- Subject lines must break through inbox blindness — these people have been ignoring you.
- Use their name/personalization tokens aggressively — trigger recognition.
- Short emails: inactive subscribers have even less patience than active ones.

### Step 5 — Validate Reengagement Coverage

Check that the sequence addresses:
1. Re-introduction (email 1 — they remember who you are and why they subscribed)
2. Value demonstration (email 2 — proof you're still worth their time)
3. Incentive to act (email 3 — exclusive offer creates urgency)
4. Clean resolution (email 4-5 — clear choice: stay or go)

If any stage is missing, revise.

## Output Format

```
## Reengagement Sequence: [Brand Name]

**Sequence Length:** [3-5] emails
**Send Schedule:** Day 1, 3, 5, 7, 10
**Audience:** [target audience — inactive segment]
**Inactivity Threshold:** [90 days | 120 days | etc.]
**Win-Back Offer:** [summary of exclusive offer]

---

### Email 1: "We Miss You" — Day 1

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body]

[CTA — reply, click to re-engage, or preference center]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Reengagement Strategy Notes

- **Likely disengagement reason:** [identified reason and how email 1 addresses it]
- **Win-back offer placement:** Email [3] — exclusive to returning subscribers
- **Sunset deadline:** Email [4/5] — [48-72 hour] window to act
- **List hygiene:** Non-openers after full sequence → suppress or unsubscribe
- **Success metrics:** [reactivation rate, open rate recovery, list size reduction, deliverability improvement]
- **Re-engaged subscribers:** Move to [welcome-back flow or main broadcast list]
```

## Quality Criteria

- "We miss you" email must feel personal, not automated — use specific references to their original interest
- Value email must deliver genuinely useful content — not a dressed-up pitch
- Exclusive offer must feel exclusive — not the same discount everyone gets
- Sunset warning must be clear and honest — state exactly what will happen and when
- No guilt-tripping or desperation language — respect their right to leave
- Subject lines must break through inbox blindness — these subscribers have been ignoring you
- Sequence must lead to a clean binary outcome: re-engaged or removed
- Non-responders after the full sequence must be suppressed — never keep emailing inactive subscribers

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/welcome-sequence` for re-engaged subscribers returning to active status
- Run `/broadcast-email` for ongoing engagement after reactivation
- Run `/hook-battery` for subject lines that break through inbox blindness
- Run `/email-promo` for promotional offers to the reactivated segment
- Validate with `/rmbc-copy-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
