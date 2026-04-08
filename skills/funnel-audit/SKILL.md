---
name: funnel-audit
description: Audit existing sales funnels against RMBC and CRO best practices — score each step, identify conversion leaks, and output a prioritized fix matrix.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "funnel-audit" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
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
# funnel-audit

## Purpose

Audit an existing DTC sales funnel against RMBC methodology and CRO best practices. Every funnel leaks revenue somewhere — the question is where and how much. This skill evaluates each step in the funnel (traffic → landing → order → upsell → thank you → email) with per-step scoring across five dimensions. Output: a funnel health score (0-100), identification of the top 3 conversion leaks, and a prioritized fix matrix ranked by revenue impact.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `funnel_description` | Yes | Detailed description of each funnel step — pages, copy approach, offers, flow |
| `funnel_type` | Yes | One of: `tripwire`, `webinar`, `vsl`, `quiz`, `free_plus_shipping`, `other` |
| `funnel_url` | No | Live URL to audit (if available — describe what you observe at each step) |
| `current_metrics` | No | Existing performance data: conversion rates per step, AOV, CPA, ROAS, traffic volume |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Funnel auditing applies RMBC as a diagnostic lens — Research quality determines whether copy speaks to the right audience, Mechanism consistency determines whether the "why" threads through every page, Brief alignment determines whether each page has a clear strategic job, Copy execution determines whether the words convert.

### Step 2 — Map the Funnel Steps

Identify every step in the funnel and classify it:

| Step | Type | Examples |
|------|------|----------|
| Traffic | Entry point | Ad, organic post, email, referral |
| Pre-sell | Warm-up | Advertorial, quiz, webinar |
| Landing | Core offer | Sales page, VSL page, product page |
| Order | Checkout | Order form, cart, payment page |
| Upsell | Post-purchase | OTO page, bump offer, cross-sell |
| Thank You | Confirmation | Order confirmation, next steps |
| Email | Follow-up | Welcome sequence, onboarding, ascension |

If a step is missing from the funnel, flag it as a structural gap.

### Step 3 — Score Each Step

Evaluate each funnel step across 5 dimensions. Score each dimension 0-20 points:

| Dimension | What It Measures | 0-5 | 6-10 | 11-15 | 16-20 |
|-----------|-----------------|-----|------|-------|-------|
| **Message Match** | Does the copy match what the prospect expects from the previous step? | No connection | Loose match | Good match | Seamless transition |
| **Friction Level** | How many obstacles stand between the prospect and the conversion goal? | High friction, confusing | Multiple friction points | Minor friction | Frictionless path |
| **Proof Density** | Is there sufficient, varied evidence to support the claims being made? | No proof | Single proof type | Multiple proof types | Stacked, specific proof |
| **CTA Clarity** | Is the desired action obvious, compelling, and easy to take? | No clear CTA | Vague or buried CTA | Clear CTA | Urgent, specific, visible CTA |
| **Mobile Experience** | Does the page work well on mobile (80-90% of DTC traffic)? | Broken on mobile | Functional but poor | Good mobile layout | Mobile-first design |

**Per-step score:** Sum of 5 dimensions (0-100 per step)
**Funnel health score:** Average across all steps (0-100)

### Step 4 — Identify Conversion Leaks

Rank all steps by their scores. The bottom 3 are the primary leaks. For each leak:

1. **The leak** — Which step and what's failing
2. **Revenue impact** — Estimate how much revenue this leak costs (if metrics provided, calculate; if not, estimate based on typical benchmarks)
3. **Root cause** — RMBC diagnosis: is it a Research failure (wrong audience assumptions), Mechanism failure (weak "why"), Brief failure (unclear page strategy), or Copy failure (poor execution)?
4. **Benchmark gap** — Compare the step's performance to industry benchmarks for this funnel type

### Step 5 — Build Fix Priority Matrix

Prioritize fixes by: (Revenue Impact × Ease of Fix). Score both 1-5:

- **Revenue Impact (1-5):** How much revenue will fixing this recover?
- **Ease of Fix (1-5):** How quickly can this be implemented? (5 = copy change, 1 = rebuild)
- **Priority Score:** Impact × Ease (highest score = fix first)

## Output Format

```
## Funnel Audit: [Funnel Name/Product]

**Funnel Type:** [type]
**Steps Audited:** [count]
**Funnel Health Score:** XX/100
**Grade:** [A (80+) | B (60-79) | C (40-59) | D (20-39) | F (0-19)]

---

### STEP-BY-STEP SCORES

| Step | Message Match | Friction | Proof | CTA | Mobile | Total |
|------|:---:|:---:|:---:|:---:|:---:|:---:|
| [Step 1] | /20 | /20 | /20 | /20 | /20 | /100 |
| [Step 2] | /20 | /20 | /20 | /20 | /20 | /100 |
| ... | ... | ... | ... | ... | ... | ... |

---

### TOP 3 CONVERSION LEAKS

#### Leak 1: [Step Name] — Score: XX/100
- **What's failing:** [description]
- **Revenue impact:** [estimated or calculated]
- **Root cause:** [RMBC diagnosis]
- **Benchmark gap:** [current vs expected]

#### Leak 2: [Step Name] — Score: XX/100
[same format]

#### Leak 3: [Step Name] — Score: XX/100
[same format]

---

### FIX PRIORITY MATRIX

| Rank | Fix | Step | Impact (1-5) | Ease (1-5) | Priority | Estimated Lift |
|:---:|------|------|:---:|:---:|:---:|------|
| 1 | [fix description] | [step] | X | X | XX | +X% conversion |
| 2 | [fix description] | [step] | X | X | XX | +X% conversion |
| 3 | [fix description] | [step] | X | X | XX | +X% conversion |
| ... | ... | ... | ... | ... | ... | ... |

---

### STRUCTURAL GAPS

[List any missing funnel steps that should exist but don't]

---

### SUMMARY

- **Biggest win:** [single highest-impact fix]
- **Quick wins:** [fixes with Ease score of 4-5]
- **Requires rebuild:** [fixes with Ease score of 1-2]
```

## Quality Criteria

- Every funnel step must be scored — no skipping steps because they "seem fine"
- Scores must be justified with specific observations, not just numbers
- Revenue impact estimates must show reasoning (conversion rate × traffic × AOV)
- Fix priority matrix must rank by Impact × Ease — not by gut feeling
- Structural gaps must be flagged even if the user didn't mention them
- Mobile experience must be evaluated for every step — it's not optional for DTC
- RMBC root cause diagnosis must map to a specific phase failure, not generic "copy is weak"

- **Specificity gate:** Every finding must include a number, name, or timeframe — no "needs work" or "could improve"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** Each finding must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode

## Related Skills

- Run `/funnel-architecture` to design the ideal funnel this audit compares against
- Run `/lander-copy` to rewrite a low-scoring landing page
- Run `/order-form-cro` to fix checkout conversion leaks
- Run `/upsell-script` to improve upsell page scores
- Run `/thank-you-page` to optimize the confirmation step
- Validate individual pages with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/funnel-architecture` — redesign the ideal funnel
- `/lander-copy` — rewrite low-scoring pages
- `/order-form-cro` — fix checkout leaks
- `/rmbc-copy-audit` — deep-audit individual pages

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

