---
name: upsell-sequence-writer
description: Generate post-purchase email upsell sequences (3-5 emails) that ascend customers from initial purchase to higher-ticket offers using RMBC-structured persuasion.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "upsell-sequence-writer" --product "${_ACTIVE_PRODUCT:-none}" --tier 4 2>/dev/null &
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
# upsell-sequence-writer

## Purpose

Generate a post-purchase email sequence (3-5 emails) that ascends customers from their initial purchase to a higher-ticket complementary offer. These emails deploy after the buyer has already said yes — trust is established, the product is in hand (or arriving), and the window for ascension is open. Each email must deliver genuine value before bridging to the upsell. The sequence arc moves from gratitude through value delivery to the offer, with urgency closing the window. Every email uses RMBC principles compressed into short-form format.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `initial_product` | Yes | What the customer already purchased — name, price, core promise |
| `upsell_product` | Yes | The higher-ticket offer — name, price, what it does, how it complements the initial purchase |
| `upsell_price` | Yes | Price of the upsell with any discount framing |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, desires, sophistication level |
| `sequence_length` | No | Number of emails: 3, 4, or 5 (default: 5) |
| `key_mechanism` | No | The upsell product's unique mechanism (output from `/mechanism-ideation`) |
| `send_timing` | No | Days between emails (default: Day 1, 3, 5, 7, 9) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Upsell sequences deploy RMBC across multiple touchpoints — Research informs the value content, Mechanism justifies the upsell, Brief structures the sequence arc, Copy executes each email.

### Step 2 — Define the Sequence Arc

Map the emotional journey across the sequence:

| Email | Role | Emotional State | RMBC Focus |
|-------|------|----------------|------------|
| 1 — Thank You | Validate purchase, deliver quick win | Excited, hopeful | Research (reinforce their decision) |
| 2 — Value Delivery | Teach something useful related to their purchase | Engaged, learning | Research → Mechanism tease |
| 3 — Bridge | Connect initial product's limitation to upsell need | Curious, aware of gap | Mechanism reveal |
| 4 — Offer | Present the upsell with full value stack | Desire, trust | Brief → Copy (full pitch) |
| 5 — Urgency Close | Final window, scarcity, guarantee restatement | Fear of missing out | Copy (close) |

For 4-email sequences: combine emails 1+2 and keep 3, 4, 5.

### Step 2b — Map Emails to Upsell Categories (RMBC 2)

Minimum 4 emails. Each mapped to a distinct category with matched CTAs:

| Email | Category | Hook | CTA Style |
|-------|----------|------|-----------|
| 1 | Reaffirmation | Celebrate purchase, reinforce mechanism | No upsell CTA |
| 2 | More of Same | "Here's how to accelerate your results" | "Lock in faster progress" |
| 3 | New Problem | "There's something else you should know..." | "Claim your protection" |
| 4 | Expanded Problem | "What happens if you don't follow through?" | "Complete your transformation" |

For 5-email sequences: add urgency email ("Claim your supply before [deadline]").

### Step 2c — Doubt-Insertion Technique (RMBC 2)

In emails 2-4+, after painting the dream: (1) insert a specific doubt/threat, (2) resolve with CTA. The doubt must reference actual risks or data — not generic FUD.

### Step 2d — Front-End Product Protection (RMBC 2)

**HARD RULE: The front-end product is NEVER the problem.** Upsell solves external threats only. No generic "Buy Now" CTAs — action-benefit language required.

### Step 3 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, mobile-optimized)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** appropriate to the email's position (soft early, hard late)

Rules per email position:
- **Emails 1-2:** No selling. Pure value delivery. Build goodwill.
- **Email 3:** Bridge only. Reveal the gap, tease the solution. Soft CTA at most.
- **Email 4:** Full offer with mechanism, value stack, price anchoring, guarantee.
- **Email 5:** Urgency, deadline, guarantee restatement, final CTA. Short and direct.

### Step 4 — Validate Sequence Coherence

Read all emails in order. Check:
1. Does each email build on the previous? No redundant points.
2. Does the value-to-pitch ratio feel earned? (At least 2 value emails before the offer)
3. Does the urgency in the final email feel real? (Deadline, limited quantity, or price increase)
4. Could a reader skip to email 4 and still understand the offer? (It must standalone too)

## Output Format

```
## Upsell Sequence: [Initial Product] → [Upsell Product]

**Sequence Length:** [3-5] emails
**Send Schedule:** [Day 1, Day 3, Day 5, ...]
**Audience:** [target audience summary]

---

### Email 1: [Role Label] — Day [X]

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body]

[CTA or sign-off appropriate to position]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Sequence Strategy Notes

- **Value-to-pitch ratio:** [X value emails : Y pitch emails]
- **Mechanism reveal timing:** Email [X] — [why this timing]
- **Urgency type:** [deadline | limited quantity | price increase | bonus expiration]
- **Standalone test:** Email [4] works as a standalone pitch: [yes/no + why]
```

## Quality Criteria

- First 1-2 emails must deliver genuine value — no selling, no "by the way" pitches
- Each email must have a clear single purpose aligned to its arc position
- Subject lines must be under 50 characters and work on mobile
- The bridge email (3) must make the upsell feel like a logical next step, not a random offer
- Offer email (4) must work as a standalone pitch if read in isolation
- Urgency in final email must be real — name the specific deadline, quantity, or trigger
- Sequence must feel like a relationship, not a drip campaign of pitches

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)
- **Minimum 4 emails (RMBC 2):** Each mapped to a distinct upsell category. Fewer than 4 or duplicate categories = fail.
- **Doubt-insertion (RMBC 2):** Emails 2-4+ must contain a specific doubt/threat between dream-painting and CTA. Generic fear fails.
- **Front-end protection (RMBC 2):** No email may imply the front-end product is insufficient. Upsell solves external threats only.
- **Action-benefit CTAs (RMBC 2):** Category-matched action-benefit language required. Generic CTAs = fail.

## Related Skills

- Run `/mechanism-ideation` for the upsell product's mechanism
- Run `/upsell-script` for the immediate post-purchase OTO page (before this sequence)
- Run `/email-promo` for standalone promotional emails outside a sequence
- Run `/hook-battery` for subject line inspiration
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/upsell-script` — refine individual upsell offers
- `/email-retention-sequences` — build retention after upsell
- `/post-purchase-sequence` — align with post-purchase flow

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
"$_RMBC_ROOT/bin/rmbc-analytics" eureka log '{"skill":"upsell-sequence-writer","product":"PRODUCT","insight":"DESCRIPTION","conventional":"WHAT_WAS_EXPECTED","evidence":"WHAT_WAS_OBSERVED"}'
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

