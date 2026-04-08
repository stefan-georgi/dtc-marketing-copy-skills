---
name: competitor-offer-analysis
description: Analyze competitor offers to find positioning gaps — break down pricing, guarantees, bonuses, mechanism claims, proof elements, and weaknesses to generate differentiation recommendations.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "competitor-offer-analysis" --product "${_ACTIVE_PRODUCT:-none}" --tier 1 2>/dev/null &
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
# competitor-offer-analysis

## Purpose

Analyze competitor offers to find positioning gaps and differentiation opportunities. This is the competitive intelligence arm of RMBC Research — Step 2 (Competitor Analysis) from the 4-step research framework. Most brands compete on surface features and price. RMBC-driven analysis goes deeper: what mechanism does each competitor claim, how do they prove it, where is their offer architecture weak, and what does no one in the market say that your prospect needs to hear? Output: per-competitor offer breakdown, competitive landscape summary, gap opportunities, and positioning recommendations for differentiation.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | Your product — what it does, key features, price point, mechanism (if defined) |
| `competitors` | Yes | List of competitor names and/or URLs (minimum 2, ideally 3-5) |
| `target_audience` | Yes | Shared ICP — demographics, pain points, desires, awareness level |
| `your_key_differentiator` | Yes | What you believe makes your offer unique (will be pressure-tested) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Competitor analysis maps directly to RMBC Research Step 2 — studying competing offers, their mechanisms, proof claims, and positioning gaps. The goal is not just to know what competitors do, but to find what they fail to do, fail to say, and fail to prove.

### Step 2 — Build Competitor Profiles

For each competitor, analyze across 7 dimensions:

| # | Dimension | Key Questions |
|---|-----------|--------------|
| 1 | **Offer Architecture** | Core product, price point, offer stack (core + bonuses + add-ons), delivery method |
| 2 | **Mechanism Claims** | Primary mechanism, specificity (vague vs concrete), "only we" test, RMBC novelty score (0-25) |
| 3 | **Proof Elements** | Proof types (clinical, testimonial, expert, media, demo, data), quality, gaps, RMBC believability score (0-25) |
| 4 | **Guarantee** | Terms (duration, conditions), strength (unconditional vs conditional), positioning (prominent vs buried) |
| 5 | **Bonuses** | What's included, relevance to core offer, filler quality assessment |
| 6 | **Copy & Positioning** | Lead type, tone, awareness level targeting, CTA approach |
| 7 | **Weaknesses** | Offer gaps, proof gaps, mechanism gaps, experience gaps (onboarding, support, results) |

### Step 3 — Map the Competitive Landscape

Synthesize individual profiles into a landscape view:

| Dimension | Competitor A | Competitor B | Competitor C | Your Offer |
|-----------|-------------|-------------|-------------|-----------|
| Price | | | | |
| Mechanism | | | | |
| Proof depth | | | | |
| Guarantee | | | | |
| Bonuses | | | | |
| CTA/Urgency | | | | |

Identify patterns:
- **Market consensus:** What does every competitor do the same way?
- **Market gaps:** What does NO competitor address?
- **Overused claims:** What messages are so common they've lost impact?
- **Underserved objections:** What prospect concerns does no one address?

### Step 4 — Identify Gap Opportunities

Rank the top 3-5 positioning gaps by impact:

For each gap:
1. **The gap** — What's missing from the competitive landscape
2. **Why it matters** — How this gap affects the prospect's buying decision
3. **Your ability to fill it** — Can your product/offer genuinely own this position?
4. **Implementation** — What changes to your offer, copy, or proof would claim this gap
5. **Risk** — What happens if a competitor fills this gap first

### Step 5 — Pressure-Test Your Differentiator

Take the user's stated key differentiator and stress-test it:

- **Is it unique?** Can any competitor make the same claim?
- **Is it provable?** Do you have evidence that supports it?
- **Does the audience care?** Is this differentiator relevant to a buying decision?
- **Is it defensible?** Can competitors easily copy or neutralize it?
- **Is it communicable?** Can it be explained in one sentence on a sales page?

If the differentiator fails any test, recommend a stronger positioning angle based on the gap analysis.

## Output Format

```
## Competitor Offer Analysis: [Your Product/Market]

**Competitors Analyzed:** [count]
**Your Differentiator (stated):** [from input]
**Differentiator Status:** VALIDATED / NEEDS STRENGTHENING / REPLACE

---

### COMPETITOR PROFILES

#### [Competitor 1 Name]

| Dimension | Assessment |
|-----------|-----------|
| **Offer** | [core product, price, stack] |
| **Mechanism** | [claim + specificity + uniqueness] |
| **Proof** | [types used + quality + gaps] |
| **Guarantee** | [terms + strength] |
| **Bonuses** | [list + relevance] |
| **Copy approach** | [lead type + tone + awareness level] |
| **Weaknesses** | [offer, proof, mechanism, experience gaps] |

**RMBC Scores:** Mechanism: X/25 | Proof: X/25

---

[...repeat for each competitor...]

---

### COMPETITIVE LANDSCAPE

| Dimension | [Comp A] | [Comp B] | [Comp C] | You |
|-----------|----------|----------|----------|-----|
| Price | | | | |
| Mechanism | | | | |
| Proof | | | | |
| Guarantee | | | | |
| Urgency | | | | |

---

### GAP OPPORTUNITIES (Ranked by Impact)

#### Gap 1: [Name]
- **What's missing:** [description]
- **Why it matters:** [prospect impact]
- **Your ability to fill:** [high/medium/low + why]
- **Implementation:** [what to change]

#### Gap 2: [Name]
[same format]

#### Gap 3: [Name]
[same format]

---

### DIFFERENTIATOR STRESS TEST

| Test | Pass/Fail | Notes |
|------|-----------|-------|
| Unique? | | |
| Provable? | | |
| Audience cares? | | |
| Defensible? | | |
| Communicable? | | |

**Recommendation:** [validate, strengthen, or replace — with specific alternative if needed]

---

### POSITIONING RECOMMENDATIONS

1. **Lead with:** [the strongest gap opportunity your offer can own]
2. **Prove with:** [the proof type competitors underuse]
3. **Differentiate on:** [validated or recommended differentiator]
4. **Avoid:** [overused market claims that have lost impact]
```

## Quality Criteria

- Each competitor must be analyzed across all 7 dimensions — no skipping because information is limited (flag what's unknown instead)
- Mechanism claims must be evaluated for the "only we" test — generic mechanisms that any competitor could claim don't count as differentiation
- Proof evaluation must distinguish between strong (specific, verifiable) and weak (vague, unsubstantiated) evidence
- Gap opportunities must be ranked by impact on buying decisions — not just what's interesting to the analyst
- Differentiator stress test must be honest — a failing differentiator helps more than a validated weak one
- Positioning recommendations must be actionable and specific — "be different" is not a recommendation
- RMBC scores must follow RMBC quality dimensions (0-25 per dimension: result specificity, mechanism novelty, proof believability, CTA clarity) consistently across competitors

- **Specificity gate:** Every finding must include a number, name, or timeframe — no "they perform well" or "strong results"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Each finding must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode

## Related Skills

- Run `/unified-research-synthesizer` to complete the full 4-step RMBC research framework
- Run `/mechanism-ideation` to develop a mechanism that fills identified gaps
- Run `/ad-angle-generator` to create angles that exploit competitor weaknesses
- Run `/pricing-strategy` to position pricing against the competitive landscape
- Run `/offer-stack` to build an offer that addresses gaps competitors miss
- Validate your differentiated positioning with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.
