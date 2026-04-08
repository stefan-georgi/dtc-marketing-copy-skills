---
name: ingredient-research
description: Deep research prompt for supplement/product ingredient evidence — gathers studies, claims, citations, and DR-relevant proof points for the R in RMBC
user-invocable: true
allowed-tools: WebSearch, WebFetch
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "ingredient-research" --product "${_ACTIVE_PRODUCT:-none}" --tier 1 2>/dev/null &
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
# ingredient-research

## Purpose

Systematic ingredient-level research tool for the "R" in RMBC. Gathers clinical studies, dosage data, bioavailability metrics, mechanism of action details, and DR-ready proof points per ingredient. Specificity beats persuasion — "94% improvement in a 30-day double-blind trial (n=120)" converts better than "clinically proven." Output feeds directly into mechanism ideation and copy writing.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Product or brand name |
| `ingredients` | Yes | List of ingredients to research (comma-separated or bulleted) |
| `claims` | No | Specific marketing claims to validate or find evidence for |
| `product_category` | No | `supplement` (default), `skincare`, `food`, `other` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework, including RMBC methodology overview. This skill implements Pillar 4 of the Research phase: Ingredient Research.

### Step 2 — Per-Ingredient Research Loop

For each ingredient in the list, systematically gather:

1. **Identity & Basics**
   - Full compound name, common aliases, standardized form (if applicable)
   - Typical dosage range (clinical vs commercial)
   - Bioavailability considerations (absorption rate, delivery method impact)

2. **Clinical Evidence**
   - Search for: randomized controlled trials, meta-analyses, peer-reviewed studies
   - Capture: author(s), year, journal, sample size, duration, key finding
   - Prioritize: human trials over animal/in-vitro, larger sample sizes, recent studies
   - Note patent numbers and clinical trial IDs (NCT numbers) when found

3. **Mechanism of Action**
   - How the ingredient works at a biological/chemical level
   - Pathway or system it targets (e.g., "inhibits 5-alpha reductase," "upregulates AMPK")
   - Why this mechanism matters to the end consumer (plain-language translation)

4. **DR-Ready Proof Points**
   - Extract specific, citable statistics and outcomes
   - Translate findings into compliant claim language
   - Flag any FTC/FDA compliance considerations for the claim type

5. **Differentiators**
   - Patented or branded forms (e.g., "Bioperine" vs generic black pepper extract)
   - Sourcing or quality markers (organic, wild-harvested, GMP-certified)
   - What makes this ingredient or its form unique vs commodity versions

### Step 3 — Cross-Ingredient Analysis

After individual research, identify:
- Synergistic combinations (ingredients that amplify each other)
- Potential contraindications or redundancies
- Strongest proof cluster (which ingredients carry the most citable evidence)
- Gaps where evidence is thin (flag for mechanism ideation to work around)

### Step 4 — Compile Output

Assemble per-ingredient briefs and cross-ingredient analysis into the output format below.

## Output Format

### Per-Ingredient Research Brief

```
## [Ingredient Name]

**Common dosage range:** [range] | **Form in product:** [if known]

### Key Studies
1. [Author et al., Year] — [Journal/Source]
   Finding: [specific result]
   Sample: n=[size] | Duration: [length] | Type: [RCT/meta-analysis/observational]

2. [repeat for each relevant study, max 5]

### Mechanism of Action
[2-3 sentences: what it does, how, and why that matters]

### DR-Ready Claim Statements
- "[Specific claim with number]" — Source: [citation]
- "[Specific claim with number]" — Source: [citation]
  (Proof strength: Strong / Moderate / Weak)

### Differentiators
- [Patented form, sourcing, or unique quality marker]

### Compliance Notes
- [Any FTC/FDA flags for this ingredient's claims]
```

### Cross-Ingredient Summary

```
## Cross-Ingredient Analysis

**Synergies:** [which ingredients amplify each other and why]
**Strongest proof cluster:** [top 2-3 ingredients by evidence quality]
**Evidence gaps:** [ingredients with thin or only anecdotal support]
**Recommended mechanism angles:** [preliminary angles for mechanism-ideation]
```

## Proof Strength Rating

| Rating | Criteria | Example |
|--------|----------|---------|
| **Strong** | RCT, meta-analysis, or large-scale human trial (n>50) in peer-reviewed journal | "73% reduction in joint pain (n=120, 12-week RCT, Journal of Nutrition)" |
| **Moderate** | Observational study, small human trial (n<50), or well-designed animal study | "Participants reported 40% improvement (n=30, open-label pilot)" |
| **Weak** | In-vitro only, anecdotal, or single non-replicated study | "Showed antioxidant activity in cell culture (University of X, 2019)" |

## Quality Criteria

- Every claim statement includes a specific citation (author, year, or source)
- No unsourced statistics — if a number appears, its origin is traceable
- Mechanism of action is explained in both technical and plain-language terms
- Compliance flags are present for any claim that could trigger FTC/FDA scrutiny
- At least 2 studies per ingredient (or explicit note that evidence is limited)
- Proof strength rating assigned to every DR-ready claim statement

## Related Skills

- Output feeds into `/mechanism-ideation` for novel angle development from proof points
- Output feeds into `/unified-research-synthesizer` for full brief compilation across all 4 research pillars
- Copy using this research should be validated with `/rmbc-copy-audit`

## Non-Supplement Adaptation

For `product_category` values other than `supplement`:

| Category | "Ingredient" Equivalent | Research Focus |
|----------|------------------------|----------------|
| `skincare` | Active compounds (retinol, niacinamide, peptides) | Dermatological studies, concentration data, skin penetration |
| `food` | Nutritional components, sourcing, processing methods | USDA data, bioavailability, comparative nutrition studies |
| `other` | Material specs, components, manufacturing processes | Patents, engineering data, durability/performance testing |

The output format remains identical — substitute "ingredient" with the relevant component type.

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.
