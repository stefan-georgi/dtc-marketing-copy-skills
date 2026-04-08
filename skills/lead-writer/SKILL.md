---
name: lead-writer
description: Generate the opening lead section of long-form DR copy — the first 200-500 words that determine whether the prospect reads or bounces.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "lead-writer" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# lead-writer

## Purpose

Generate the opening lead of long-form direct response copy. The lead is the first 200-500 words after the headline — it determines whether a prospect commits to reading or bounces. A great hook earns attention; a great lead earns the next 2,000 words. This skill produces 3 lead variations across different lead types so the copywriter can test or choose the strongest opening for their format (sales page, VSL, advertorial, email).

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `lead_type` | Yes | One of: `story`, `problem_agitation`, `curiosity`, `news`, `contrarian` — or `auto` to get best-fit recommendation |
| `key_mechanism` | No | The product's unique mechanism (output from `/mechanism-ideation`) |
| `format_context` | No | Where this lead will be used: `sales_page`, `vsl`, `advertorial`, `email`, `general` (default: `general`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. The lead sits between the hook (first line) and the body copy — it must sustain the curiosity the hook created while building enough emotional investment to carry the reader into the mechanism reveal.

### Step 2 — Analyze Audience Sophistication

Determine market awareness level (Eugene Schwartz scale):
- **Most Aware** — Knows product, needs deal → Lead with offer
- **Product Aware** — Knows product, not convinced → Lead with proof/differentiation
- **Solution Aware** — Knows solutions exist, not yours → Lead with mechanism
- **Problem Aware** — Feels pain, no solution → Lead with problem agitation
- **Unaware** — Doesn't know they have a problem → Lead with story or news

Match lead type to awareness level. If `lead_type: auto`, recommend based on this analysis.

### Step 3 — Write 3 Lead Variations

Generate 3 distinct leads (200-500 words each):

#### Story Lead
- Open with a specific person, moment, or scene
- Use sensory details — what they saw, felt, heard
- The story must connect to the prospect's situation within 3 paragraphs
- End with a pivot toward the problem or mechanism

#### Problem-Agitation Lead
- Name the problem in the first sentence
- Agitate with specific consequences (financial, emotional, social, physical)
- Use "you" language — make it personal
- Escalate from annoying to urgent
- End with implied promise of a solution

#### Curiosity Lead
- Open a knowledge gap immediately
- Reference something specific and unexpected
- Tease a mechanism or discovery without revealing it
- Use specificity to build credibility ("a 47-year-old accountant from Tulsa")
- End with a promise to reveal

#### News Lead
- Open with a time reference ("Last month...", "In a recent study...")
- Frame the mechanism as a discovery or breakthrough
- Use institutional credibility (universities, journals, experts)
- Keep tone neutral/editorial in the first paragraph, then shift to personal relevance

#### Contrarian Lead
- Challenge a belief the audience currently holds
- Be specific about what conventional wisdom says
- Provide a credible reason why the common approach fails
- Position the mechanism as the unconventional alternative

If `lead_type` is specific, write 3 variations of that type. If `auto`, write the top 3 recommended types.

### Step 4 — Assess Each Lead

For each variation, provide:
- **Strength score** (1-5) with reasoning
- **Best format fit** — which copy format this lead works best in
- **Awareness match** — which awareness level this lead targets
- **Risk factor** — what could cause this lead to fail

## Output Format

```
## Lead Variations: [Product Name]

**Audience:** [target audience summary]
**Awareness Level:** [assessed level]
**Mechanism:** [key mechanism, if provided]

---

### Lead 1: [Type] — Strength: X/5

[Full lead copy, 200-500 words]

**Assessment:**
- Best for: [format]
- Awareness match: [level]
- Risk: [what could cause failure]

---

### Lead 2: [Type] — Strength: X/5

[Full lead copy, 200-500 words]

**Assessment:**
- Best for: [format]
- Awareness match: [level]
- Risk: [what could cause failure]

---

### Lead 3: [Type] — Strength: X/5

[Full lead copy, 200-500 words]

**Assessment:**
- Best for: [format]
- Awareness match: [level]
- Risk: [what could cause failure]

---

## Recommendation

**Strongest lead:** Lead #X
**Reasoning:** [why this lead wins for this product + audience combo]
**Suggested test:** [which two leads to A/B test and why]
```

## Quality Criteria

- Each lead must hook within the first 2 sentences — no slow warmups
- Story leads must use specific, concrete details — not generic scenarios
- Problem-agitation leads must name real consequences, not vague discomfort
- Curiosity leads must tease something specific — not empty intrigue
- All leads must transition naturally into a mechanism reveal or body copy
- Word count must stay in 200-500 range — leads that run long lose their purpose

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/hook-battery` for the headline/hook that precedes the lead
- Run `/mechanism-ideation` for the mechanism the lead must set up
- Use leads in `/vsl-script`, `/lander-copy`, or `/advertorial-writer`
- Validate full copy with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/mechanism-ideation` — strengthen the mechanism reveal
- `/advertorial-writer` — expand into full advertorial
- `/rmbc-copy-audit` — score lead quality

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

