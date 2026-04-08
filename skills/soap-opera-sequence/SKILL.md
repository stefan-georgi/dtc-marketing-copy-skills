---
name: soap-opera-sequence
description: Generate a soap opera email sequence (5-7 emails) that uses narrative tension and cliffhangers to build desire and drive conversions through RMBC-structured storytelling.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "soap-opera-sequence" --product "${_ACTIVE_PRODUCT:-none}" --tier 4 2>/dev/null &
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

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Soap opera sequences deploy RMBC through narrative — the framework is invisible to the reader but structures every story beat. The mechanism reveal is the story's climax, not a sales pitch.

### Step 2 — Map the Narrative Arc

| Email | Story Beat | Dramatic Purpose | Cliffhanger Type |
|-------|-----------|-----------------|-----------------|
| 1 — Backstory | Set the scene, introduce the protagonist's struggle | Identification — reader sees themselves | "But then something happened that changed everything..." |
| 2 — High Drama | The crisis point — things get worse before they get better | Tension — stakes are raised | "I was about to give up when I noticed something strange..." |
| 3 — Epiphany | The discovery moment — mechanism revealed through story | Revelation — the key insight clicks | "But what I discovered next was even more surprising..." |
| 4 — Hidden Benefits | Unexpected advantages beyond the main promise | Desire expansion — more reasons to want this | "And that wasn't even the best part..." |
| 5 — Urgency/CTA | The transformation is complete — time to act | Resolution — but only for those who act | Story closes, offer opens, window is finite |

For 6-email sequences: split email 2 into rising tension + crisis point. For 7-email sequences: add a "false solution" email after email 2 (things that didn't work) and a social proof email after email 4.

### Step 2b — Enforce Three-Beat Emotional Arc (RMBC 2)

Every email AND the full sequence follows: HIGH → DOUBT → RESOLUTION.

**Per-email:** All three beats in order. HIGH = 40-50% (dream painting), DOUBT = 20-30% ("But then..."), RESOLUTION = 20-30% (CTA/cliffhanger).

**Sequence arc with matched CTAs:**

| Email | Role | Dominant Beat | CTA Type |
|-------|------|--------------|----------|
| 1 | Dream established | 80% HIGH | Curiosity: "See what happens next" |
| 2 | First doubt | 50% HIGH, 30% DOUBT | Tension: "Don't let this slip away" |
| 3 | Crisis (peak) | 50% DOUBT | Urgency: "I almost gave up — see why I didn't" |
| 4 | Breakthrough | 50% RESOLUTION | Discovery: "See the breakthrough for yourself" |
| 5 | Call to adventure | 80% HIGH+RESOLUTION | Transformation: "Claim your new beginning" |

Never repeat the same CTA style in consecutive emails.

### Step 2c — Urgency-Decay Timing (RMBC 2)

Front-load frequency, then taper. Never space evenly. Emails 1-2 within 48 hours, email 3 on day 3, email 4 on day 5, email 5 on day 7. Gaps must widen as the story resolves.

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
- **Three-beat arc (RMBC 2):** Every email must contain HIGH → DOUBT → RESOLUTION in order. All-positive or all-negative emails fail.
- **Escalating tension (RMBC 2):** Email 3 must be the most tense. Doubt peaks at midpoint, not end.
- **Urgency-decay (RMBC 2):** Emails 1-2 within 48 hours. Gaps must widen across the sequence.
- **Arc-matched CTAs (RMBC 2):** CTA style must match arc position and never repeat consecutively. Generic CTAs fail.

## Related Skills

- Run `/mechanism-ideation` to develop the epiphany moment's mechanism
- Run `/hook-battery` for subject line variations across the sequence
- Run `/lead-writer` for opening line options per email
- Run `/email-promo` for follow-up promotional emails after the sequence
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/welcome-sequence` — pair with onboarding
- `/email-retention-sequences` — continue relationship arc
- `/broadcast-email` — write standalone episodes

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
"$_RMBC_ROOT/bin/rmbc-analytics" eureka log '{"skill":"soap-opera-sequence","product":"PRODUCT","insight":"DESCRIPTION","conventional":"WHAT_WAS_EXPECTED","evidence":"WHAT_WAS_OBSERVED"}'
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

