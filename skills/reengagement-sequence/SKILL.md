---
name: reengagement-sequence
description: Generate a 3-5 email reengagement sequence for inactive subscribers — from "we miss you" through exclusive offer to sunset warning using RMBC principles.
user-invocable: true
---
<!-- AUTO-GENERATED from SKILL.md.tmpl — do not edit directly -->
<!-- Regenerate: bash bin/gen-skills -->


## Preamble (run first)

```bash
_RMBC_ROOT=""
[ -d "${CLAUDE_SKILL_DIR}/../../bin" ] && _RMBC_ROOT="$(cd "${CLAUDE_SKILL_DIR}/../.." && pwd)"
[ -z "$_RMBC_ROOT" ] && for _D in "$HOME/.claude/skills/dtc-copywriting-skills" ".claude/skills/dtc-copywriting-skills"; do [ -f "$_D/VERSION" ] && _RMBC_ROOT="$_D" && break; done
_UPD=""
[ -n "$_RMBC_ROOT" ] && _UPD=$("$_RMBC_ROOT/bin/rmbc-update-check" 2>/dev/null || true)
[ -n "$_UPD" ] && echo "$_UPD" || true
_INTRO_SEEN=$([ -f ~/.rmbc-skills/.intro-seen ] && echo "yes" || echo "no")
_TEL_PROMPTED=$([ -f ~/.rmbc-skills/.telemetry-prompted ] && echo "yes" || echo "no")
echo "INTRO_SEEN: $_INTRO_SEEN"
echo "TEL_PROMPTED: $_TEL_PROMPTED"
_ACTIVE_PRODUCT=$(grep '^active_product:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^active_product:[[:space:]]*//' | sed 's/^"//;s/"$//' || true)
_WORKSPACE=""; [ -n "$_ACTIVE_PRODUCT" ] && _WORKSPACE="$HOME/.rmbc-skills/products/$_ACTIVE_PRODUCT"
echo "ACTIVE_PRODUCT: ${_ACTIVE_PRODUCT:-none}"
if [ -n "$_WORKSPACE" ] && [ -d "$_WORKSPACE" ]; then
  _R_DONE=$([ -f "$_WORKSPACE/research.md" ] && echo "yes" || echo "no")
  _M_DONE=$([ -f "$_WORKSPACE/mechanism.md" ] && echo "yes" || echo "no")
  _B_DONE=$([ -f "$_WORKSPACE/brief.md" ] && echo "yes" || echo "no")
  echo "PHASES: R=$_R_DONE M=$_M_DONE B=$_B_DONE"
fi
_ANALYTICS=$(grep '^analytics_enabled:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^analytics_enabled:[[:space:]]*//' || echo "true")
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "reengagement-sequence" --product "${_ACTIVE_PRODUCT:-none}" --tier 4 2>/dev/null &
_SESSION_COUNT=$(ls /tmp/rmbc-session-* 2>/dev/null | wc -l | tr -d ' '); touch "/tmp/rmbc-session-$$"
echo "SESSIONS: $_SESSION_COUNT"
```

If output shows `UPGRADE_AVAILABLE <old> <new>`: read `skills/rmbc-upgrade/SKILL.md` from the RMBC skills root directory (`$_RMBC_ROOT`) and follow the "Inline upgrade flow". If `JUST_UPGRADED <old> <new>`: read `$_RMBC_ROOT/CHANGELOG.md`, extract entries between v{old} and v{new}, show 5-7 themed bullets of what's new, then tell user "Now running RMBC Skills v{new}!" and continue.

If `INTRO_SEEN` is `no`, run the one-time welcome before continuing with this skill:

**Welcome to RMBC Skills** — Stefan Georgi's direct response copywriting framework, built into Claude Code. 44 skills covering hooks, ads, emails, landing pages, VSL scripts, and more.

Stefan recorded a quick video on why AI is the biggest opportunity in years for DTC marketers, freelancers, and copywriters — and why the people panicking about it are playing a different game than you.

Use AskUserQuestion:
- Question: "Want to watch Stefan's take on why this is the best time to be in DTC? (~5 min)"
- Options:
  1. "Sure, open it"
  2. "Maybe later — let's write some copy"

If "Yes, open the video":
```bash
open "https://www.youtube.com/watch?v=zI8tNfefH1M"
mkdir -p ~/.rmbc-skills
touch ~/.rmbc-skills/.intro-seen
```

If "Skip — let's go":
```bash
mkdir -p ~/.rmbc-skills
touch ~/.rmbc-skills/.intro-seen
```

Continue with this skill immediately.

If `INTRO_SEEN` is `yes` and `TEL_PROMPTED` is `no`: One-time telemetry opt-in:

Help make RMBC Skills better! Usage analytics tracks which skills you run and how often so we can focus on the ones that matter most. Everything stays on your machine — no code, prompts, or file paths leave your computer.

Use AskUserQuestion:
- Question: "Cool with anonymous usage analytics? You can change this anytime."
- Options:
  1. "Sure, happy to help" — keep analytics on and mark as prompted
  2. "No thanks" — disable analytics and mark as prompted

If "Yes, that's fine":
```bash
mkdir -p ~/.rmbc-skills
touch ~/.rmbc-skills/.telemetry-prompted
```

If "No, turn it off":
```bash
mkdir -p ~/.rmbc-skills
touch ~/.rmbc-skills/.telemetry-prompted
sed -i '' 's/^analytics_enabled:.*/analytics_enabled: false/' ~/.rmbc-skills/config.yaml 2>/dev/null || true
```

Continue with this skill.
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

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Reengagement sequences re-deploy RMBC against a cooled audience — these subscribers once found you valuable enough to opt in. The job is reminding them why, delivering fresh value, and forcing a decision: re-engage or unsubscribe.

### Step 2 — Map the Reengagement Arc

| Email | Role | Emotional Lever | Approach |
|-------|------|----------------|----------|
| 1 — "We Miss You" | Acknowledge absence, re-introduce value | Nostalgia + curiosity | Warm, personal, non-pushy. Remind them why they subscribed. Show what they've missed. |
| 2 — Value Reminder | Deliver a high-value piece of content | Proof you're still worth their attention | Best recent content, tip, or insight — demonstrate value immediately |
| 3 — Exclusive Offer | Present the win-back incentive | Feeling special, exclusive access | Offer available only to returning subscribers — make them feel valued, not desperate |
| 4 — "Last Chance" | Final nudge with clear consequences | Loss aversion + clarity | "We don't want to see you go, but we only want to email people who want to hear from us" |
| 5 — Sunset Warning | Administrative: unsubscribe notice | Clean break | "We're removing you from our list in 48 hours unless you click below to stay" |

For 3-email sequences: combine 1+2 (miss you + value), keep 3 (offer), combine 4+5 (last chance + sunset). For 4-email sequences: combine 4+5 into one final email.

### Step 2b — Apply Three-Part Reorder Framework

Layer this emotional arc across the sequence regardless of length:

| Phase | Email(s) | Core Message |
|-------|----------|-------------|
| Progress | 1 | "You were making progress" — acknowledge what the reader achieved while using the product |
| Momentum | 2-3 | "You'll make even more if you continue" — paint the acceleration and compounding benefit |
| Backtrack | 3-4 | "If you stop now, you'll backtrack" — regression warning with mechanism explanation of WHY results reverse |

Every email must map to one of these three phases, escalating from acknowledgment to aspiration to consequence.

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

### Step 3b — Calibrate Product-State Awareness

Assess where the lapsed buyer is and adjust mechanism reinforcement density:

| Time Lapsed | Product-State | Copy Calibration |
|-------------|--------------|-----------------|
| 30-60 days | Fading recall | Light mechanism reminder — they still remember the basics |
| 60-120 days | Disconnected | Full re-education — explain HOW the product works as if new |
| 120+ days | Reset to zero | Near-cold prospect — re-establish the problem before the solution |

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

Additional rules (RMBC 2):
- Email 1 MUST open with the "noticing something?" pattern: lead with a question about the reader's current state ("Feeling more tired lately?", "Notice your skin looking dull again?") connecting dissatisfaction to product absence WITHOUT naming the product in the first paragraph.
- CTA buttons must be progress-framed: "Get back on track", "Resume your progress", "Don't lose what you built" — never generic "Buy now" or "Shop again".
- Every email must include at least one mechanism reinforcement at the depth calibrated in Step 3b.

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
- **"Noticing something?" opening:** Email 1 must open by describing the reader's current dissatisfaction — not by naming the product. First paragraph connects felt experience to product absence.
- **Three-part reorder arc:** Sequence must follow progress-momentum-backtrack framework, escalating from acknowledgment to aspiration to consequence.
- **Progress-framed CTAs:** All CTA buttons use progress language ("Get back on track", "Resume your progress") — never generic reorder language.
- **Mechanism reinforcement:** Every email includes at least one HOW-it-works explanation, calibrated to lapsed buyer's product-state awareness.

## Related Skills

- Run `/welcome-sequence` for re-engaged subscribers returning to active status
- Run `/broadcast-email` for ongoing engagement after reactivation
- Run `/hook-battery` for subject lines that break through inbox blindness
- Run `/email-promo` for promotional offers to the reactivated segment
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/email-promo` — offer for re-engaged subscribers
- `/hook-battery` — generate re-engagement hooks
- `/welcome-sequence` — restart if fully lapsed
- `/rmbc-copy-audit` — score sequence quality

### RMBC Completeness

Always deliver the full framework implementation. AI makes the marginal cost of completeness near-zero:
- Include ALL hook types (not just 2-3)
- Cover ALL awareness levels (not just most-aware)
- Handle ALL major objections (not just the obvious ones)
- Show the mechanism (not just the result)

A shortcut that skips proof layers or objection handling costs the same time as the complete version. Always deliver complete.

### Completion Protocol

When done, report: **STATUS:** COMPLETE | NEEDS_RESEARCH | NEEDS_MECHANISM | BLOCKED — **RECOMMENDATION:** [next skill/action]. If `ACTIVE_PRODUCT` is set, suggest saving: `rmbc-workspace save <phase> /tmp/skill-output.md`

### Prerequisite Detection

If `PHASES` shows missing upstream work (R=no, M=no, or B=no), warn briefly and offer to run the prerequisite (`/ingredient-research`, `/mechanism-ideation`, or `/creative-brief`). Present "[Run prerequisite] [Skip — generate anyway]" via AskUserQuestion. Never block.

### Eureka Logging

If you discover a result contradicting conventional DR copywriting wisdom, log it:
```bash
"$_RMBC_ROOT/bin/rmbc-analytics" eureka log '{"skill":"reengagement-sequence","product":"PRODUCT","insight":"DESCRIPTION","conventional":"WHAT_WAS_EXPECTED","evidence":"WHAT_WAS_OBSERVED"}'
```
Only log genuine surprises — not every result.

### Sequence Coherence Check

Before delivering, verify:
- [ ] Tone consistency across all emails (no jarring shifts)
- [ ] Escalation arc (urgency/value builds across sequence)
- [ ] CTA progression (soft → medium → hard across emails)
- [ ] No repeated hooks/angles between emails
- [ ] Each email can stand alone (reader may skip earlier ones)

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.

