---
name: ugc-brief
description: Generate briefs for UGC creators — script outlines with talking points, hook options, and B-roll suggestions that feel authentic, not scripted.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "ugc-brief" --product "${_ACTIVE_PRODUCT:-none}" --tier 1 2>/dev/null &
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

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.
# ugc-brief

## Purpose

Generate a creator-ready brief for UGC (user-generated content) ads. The output gives a creator everything they need — format type, script outline with talking points, multiple hook options, B-roll suggestions, and do's/don'ts — without making the content feel scripted. UGC works because it looks real. The brief must preserve authenticity while ensuring the RMBC arc (hook, mechanism, proof, CTA) comes through naturally.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires |
| `ugc_format` | Yes | One of: `testimonial`, `unboxing`, `day_in_life`, `problem_solution` |
| `key_talking_points` | Yes | 3-5 points the creator must communicate (mechanism, results, differentiators) |
| `creator_demographic` | Yes | Who the creator should be — age, gender, lifestyle, relatability to audience |
| `platform` | No | Target platform: `meta`, `tiktok`, `youtube_shorts`. Default: `meta` |
| `video_length` | No | Target length: `15s`, `30s`, `60s`, `90s`. Default: `60s` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. UGC is RMBC disguised as casual conversation — Research surfaces as relatable pain, Mechanism as a personal discovery, proof as genuine experience, and CTA as friendly recommendation.

### Step 2 — Select Format Template

| Format | Structure | Best For |
|--------|-----------|----------|
| **Testimonial** | Problem → discovery → experience → result → recommendation | High-awareness audiences, retargeting |
| **Unboxing** | Anticipation → first impression → feature walkthrough → reaction → verdict | Product-aware audiences, new launches |
| **Day-in-Life** | Morning routine → problem moment → product integration → outcome → CTA | Lifestyle products, cold audiences |
| **Problem-Solution** | Problem rant → failed alternatives → discovery → mechanism → result | Problem-aware audiences, competitive markets |

### Step 3 — Write Hook Options

Generate 3 hook options for the creator to choose from. Each hook must:
- Work in the first 2-3 seconds (before the viewer swipes)
- Sound like natural speech, not ad copy
- Create a reason to keep watching (curiosity, relatability, shock)

Example patterns:
- "Okay so I need to talk about..." (confession)
- "I was today years old when I found out..." (discovery)
- "POV: you finally found..." (relatable scenario)
- "Stop scrolling if you..." (direct address)

### Step 4 — Build Script Outline

Structure as talking points, NOT a word-for-word script. Each point is a beat the creator hits in their own words.

**Beat structure (maps to RMBC):**

| Beat | Duration | RMBC Phase | Creator Direction |
|------|----------|-----------|-------------------|
| Hook | 0-3s | — | [Hook option — say this or something like it] |
| Problem | 3-12s | Research | [Describe the pain in your own words — here's what to hit] |
| Discovery | 12-20s | Mechanism | [How you found it and what makes it different — key point to land] |
| Experience | 20-40s | Brief/Copy | [Your actual experience — mention these specific details] |
| Result | 40-50s | Copy | [The outcome — be specific, use a number or timeframe if possible] |
| CTA | 50-60s | Copy | [Recommendation — casual, not salesy — "link in bio" or "I'll leave a link"] |

Adjust beat durations to match `video_length` input.

### Step 5 — Add B-Roll Suggestions

List 4-6 specific B-roll shots that enhance the talking points:
- Product close-ups (texture, packaging, use-in-action)
- Before/after moments (if applicable)
- Lifestyle context shots (kitchen, gym, desk — wherever the product fits)
- Screen recordings (if digital product — app walkthrough, results dashboard)

### Step 6 — Write Do's and Don'ts

**Do's:** Behaviors that keep it authentic.
**Don'ts:** Behaviors that make it look like an ad and kill performance.

## Output Format

```
## UGC Brief: [Product Name]

**Format:** [testimonial | unboxing | day_in_life | problem_solution]
**Creator Profile:** [demographic description]
**Platform:** [meta | tiktok | youtube_shorts]
**Target Length:** [duration]

---

### Hook Options (pick one)

1. "[Hook A]"
2. "[Hook B]"
3. "[Hook C]"

### Script Outline

| Beat | Timing | Direction |
|------|--------|-----------|
| Hook | 0-3s | [talking point — not a script] |
| Problem | 3-12s | [talking point] |
| Discovery | 12-20s | [talking point] |
| Experience | 20-40s | [talking point] |
| Result | 40-50s | [talking point] |
| CTA | 50-60s | [talking point] |

### Key Talking Points (must hit all)
1. [Point — in natural language]
2. [Point]
3. [Point]

### B-Roll Shot List
1. [Shot description + when to cut to it]
2. [Shot description]
3. [Shot description]
4. [Shot description]

### Do's
- [Authentic behavior to encourage]
- [Specific detail to include]

### Don'ts
- [Common mistake that kills UGC performance]
- [Behavior that makes it feel scripted]

---


```

## Quality Criteria

- Script outline uses talking points, never word-for-word scripts — if it reads like ad copy, rewrite it
- Hook options sound like things a real person would say on camera, not headlines
- B-roll suggestions are producible with a phone — no "cinematic transitions" or studio requirements
- Do's/Don'ts are specific to this product and format, not generic UGC advice
- Beat timing adds up to the target video length
- Key talking points embed the mechanism naturally — the creator should sound like they discovered something, not like they're reading a spec sheet

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` first to develop talking points around the mechanism
- Run `/creative-brief` to establish strategic direction before briefing creators
- Run `/hook-battery` for additional hook inspiration adapted to UGC tone
- Run `/ad-angle-generator` to determine which strategic angle the UGC should express
- Validate finished UGC scripts with `/ad-creative-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.
