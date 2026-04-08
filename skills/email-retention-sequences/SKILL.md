---
name: email-retention-sequences
description: Generate retention/nurture email sequences (5-7 emails) to reduce churn, reinforce purchase decisions, and increase customer lifetime value using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "email-retention-sequences" --product "${_ACTIVE_PRODUCT:-none}" --tier 4 2>/dev/null &
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
# email-retention-sequences

## Purpose

Generate a retention email sequence (5-7 emails) for existing customers that reduces churn and increases lifetime value. Unlike upsell sequences, retention emails are NOT about selling the next thing — they're about making the current purchase successful. The sequence reinforces the buying decision, delivers usage value, builds relationship, surfaces wins, and prevents cancellation before it starts. RMBC principles apply differently here: Research drives personalization, Mechanism explains how to get results, Brief structures the nurture arc, Copy executes with warmth over urgency.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | The product the customer owns — name and core promise |
| `target_audience` | Yes | Who the customer is — demographics, goals, experience level |
| `key_benefits` | Yes | Top 3-5 benefits the product delivers when used correctly |
| `subscription_model` | Yes | One of: `one-time` (prevent refunds, encourage repeat purchase) or `subscription` (prevent cancellation) |
| `sequence_length` | No | Number of emails: 5, 6, or 7 (default: 7) |
| `churn_triggers` | No | Known reasons customers leave — objections, confusion points, competitor pull |
| `send_timing` | No | Days between emails (default: Day 1, 3, 7, 14, 21, 30, 45) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Retention sequences invert the typical RMBC sales arc — instead of moving toward a purchase, they reinforce an existing one. Mechanism explains HOW to get results, not WHY to buy.

### Step 2 — Map the Retention Arc

| Email | Role | Emotional Need | Focus |
|-------|------|---------------|-------|
| 1 — Welcome/Onboard | Set expectations, quick win | Excited but unsure | Show them step 1 — reduce overwhelm |
| 2 — Quick Win | Deliver the fastest visible result | Needs early proof it works | One specific action → one specific result |
| 3 — Deeper Value | Teach an advanced use case or hidden feature | Curious, engaged | Mechanism: HOW the product works behind the scenes |
| 4 — Social Proof | Show other customers' wins | Needs validation | Stories of people like them succeeding |
| 5 — Objection Preempt | Address the #1 reason people quit | Doubt creeping in | Name the objection, resolve it directly |
| 6 — Milestone Check | Celebrate progress, survey for feedback | Wants acknowledgment | "You've been with us X days — here's what you've achieved" |
| 7 — Renewal/Advocacy | Reinforce commitment, invite community or referral | Loyal, ready to advocate | Subscription: renewal framing. One-time: referral or repeat |

For 5-email sequences: combine 2+3 and 5+6. For 6-email sequences: combine 5+6.

### Step 3 — Adapt for Subscription vs One-Time

**Subscription model adjustments:**
- Email 5 must address cancellation directly: "Thinking about canceling? Here's what you'd lose"
- Email 7 frames renewal: "Your next billing cycle starts [date] — here's what's coming"
- Urgency = loss aversion (what they lose), not scarcity

**One-time model adjustments:**
- Email 5 addresses buyer's remorse: "Was this the right choice? Let's look at the evidence"
- Email 7 frames repeat purchase or referral: "Know someone who needs this?"
- Urgency = results timeline (they need to USE the product to get value)

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, warm tone — not salesy)
- **Preview text** (40-90 characters)
- **Body copy** following the email's role from the arc
- **CTA** — always a value action (use the product, read a guide, reply with feedback), never a purchase CTA until email 7

Rules:
- Tone: helpful, warm, peer-to-peer. Not salesy. These people already bought.
- Short paragraphs: 1-3 sentences. Retention emails compete with inbox fatigue.
- Every email must give them a reason to USE the product — not just read the email.
- Personalization cues: reference their purchase, their timeline, their likely stage.

### Step 5 — Validate Anti-Churn Coverage

Check that the sequence addresses:
1. Early overwhelm (emails 1-2)
2. "Is this working?" doubt (emails 3-4)
3. Active cancellation consideration (email 5)
4. Relationship deepening (emails 6-7)

If any stage is missing, revise.

## Output Format

```
## Retention Sequence: [Product Name]

**Model:** [one-time | subscription]
**Sequence Length:** [5-7] emails
**Send Schedule:** [Day 1, 3, 7, ...]
**Audience:** [target audience summary]

---

### Email 1: [Role Label] — Day [X]

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body]

[Value CTA — action to take with the product]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Retention Strategy Notes

- **Churn window:** Highest risk at Day [X] — Email [Y] addresses this
- **Key objection handled:** Email [5] — [the specific objection]
- **Subscription/one-time adaptation:** [how email 7 differs by model]
- **Success metric:** [what to measure — open rate, product usage, reply rate, churn rate]
```

## Quality Criteria

- No selling in emails 1-6 — pure value delivery and relationship building
- Every email must include a specific action the customer can take with the product
- Subject lines must feel personal and warm — not promotional
- Email 5 must name the actual objection/cancellation reason — not a vague "still happy?"
- Social proof in email 4 must feature customers similar to the target audience
- Sequence must adapt clearly between subscription and one-time models
- Tone must be peer-to-peer throughout — never "Dear Valued Customer"

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/upsell-sequence-writer` AFTER retention sequence (ascend only after value is delivered)
- Run `/email-promo` for promotional emails to retained customers
- Run `/mechanism-ideation` to explain how the product works (feeds email 3)
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/upsell-sequence-writer` — ascend after retention
- `/email-promo` — promote to retained customers
- `/welcome-sequence` — build onboarding flow
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
"$_RMBC_ROOT/bin/rmbc-analytics" eureka log '{"skill":"email-retention-sequences","product":"PRODUCT","insight":"DESCRIPTION","conventional":"WHAT_WAS_EXPECTED","evidence":"WHAT_WAS_OBSERVED"}'
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

