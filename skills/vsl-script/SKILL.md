---
name: vsl-script
description: Generate RMBC-structured video sales letter scripts with timing markers — the highest-converting long-form format in direct response.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "vsl-script" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
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

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. VSLs deploy all four RMBC phases sequentially — Research informs the hook and problem section, Mechanism drives the core revelation, Brief structures the argument, Copy executes the persuasion.

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

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/mechanism-ideation` — strengthen mechanism reveal
- `/hook-battery` — test video hooks
- `/lander-copy` — write the host page
- `/rmbc-copy-audit` — score script quality

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

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.

