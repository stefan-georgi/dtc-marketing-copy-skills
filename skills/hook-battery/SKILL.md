---
name: hook-battery
description: Generate 10 scroll-stopping hooks across 5 psychological trigger types — the opening lines that determine whether a prospect reads or scrolls past. One of the 3 core RMBC skills.
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
_ANALYTICS=$(grep '^analytics_enabled:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^analytics_enabled:[[:space:]]*//' || echo "true")
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "hook-battery" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# hook-battery

## Purpose

Generate 10 hooks (2 per type) across 5 psychological trigger categories. A hook is the FIRST thing a prospect sees — the opening line of an ad, email, landing page, or video. It determines whether they engage or scroll past. Stefan's standard: if a hook could apply to any product, it's too generic. Every hook must be specific to the product, reference its mechanism when possible, and work in 1-2 lines on a mobile screen.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `key_mechanism` | No | The product's unique mechanism (output from `/mechanism-ideation`) |
| `key_result` | No | The specific transformation or outcome the product delivers |
| `tone` | No | One of: `aggressive`, `conversational`, `professional` (default: `conversational`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework, including framework overview. Hooks sit at the top of the copy funnel — they must earn the next line of reading.

### Step 2 — Extract Hook Fuel

From inputs, identify:
- **Specific numbers** — stats, timeframes, dollar amounts, percentages
- **Mechanism language** — named processes, compounds, or systems to reference
- **Audience pain language** — exact words the prospect uses to describe their problem
- **Desire language** — exact words the prospect uses to describe their ideal outcome
- **Contrarian angles** — common advice in this space that can be challenged

### Step 3 — Generate 10 Hooks (2 Per Type)

#### Curiosity (×2)
Pattern: Open a knowledge gap the reader must close.
- "The weird trick that..." / "Why [unexpected thing] works better than..."
- Must promise a specific revelation, not vague intrigue

#### Fear (×2)
Pattern: Surface a cost or danger the reader hasn't considered.
- "Are you making this [specific cost] mistake?" / "The hidden danger in..."
- Must name a real, specific threat — not manufactured anxiety

#### Desire (×2)
Pattern: Paint the outcome so vividly the reader self-selects.
- "How to [specific outcome] in [timeframe]" / "What if you could..."
- Must include at least one concrete detail (number, timeframe, or named result)

#### Social Proof (×2)
Pattern: Leverage credibility or crowd behavior.
- "[X] people already..." / "The method [credible person/group] uses to..."
- Must reference a real or plausible proof point — never fabricate

#### Contrarian (×2)
Pattern: Challenge conventional wisdom to stop the scroll.
- "Stop [common advice]" / "Everything you know about [topic] is wrong"
- Must target advice the audience has actually heard and believed

### Step 4 — Validate Each Hook

For every hook, check:
1. **Specificity** — Could this apply to a different product? If yes, rewrite.
2. **Mobile fit** — Does it work in 1-2 lines on a phone screen? If no, shorten.
3. **Mechanism tie-in** — Does it reference the product's mechanism (when provided)? Prefer hooks that do.
4. **Scroll-stop power** — Would this make YOU stop scrolling? Be honest.

## Output Format

```
## Hook Battery: [Product Name]

**Audience:** [target audience summary]
**Mechanism:** [key mechanism, if provided]
**Tone:** [aggressive | conversational | professional]

---

| # | Hook Type | Hook Text | Why It Works | Platform Fit |
|---|-----------|-----------|-------------|-------------|
| 1 | Curiosity | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 2 | Curiosity | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 3 | Fear | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 4 | Fear | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 5 | Desire | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 6 | Desire | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 7 | Social Proof | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 8 | Social Proof | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 9 | Contrarian | [hook] | [1 line] | Meta / Native / Email / YouTube |
| 10 | Contrarian | [hook] | [1 line] | Meta / Native / Email / YouTube |

---

## Top 3 Picks

1. **Hook #X** — [why this is the strongest] — Best for: [platform]
2. **Hook #X** — [why] — Best for: [platform]
3. **Hook #X** — [why] — Best for: [platform]

## Testing Notes

[1-2 lines on which hooks to A/B test first and why]
```

## Quality Criteria

- At least 4 of 10 hooks should reference the product's mechanism (when provided)
- Platform Fit must vary — not all hooks suit all platforms
- Hooks must be mobile-first: 1-2 lines max on a phone screen
- Each "Why It Works" must name the psychological lever, not restate the hook
- **Specificity gate:** Every hook must include a number, name, or timeframe — no "improve your life" or "get better results"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Hooks must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** Hooks must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)
- **Sensory language:** At least 3 of 10 hooks must include sensory language — what the reader physically feels, sees, or hears in the problem state or the solution state (e.g., "that grinding sound in your knee every morning" or "climbing stairs without wincing for the first time in years"). Abstract pain descriptions ("joint discomfort", "mobility issues") do not count. Sensory hooks create visceral identification that demographic descriptions cannot match.

## Related Skills

- Run `/mechanism-ideation` first for mechanism-driven hooks
- Run `/unified-research-synthesizer` for audience language patterns
- Feed hooks into copy formats: `/pdp-ecomm-template`, `/webinar-registration-copy`
- Validate copy using these hooks with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/mechanism-ideation` — if you don't have a named mechanism yet
- `/fb-ad-copy` — turn hooks into full Meta ads
- `/rmbc-copy-audit` — score output against RMBC quality dimensions

### RMBC Completeness

Always deliver the full framework implementation. AI makes the marginal cost of completeness near-zero:
- Include ALL hook types (not just 2-3)
- Cover ALL awareness levels (not just most-aware)
- Handle ALL major objections (not just the obvious ones)
- Show the mechanism (not just the result)

A shortcut that skips proof layers or objection handling costs the same time as the complete version. Always deliver complete.

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.

