---
name: unified-research-synthesizer
description: Synthesize multi-source research into a single Unified Research Document — the copy-ready strategic brief that bridges Research and Brief in RMBC.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "unified-research-synthesizer" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
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
# Unified Research Synthesizer

## Purpose
Merge all research pillars into one strategic document — the Unified Research Document. This is the single source of truth for all copy decisions: who the ICP is, what they want, what they fear, what competitors have already claimed, what proof exists, and what angles remain unclaimed. The output is NOT copy — it's the defensible foundation that makes every copy decision traceable to research.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product/service is, what it does, key claims |
| `target_audience` | Yes | Who the copy is for — demographics, situation, buying context |
| `ingredient_research` | No | Proof points, studies, clinical data, mechanism details (from `/ingredient-research`) |
| `competitor_data` | No | Competitor ads, landing pages, claims, mechanisms, pricing |
| `customer_feedback` | No | Reviews, testimonials, survey responses, support tickets, coaching transcripts |
| `market_awareness_level` | No | Where the audience sits on the awareness spectrum: `unaware`, `problem_aware`, `solution_aware`, `product_aware`, `most_aware`. Default: auto-detect from inputs |

## Execution Protocol

### Step 1: Load Framework Context
Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework, including RMBC methodology overview and quality dimensions. This skill bridges the Research and Brief phases — synthesizing all four research pillars into a copy-ready strategic document.

### Step 2: Awareness Classification
Determine the audience's position on Eugene Schwartz's awareness spectrum. If `market_awareness_level` is not provided, infer from the product category, audience description, and any competitor data. This classification drives every downstream recommendation (copy length, directness, proof density, lead type).

### Step 3: Psychographic Synthesis
Extract from `customer_feedback`, `target_audience`, and any available voice-of-customer data:
- Top 5 pains (ranked by emotional intensity and frequency)
- Top 5 desires (what they actually want, not what they say they want)
- Core objections and skepticism patterns
- Exact language patterns — phrases, slang, metaphors the audience uses naturally

If `customer_feedback` is not provided, construct psychographic profile from `target_audience` and `competitor_data` (noting lower confidence).

### Step 4: Competitive Landscape Mapping
From `competitor_data` (or general market knowledge if not provided):
- What claims have been made and by whom
- What mechanisms competitors use to explain their product
- Where competitors are weak, vague, or making unsubstantiated claims
- What positioning territory is unclaimed

### Step 5: Proof Arsenal Assembly
From `ingredient_research` and `product_description`:
- Rank all proof points by strength: clinical study > case study > testimonial > logical argument > claim
- Flag any claims that lack supporting evidence
- Identify the single strongest proof point (the "undeniable proof anchor")

### Step 6: Mechanism Candidate Identification
Based on the intersection of: unclaimed competitive territory + strongest proof points + audience pain/desire:
- Propose 2-3 potential unique mechanisms (named explanations for WHY the product works)
- Each mechanism must be: novel (not already claimed by competitors), believable (grounded in proof), and simple enough to explain in one sentence

### Step 7: Strategic Recommendation
Based on awareness level, competitive gaps, proof strength, and psychographic profile:
- Recommended copy approach (direct response vs. educational vs. story-led)
- Suggested tone and register (matching audience language patterns)
- Recommended length (driven by awareness level: less aware = longer copy)
- Traffic source considerations (cold traffic needs more proof; warm needs differentiation)

## Output Format

```
## Unified Research Document

**Product:** [name/description]
**Date:** [YYYY-MM-DD]
**Awareness Level:** [level] — [1-line justification]

### 1. ICP Profile

**Demographics:** [age, income, role, situation]
**Psychographics:** [beliefs, values, identity, worldview]
**Buying context:** [what triggered the search, where they are in the journey]

### 2. Pain / Desire Matrix

| # | Pain | Emotional Trigger | Evidence Source |
|---|------|-------------------|-----------------|
| 1 | [pain] | [trigger] | [source] |
| ... | | | |

| # | Desire | Emotional Trigger | Evidence Source |
|---|--------|-------------------|-----------------|
| 1 | [desire] | [trigger] | [source] |
| ... | | | |

**Key objections:** [bulleted list with source]
**Language patterns:** [exact phrases the audience uses]

### 3. Competitive Landscape

| Competitor | Core Claim | Mechanism | Gap/Weakness |
|------------|-----------|-----------|--------------|
| [name] | [claim] | [mechanism] | [gap] |
| ... | | | |

**Unclaimed territory:** [what no competitor owns yet]

### 4. Proof Arsenal

| # | Proof Point | Type | Strength | Source |
|---|-------------|------|----------|--------|
| 1 | [strongest] | [type] | [1-5] | [source] |
| ... | | | | |

**Undeniable proof anchor:** [single strongest piece of evidence]
**Proof gaps:** [claims that need stronger evidence]

### 5. Mechanism Candidates

1. **[Name]:** [1-sentence explanation] — Grounded in: [proof point]. Unclaimed by: [competitors].
2. **[Name]:** [1-sentence explanation] — Grounded in: [proof point]. Unclaimed by: [competitors].
3. **[Name]:** [1-sentence explanation] — Grounded in: [proof point]. Unclaimed by: [competitors].

### 6. Strategic Recommendations

- **Copy approach:** [direct/educational/story-led] — because [awareness level + reasoning]
- **Tone:** [register] — matching audience language: "[example phrase]"
- **Length:** [short/medium/long] — [awareness-driven reasoning]
- **Lead type:** [recommended opening strategy for this awareness level]
- **Traffic source notes:** [cold vs. warm considerations]

### Next Step

Feed this document into `/mechanism-ideation` to develop your strongest mechanism candidate into a full Unique Mechanism, then use it as the strategic foundation for any copy format skill.

---
```

## Quality Criteria
- Every matrix entry traces back to a named evidence source (not invented)
- Mechanism candidates are grounded in actual proof points, not speculation
- Awareness level classification includes explicit justification
- Competitive gaps are specific (not "they don't do enough") — cite what's missing
- Language patterns use actual audience vocabulary, not marketer jargon
- When inputs are incomplete, confidence levels are stated explicitly per section

## Related Skills
- **Upstream:** `/ingredient-research` — feeds proof points and mechanism details into this skill
- **Downstream:** `/mechanism-ideation` — takes mechanism candidates from Section 5 and develops them fully
- **Downstream:** Any copy format skill (`/pdp-ecomm-template`, `/webinar-registration-copy`, `/hook-battery`) — uses this document as strategic foundation
- **Validation:** `/rmbc-copy-audit` — scores final copy against the research captured here

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/mechanism-ideation` — ideate mechanisms from research
- `/creative-brief` — build brief from synthesis
- `/hook-battery` — generate research-driven hooks
- `/advertorial-writer` — write research-backed long-form

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

