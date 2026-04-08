---
name: fb-ad-copy
description: Generate RMBC-structured Facebook/Meta ad copy across single image, carousel, and video formats — 3 hook variations per format with character limits enforced.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "fb-ad-copy" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# fb-ad-copy

## Purpose

Generate direct response ad copy for Facebook/Meta campaigns using the RMBC framework. Each output delivers 3 variations (different hooks) for the chosen format — single image, carousel, or video script. Every variation includes primary text, headline, description, and CTA button recommendation with platform character limits enforced.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, awareness level |
| `ad_format` | Yes | One of: `single_image`, `carousel`, `video` |
| `key_mechanism` | Yes | The product's unique mechanism (output from `/mechanism-ideation`) |
| `offer` | Yes | What the prospect gets — price, discount, bonus, guarantee |
| `tone` | No | One of: `aggressive`, `conversational`, `professional`. Default: `conversational` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Facebook ads compress the full RMBC arc into tight space — the hook carries Research (pain/desire), the body reveals Mechanism, proof stacks in mid-copy, and the CTA closes.

### Step 2 — Map Awareness to Copy Length

| Awareness Level | Primary Text Approach |
|----------------|----------------------|
| Unaware | Story/curiosity lead, longer primary text, educate before mechanism |
| Problem-aware | Lead with pain, mechanism as solution, proof to close |
| Solution-aware | Lead with mechanism differentiation, proof-heavy, direct CTA |
| Product-aware | Lead with offer, social proof, urgency |
| Most aware | Lead with new offer/angle, minimal education needed |

### Step 3 — Generate 3 Variations

Each variation uses a different hook type (e.g., curiosity, fear, desire, social proof, contrarian). No two variations should use the same hook type.

#### Character Limits (enforced)

| Element | Visible Limit | Max Limit | Notes |
|---------|--------------|-----------|-------|
| Primary text | 125 chars | 2,200 chars | First 125 visible before "See more" |
| Headline | 40 chars | 255 chars | First 40 visible in feed |
| Description | 30 chars | 255 chars | May not display on all placements |

The first 125 characters of primary text MUST work as a standalone hook — assume most users never click "See more." Structure the first 125 characters as a 3-part pattern: (1) specific stat or contradiction (≤50 chars), (2) mechanism tease or knowledge gap (≤50 chars), (3) implicit promise that rewards reading past "See more" (≤25 chars). Example: "327 patients stopped taking glucosamine. | Their joints got better, not worse. | Here's why →"

#### Format-Specific Requirements

**Single Image:**
- Primary text: Hook + mechanism + proof + CTA (aim for 3-5 short paragraphs)
- Image direction: 1 sentence describing what the static image should convey

**Carousel:**
- Card count: 3-5 cards
- Each card: headline (40 chars) + description (30 chars)
- Card 1: Hook/problem. Card 2-3: Mechanism/proof. Final card: CTA/offer
- Primary text above carousel: condensed hook + mechanism + CTA

**Video:**
- Script outline: Hook (0-3s), problem (3-10s), mechanism (10-25s), proof (25-40s), CTA (40-60s)
- Primary text: Hook + offer summary (viewers may read this instead of watching)
- First 3 seconds must deliver the hook visually and verbally

### Step 4 — CTA Button Recommendation

Select from Meta's CTA options: `Shop Now`, `Learn More`, `Sign Up`, `Get Offer`, `Book Now`, `Contact Us`, `Subscribe`, `Order Now`. Choose based on awareness level and offer type.

## Output Format

```
## Facebook Ad Copy: [Product Name]

**Format:** [single_image | carousel | video]
**Audience:** [target audience summary]
**Awareness Level:** [detected level]
**Offer:** [offer summary]

---

### Variation 1: [Hook Type]

**Primary Text:**
[Full primary text — first 125 chars marked with ||]

**Headline:** [40 chars max]
**Description:** [30 chars max]
**CTA Button:** [Meta CTA option]
[Format-specific elements: image direction / card breakdowns / video script]

---

### Variation 2: [Hook Type]
[Same structure]

---

### Variation 3: [Hook Type]
[Same structure]

---

## Testing Recommendation

| Priority | Variation | Hook Type | Why Test First |
|----------|-----------|-----------|---------------|
| 1 | [#] | [type] | [reasoning] |
| 2 | [#] | [type] | [reasoning] |
| 3 | [#] | [type] | [reasoning] |
```

## Quality Criteria

- First 125 characters of every primary text must stand alone as a compelling hook
- Headline stays under 40 characters — no truncation allowed
- Each variation uses a different hook type — no duplication
- Mechanism is present in every variation, not just features
- CTA is specific with a reason to act now — never "Learn More" without justification
- Carousel cards tell a sequential story — not disconnected slides
- Video scripts have a visual hook in the first 3 seconds

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` first to develop the core mechanism (required input)
- Run `/ad-angle-generator` for strategic angle direction before writing ad copy
- Run `/hook-battery` to generate hook candidates to test across variations
- Validate finished ads with `/ad-creative-audit`
- Build UGC-style video ads with `/ugc-brief`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/hook-battery` — generate more opening hooks
- `/ad-angle-generator` — explore new creative angles
- `/rmbc-copy-audit` — score against RMBC dimensions

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

