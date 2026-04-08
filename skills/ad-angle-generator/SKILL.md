---
name: ad-angle-generator
description: Generate 5-7 unique ad angles for paid media campaigns — each a full strategic positioning direction with headline, body, visual, and platform fit.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "ad-angle-generator" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# ad-angle-generator

## Purpose

Generate 5-7 unique ad angles for paid media campaigns. An angle is NOT a hook or a headline — it's a strategic positioning direction that determines how the entire ad frames the product. Each angle is a different lens through which the same product appeals to the same audience. One angle might lead with fear of the problem, another with social proof, another with a contrarian challenge to conventional wisdom. The output includes: angle name, target emotion, headline direction, body copy direction, visual direction, and platform fit (Meta, YouTube, Native). This gives media buyers a complete creative brief per angle.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `key_mechanism` | Yes | The product's unique mechanism (output from `/mechanism-ideation`) |
| `competitors` | No | Named competitors or common alternatives the audience considers |
| `winning_angles` | No | Any angles that have worked before (so we don't duplicate but can iterate) |
| `budget_tier` | No | One of: `testing` (broad angles), `scaling` (refine winners), `mature` (find new veins). Default: `testing` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Ad angles sit upstream of copy — they determine which RMBC elements get emphasized. A fear angle emphasizes Research (problem), a mechanism angle emphasizes Mechanism (solution), a proof angle emphasizes social validation.

### Step 2 — Identify Angle Fuel

From inputs, extract:
- **Pain points** — Problems the audience actively searches for solutions to
- **Desires** — Outcomes they fantasize about but haven't achieved
- **Objections** — Reasons they haven't bought yet (skepticism, past failures, price)
- **Enemy** — What or who they blame for the problem (bad advice, industry, habit)
- **Identity** — How they see themselves or want to be seen
- **Mechanism hooks** — What's unique about HOW this product works

### Step 3 — Generate 5-7 Angles

Each angle must be a distinct strategic direction. Use this taxonomy to ensure variety:

| Angle Type | Core Strategy | Emotional Lever |
|------------|--------------|----------------|
| **Problem-Aware** | Lead with the pain they know they have | Fear, frustration |
| **Mechanism-Led** | Lead with HOW it works (the "secret") | Curiosity, intrigue |
| **Proof-Stacked** | Lead with results others have achieved | Trust, desire |
| **Enemy** | Lead with what's been holding them back | Anger, vindication |
| **Contrarian** | Challenge what they've been told works | Surprise, rebellion |
| **Identity** | Lead with who they'll become | Aspiration, belonging |
| **Comparison** | Lead with why alternatives fail | Logic, superiority |

Generate at least 5 angles. Include at least 4 different types from the taxonomy. No two angles should use the same emotional lever.

### Step 4 — Flesh Out Each Angle

For each angle, provide:

1. **Angle Name** — A short internal label (e.g., "The Betrayal Angle", "The Insider Secret")
2. **Target Emotion** — The primary emotion this angle activates
3. **Headline Direction** — 2-3 sample headlines that demonstrate this angle (not final copy — directional)
4. **Body Copy Direction** — 2-3 sentences describing what the body copy should cover and in what order
5. **Visual Direction** — What the thumbnail/image/video opening should show
6. **Platform Fit** — Which platforms this angle works best on and why:
   - **Meta (FB/IG):** Scroll-stop visual + short text. Works for: high-emotion, visual angles
   - **YouTube:** First 5 seconds hook + longer story. Works for: mechanism, proof, story angles
   - **Native/Advertorial:** Editorial tone, curiosity-driven. Works for: contrarian, enemy, mechanism angles

### Step 5 — Rank and Recommend

Rank all angles by:
- **Test priority** — Which to test first given the budget tier
- **Creative difficulty** — How hard each is to produce (some need video, some work as static)
- **Fatigue risk** — How quickly the angle will wear out (broad angles fatigue slower)

## Output Format

```
## Ad Angles: [Product Name]

**Audience:** [target audience summary]
**Mechanism:** [key mechanism name]
**Budget Tier:** [testing | scaling | mature]
**Angles Generated:** [5-7]

---

### Angle 1: [Angle Name] — [Angle Type]

**Emotion:** [primary emotion]

**Headline Direction:**
- "[sample headline 1]"
- "[sample headline 2]"

**Body Copy Direction:**
[2-3 sentences on what the body should cover]

**Visual Direction:**
[What to show — thumbnail, opening frame, image style]

**Platform Fit:**
- Meta: [fit rating + why]
- YouTube: [fit rating + why]
- Native: [fit rating + why]

---

[...repeat for each angle...]

---

## Testing Roadmap

| Priority | Angle | Platform | Creative Type | Fatigue Risk |
|----------|-------|----------|--------------|-------------|
| 1 | [name] | [platform] | [static/video/carousel] | [low/med/high] |
| 2 | [name] | [platform] | [static/video/carousel] | [low/med/high] |
| ... | ... | ... | ... | ... |

## Creative Notes

- **Fastest to produce:** Angle [X] — [why: static image, simple concept]
- **Highest ceiling:** Angle [X] — [why: strongest emotion, most mechanism-driven]
- **Best for scaling:** Angle [X] — [why: broad appeal, low fatigue risk]
```

## Quality Criteria

- At least 4 different angle types from the taxonomy — no clustering on one type
- No two angles should use the same primary emotional lever
- Headline directions must be specific enough to write from, not "something about the product"
- Visual direction must be producible — no "cinematic drone shot of transformation" for a $500 test budget
- Platform fit must include genuine reasoning, not "works everywhere"
- Testing roadmap must account for budget tier (testing = broad first, scaling = iterate winners)
- Each angle must be distinct enough that a media buyer could create separate ad sets from them

- **Specificity gate:** Every angle must include a number, name, or timeframe — no "better results" or "improve performance"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Each angle must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** Each angle must pre-empt at least 1 likely prospect objection ("too expensive", "won't work for me", "I've tried this") with a concrete counter built into the positioning

## Related Skills

- Run `/mechanism-ideation` first to develop the core mechanism (required input)
- Run `/hook-battery` to generate specific hooks within each winning angle
- Run `/unified-research-synthesizer` for audience language and competitor positioning
- Write ads from winning angles using `/lead-writer` or `/advertorial-writer`
- Validate angle-driven copy with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/fb-ad-copy` — turn angles into full ads
- `/hook-battery` — generate hooks per angle
- `/creative-brief` — brief the winning angle

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

