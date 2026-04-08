---
name: lander-copy
description: Generate RMBC-structured landing page copy — mobile-first, conversion-optimized, with value-stack pricing and full page architecture.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "lander-copy" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
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
# lander-copy

## Purpose

Generate complete landing page copy structured around RMBC principles. Landing pages are where traffic converts — every element must earn its place. Mobile-first is non-negotiable: 80-90% of DTC traffic arrives on phones. This skill outputs full page copy with section-by-section structure, ready for a designer or page builder. Enforces value-comparison pricing (anchor high, reveal real price as contrast) and includes all conversion elements: social proof, guarantee, FAQ, and multiple CTAs.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `price_point` | Yes | Product price, payment plans, and any discounts |
| `traffic_source` | Yes | Where traffic comes from: `paid_social`, `native`, `search`, `email`, `organic` |
| `key_mechanism` | Yes | The product's unique mechanism (output from `/mechanism-ideation`) |
| `guarantee` | No | Money-back guarantee details (default: assume 60-day guarantee) |
| `proof_points` | No | Testimonials, reviews, clinical data, media mentions |
| `page_type` | No | One of: `long_form` (full sales page), `short_form` (squeeze/lead gen), `hybrid` (default: `long_form`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Landing pages deploy RMBC in a scrollable format — each section maps to a phase: Research informs audience targeting and proof selection, Mechanism drives the core value proposition, Brief structures the page architecture, Copy executes each section.

### Step 2 — Define Page Architecture

Map sections based on `page_type`:

#### Long Form (Full Sales Page)

| Section | Mobile Screens | Purpose |
|---------|---------------|---------|
| Hero | 1 | Headline + subhead + CTA + hero image |
| Problem | 1-2 | Agitate pain, build urgency |
| Failed Solutions | 1-2 | Disqualify alternatives using a comparison table: columns = Approach / How It Works / Why It Fails, with rows for 3 common alternatives the audience has tried. End with a row for the product's approach showing "Why It Wins." Visual comparison tables create instant comprehension and position the product as the only rational choice. |
| Mechanism Reveal | 2-3 | Introduce unique mechanism with visual |
| Features → Benefits | 2-3 | Translate features into outcomes |
| Social Proof Block 1 | 1-2 | Testimonials or case studies |
| Value Stack | 1-2 | List everything they get with anchor pricing |
| Price Reveal | 1 | Contrast anchor vs actual price |
| Guarantee | 1 | Risk reversal |
| Social Proof Block 2 | 1 | Additional proof (different type from Block 1) |
| FAQ | 1-2 | Handle remaining objections |
| Final CTA | 1 | Restate offer, guarantee, urgency |

#### Short Form (Squeeze/Lead Gen)
Hero → Problem (brief) → Solution Promise → CTA → Social Proof → CTA

### Step 3 — Write Each Section

Rules for all sections:
- **One idea per mobile screen.** If a section runs long, break it into sub-sections.
- **Headlines for every section.** Scanners read headlines only — each must standalone.
- **CTAs appear 3+ times** on long-form pages (hero, mid-page, final).
- **Value stack must anchor high.** Total perceived value should be 5-10x the actual price.
- **Price reveal uses contrast framing.** "Not $297... not $197... just $97 today."

Section-specific guidance:
- **Hero:** Headline states the outcome. Subhead names the mechanism. CTA is visible without scrolling.
- **Problem:** Deploy a 3-step agitation protocol — do not stop at surface-level pain. Each step must be a distinct sub-section with its own subheadline:
  1. **Surface Pain** — the obvious problem the reader already knows about and experiences daily. Use their own language. Be viscerally specific.
  2. **Hidden Cost** — the non-obvious downstream cost they haven't calculated. What is this problem costing them in money, relationships, opportunities, or identity that they haven't connected yet? Name the dollar amount or life impact.
  3. **Future Consequence** — what happens if they do nothing for the next 6-12 months. Paint the specific, worsening trajectory. Make inaction feel like a decision with concrete consequences, not just a passive default.
- **Mechanism:** Explain WHY this works, not just WHAT it does. Use analogy or metaphor.
- **Features → Benefits:** 3-column or icon grid. Each feature gets a "which means..." benefit translation.
- **Social Proof:** Mix types — testimonial quotes, star ratings, logos, numbers ("10,000+ customers").
- **FAQ:** 5-7 questions. Each answer is a disguised objection handler.

### Step 4 — Traffic Source Alignment

Adjust copy tone and structure for traffic source:
- **Paid Social:** Hook-heavy hero, shorter sections, more visual cues
- **Native:** Editorial tone in hero, softer sell, more proof
- **Search:** Intent-matched headline, features prominent, comparison-friendly
- **Email:** Assumes pre-awareness, can skip problem section, go straight to offer
- **Organic:** SEO-friendly headlines, longer mechanism section, educational tone

## Output Format

```
## Landing Page: [Product Name]

**Page Type:** [long_form | short_form | hybrid]
**Traffic Source:** [source]
**Price:** [price point]
**Guarantee:** [guarantee summary]

---

### SECTION 1: HERO
**Headline:** [headline]
**Subhead:** [subhead]
**CTA Button:** [button text]
**Supporting text:** [1-2 lines below CTA]

---

### SECTION 2: PROBLEM
**Section Headline:** [headline]
[Copy — 100-200 words]

---

[...continue for each section...]

---

### VALUE STACK

| What You Get | Value |
|-------------|-------|
| [Item 1] | $XX |
| [Item 2] | $XX |
| [Item 3 — Bonus] | $XX |
| **Total Value** | **$XXX** |
| **Today's Price** | **$XX** |

---

## Page Summary

- **Total sections:** X
- **Estimated word count:** X,XXX
- **CTA placements:** 3 (hero, mid-page, final)
- **Mobile screens:** ~XX
```

## Quality Criteria

- Hero headline must communicate the core outcome in under 10 words
- No section should require more than 2 thumb-scrolls on mobile
- Value stack total must be 5-10x the actual price — if not, add bonuses
- Every CTA button must use action language ("Get [Result] Now"), never generic ("Submit", "Click Here")
- FAQ must address price objection, skepticism objection, and "is this for me?" objection
- Social proof must appear before AND after the price reveal

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` for the core mechanism
- Run `/hook-battery` for hero headline options
- Run `/lead-writer` for alternative hero section approaches
- Drive traffic to this page from `/advertorial-writer` or `/email-promo`
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/hook-battery` — generate page hooks
- `/mechanism-ideation` — strengthen mechanism section
- `/order-form-cro` — optimize the checkout
- `/rmbc-copy-audit` — score page quality

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

