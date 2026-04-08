---
name: post-purchase-sequence
description: Generate a 4-5 email post-purchase sequence that reduces buyer's remorse, increases product usage, generates reviews, and sets up the next purchase using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "post-purchase-sequence" --product "${_ACTIVE_PRODUCT:-none}" --tier 4 2>/dev/null &
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
# post-purchase-sequence

## Purpose

Generate a post-purchase email sequence (4-5 emails) that maximizes customer lifetime value by guiding buyers from order confirmation through product mastery to repeat purchase. The post-purchase window is the most underleveraged moment in email marketing — the buyer just trusted you with their money and attention is at peak. This sequence reduces refund rates, increases product usage (which drives results, which drives reviews), generates social proof, and primes the next sale. RMBC applies as value delivery architecture: Research identifies usage barriers, Mechanism explains how to get results, Brief structures the onboarding arc, Copy executes with support and warmth.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Name and core promise of the purchased product |
| `target_audience` | Yes | Who the buyer is — demographics, goals, experience level |
| `usage_instructions` | Yes | Key steps to use the product effectively — the "how to get results" guide |
| `complementary_products` | Yes | 1-3 products that pair with the purchase for cross-sell in final email |
| `sequence_length` | No | Number of emails: 4 or 5 (default: 5) |
| `review_platform` | No | Where to leave reviews — Amazon, Trustpilot, website, Google (default: `website`) |
| `delivery_timeline` | No | Expected shipping/delivery window (default: `3-5 business days`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Post-purchase sequences flip RMBC from persuasion to fulfillment — the sale is made, now the framework ensures the product delivers on its promise. Mechanism explains HOW to get results. Proof is generated (reviews), not deployed.

### Step 2 — Map the Post-Purchase Arc

| Email | Timing | Role | Focus |
|-------|--------|------|-------|
| 1 — Confirmation | Day 0 | Validate the purchase, set expectations | Order details, delivery timeline, what to expect, immediate quick win |
| 2 — Usage Tips | Day 3-5 | Teach them how to get results | Top 3 usage tips, common mistakes to avoid, "do this first" action |
| 3 — Results Check-In | Day 10-14 | Ask how it's going, provide support | Check on their experience, offer help, deepen engagement |
| 4 — Review Request | Day 21-30 | Ask for a review at peak satisfaction | Specific review prompt, make it easy (direct link), show gratitude |
| 5 — Cross-Sell | Day 30-45 | Introduce complementary product | "Based on your purchase, you might also like..." — value-first bridge |

For 4-email sequences: combine emails 3+4 (check-in + review request in one email).

### Step 3 — Calibrate Tone by Phase

| Phase | Emails | Tone | What to Avoid |
|-------|--------|------|---------------|
| Onboarding | 1-2 | Supportive, excited, educational | Selling anything — they just bought |
| Engagement | 3 | Curious, caring, helpful | Pushy follow-up — this is a check-in, not a sales call |
| Proof Generation | 4 | Grateful, specific, easy | Generic "leave a review" — give them a prompt |
| Ascension | 5 | Helpful, relevant, low-pressure | Hard sell — frame as "customers who bought X also loved Y" |

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, warm and non-promotional)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** appropriate to the email's purpose (value action, not purchase — until email 5)

Rules:
- Email 1: Confirm the order, reduce anxiety, deliver one immediate value piece (tip, guide, video).
- Email 2: Practical and actionable — numbered tips, common mistakes, "do this first" guidance.
- Email 3: Genuine check-in — ask how it's going, offer support channels, provide advanced tips.
- Email 4: Make the review request specific — "What result have you noticed?" not "Leave a review."
- Email 5: Cross-sell as recommendation — "Customers who got results with X found that Y accelerated..." — not a cold pitch.
- No selling in emails 1-4. The cross-sell in email 5 must feel earned by the value delivered in 1-4.
- Tone throughout: peer-to-peer, supportive. Never "Dear Valued Customer."

### Step 5 — Validate Post-Purchase Coverage

Check that the sequence addresses:
1. Buyer's remorse prevention (email 1 — immediate value + confirmation)
2. Product usage education (email 2 — they know HOW to succeed)
3. Engagement deepening (email 3 — they feel supported, not abandoned)
4. Social proof generation (email 4 — review captured at peak satisfaction)
5. Revenue expansion (email 5 — cross-sell at natural timing)

If any stage is missing, revise.

## Output Format

```
## Post-Purchase Sequence: [Product Name]

**Sequence Length:** [4-5] emails
**Send Schedule:** Day 0, 3, 14, 25, 35
**Audience:** [target audience summary]
**Review Platform:** [where to leave reviews]

---

### Email 1: Order Confirmation — Day 0

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body — confirmation, expectations, immediate value]

[CTA — value action: read the guide, watch the video, do step 1]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Post-Purchase Strategy Notes

- **Buyer's remorse window:** Day 0-3 — Emails 1-2 address this
- **Peak satisfaction timing:** Day [X] — Review request timed here
- **Cross-sell bridge:** [how email 5 connects the original purchase to the recommendation]
- **Support escalation:** Email 3 offers [support channel] for customers with issues
- **Success metrics:** [refund rate reduction, review count, cross-sell conversion, repeat purchase rate]
```

## Quality Criteria

- Email 1 must confirm the order AND deliver immediate value — not just a receipt
- Usage tips in email 2 must be specific and actionable — numbered steps, not vague advice
- Check-in email must feel genuine — not a scripted "How are you?" that leads to a pitch
- Review request must include a specific prompt — "What's the first result you noticed?" not "Leave a review"
- Cross-sell must connect logically to the original purchase — not a random product push
- No selling in emails 1-4 — pure value delivery, support, and relationship building
- Tone must be warm and supportive throughout — these people trusted you with money
- Review link must go directly to the review form — minimize friction

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/email-retention-sequences` for subscription products needing ongoing retention
- Run `/upsell-sequence-writer` for higher-ticket ascension after this sequence
- Run `/email-promo` for standalone promotions to existing customers
- Run `/mechanism-ideation` to explain how the product works (feeds email 2)
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/upsell-sequence-writer` — build upsell sequence
- `/email-retention-sequences` — continue retention arc
- `/welcome-sequence` — check onboarding alignment

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
"$_RMBC_ROOT/bin/rmbc-analytics" eureka log '{"skill":"post-purchase-sequence","product":"PRODUCT","insight":"DESCRIPTION","conventional":"WHAT_WAS_EXPECTED","evidence":"WHAT_WAS_OBSERVED"}'
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

