---
name: upsell-script
description: Generate RMBC-structured one-time offer (OTO) / upsell page scripts — post-purchase pages that capitalize on buying momentum with a complementary offer.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "upsell-script" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# upsell-script

## Purpose

Generate a complete upsell / OTO (one-time offer) page script structured around RMBC principles. Upsell pages appear immediately after purchase — the buyer's credit card is still warm, trust is at peak, and buying momentum is highest. The script must be short, urgent, and frictionless. Structure: congratulations on their purchase → "but wait" transition → complementary offer with its own mechanism → price anchoring against the value → single yes/no CTA. No navigation, no distractions — one decision only. Target: 60-90 seconds to read.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `main_product` | Yes | What the customer just purchased — name, price, core promise |
| `upsell_product` | Yes | What you're offering next — name, what it does, how it complements the main product |
| `upsell_price` | Yes | Price of the upsell and any discount framing (e.g., "normally $197, today only $67") |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, desires, sophistication level |
| `key_mechanism` | No | The upsell product's unique mechanism (output from `/mechanism-ideation`) |
| `guarantee` | No | Money-back guarantee details (default: same as main product guarantee) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Upsell scripts compress the full RMBC arc into a single page — Research validates the complementary need, Mechanism justifies urgency, Brief structures the one-page argument, Copy executes with radical brevity.

### Step 2 — Map the Emotional State

The buyer just said yes to the main product. Map their current psychology:
- **Momentum** — They're in buying mode, credit card already entered
- **Trust peak** — They just trusted you with money; reciprocity is high
- **Desire gap** — What adjacent problem does the main product NOT solve?
- **Completion instinct** — How does the upsell complete what they just started?

### Step 3 — Write the Upsell Script

#### Section 1: Congratulations (2-3 sentences)
- Validate their purchase decision
- Reinforce what they're about to receive
- Build excitement about what's coming

#### Section 2: "But Wait" Transition (2-3 sentences)
- Identify the gap — what the main product alone can't do
- Frame it as the ONE thing that could slow their results
- Must feel like a genuine insight, not a sales trick

#### Section 3: Introduce the Upsell (3-5 sentences)
- Name the upsell product
- Connect it directly to the main product's promise
- If mechanism provided: explain WHY they need this NOW (mechanism-driven urgency)
- If no mechanism: use complementary logic ("X works best when paired with Y")

#### Section 4: Price Anchoring (2-3 sentences)
- Anchor against a higher reference price (retail, standalone, competitor)
- Reveal the "today only" price as a sharp contrast
- Frame as a fraction of what they just paid OR fraction of the value received

#### Section 5: Single CTA (yes/no format)
- One button: "Yes, Add [Upsell] To My Order"
- One text link below: "No thanks, I don't want [specific benefit]"
- The "no" text must name what they're declining in benefit language

### Step 4 — Validate Brevity

The entire script must be readable in 60-90 seconds. If any section exceeds its sentence count, cut. The buyer has momentum — don't kill it with length.

## Output Format

```
## Upsell Script: [Upsell Product Name]

**Main Product:** [what they just bought]
**Upsell Product:** [what you're offering]
**Price:** [upsell price with anchoring]
**Read Time:** ~60-90 seconds

---

### CONGRATULATIONS

[2-3 sentences]

### THE GAP

[2-3 sentences — "but wait" transition]

### THE SOLUTION

[3-5 sentences — upsell introduction with mechanism if provided]

### THE PRICE

[2-3 sentences — anchoring and reveal]

### CTA

[YES BUTTON]: "Yes, Add [Product] To My Order — Just $XX"

[NO LINK]: "No thanks, I don't want [specific benefit they're declining]"

---

## Conversion Notes

- **Emotional lever:** [primary emotion driving this upsell]
- **Complement logic:** [how upsell + main product work together]
- **Price psychology:** [why this price point works against the anchor]
```

## Quality Criteria

- Total script must be readable in 60-90 seconds — ruthless brevity
- Congratulations section must validate the main purchase, not sell the upsell yet
- "But wait" transition must feel like genuine insight, not manipulative
- Upsell must logically complement the main product — not a random add-on
- Price anchor must be credible (real retail price, not inflated fiction)
- "No thanks" link must name the specific benefit being declined
- No navigation elements, sidebars, or distractions in the output — single-path page

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` for the upsell product's mechanism
- Run `/lander-copy` for the main product's sales page (feeds the congratulations section)
- Feed into `/upsell-sequence-writer` for post-purchase email follow-up
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/upsell-sequence-writer` — build full upsell sequence
- `/offer-stack` — refine the upsell offer
- `/thank-you-page` — integrate post-purchase

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

