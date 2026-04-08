---
name: copy-rewrite
description: Rewrite underperforming copy using RMBC framework — audits weaknesses first, then rewrites section by section with before/after comparison and rationale.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "copy-rewrite" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# copy-rewrite

## Purpose

Take existing underperforming copy and rewrite it with proper RMBC structure. This is a two-phase skill: first audit (diagnose what's broken), then rewrite (fix it section by section). Every rewrite shows before/after for each section with an explanation of what changed and why. The goal is not to rewrite from scratch — it's to preserve what works, fix what doesn't, and add what's missing. The audit phase prevents the common AI mistake of rewriting copy that was already strong.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `original_copy` | Yes | The full copy to be rewritten — paste it in or provide the file path |
| `copy_type` | Yes | One of: `landing_page`, `email`, `ad`, `vsl_script`, `advertorial`, `product_page`, `other` |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `key_mechanism` | No | The product's unique mechanism (output from `/mechanism-ideation`) |
| `performance_data` | No | Any metrics: conversion rate, CTR, bounce rate, avg time on page, or qualitative feedback |
| `tone` | No | One of: `aggressive`, `conversational`, `professional` (default: preserve original tone) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Copy rewrites require understanding all four RMBC phases to diagnose which phase is failing in the original.

### Step 2 — RMBC Structural Beat Diagnostic

Before scoring, check the original against the RMBC beat checklist:

| Beat | Present? | Notes |
|------|----------|-------|
| Contrarian hook in lead | Yes/No | |
| UMP: How system normally works | Yes/No | |
| UMP: What is broken | Yes/No | |
| UMP: External factors causing it | Yes/No | |
| Out-of-box solution dismissed | Yes/No | |
| UMS explained | Yes/No | |
| Testable proof included | Yes/No | |
| Product build-up story | Yes/No | |
| Future-pacing in close | Yes/No | |

Missing beats become mandatory additions in Step 4.

### Step 3 — Audit the Original Copy

Score the original across 6 dimensions (1-5 each):

| Dimension | What to Evaluate |
|-----------|-----------------|
| **Hook strength** | Does the opening stop the scroll? Is it specific or generic? |
| **Problem agitation** | Does it make the pain vivid and urgent? Or does it rush to the solution? |
| **Mechanism clarity** | Is there a named mechanism? Is it explained simply? Or is it features-only? |
| **Proof quality** | Are there specific claims, testimonials, data? Or vague assertions? |
| **Offer structure** | Is the value clear? Is there price anchoring? Risk reversal? |
| **CTA clarity** | Is there one clear action? Is urgency real or manufactured? |

Output the audit scorecard explicitly in your response using this format:

| Dimension | grade:N | Notes |
|-----------|---------|-------|
| Hook strength | grade:4 | Opening is specific but lacks scroll-stop pattern |
| Problem agitation | grade:2 | Pain mentioned but not escalated |
| Mechanism clarity | grade:3 | Mechanism named, not explained |
| Proof quality | grade:1 | Vague assertions only |
| Offer structure | grade:4 | Clear value, price anchor present |
| CTA clarity | grade:2 | Action vague, no urgency |

Identify the 2-3 weakest dimensions (lowest grades) for the rewrite focus.

### Step 4 — Map the Rewrite Plan

Based on audit scores AND the structural beat diagnostic (Step 2), determine:
- **Keep** — Sections scoring 4-5 (preserve with minor polish)
- **Rewrite** — Sections scoring 2-3 (significant structural changes)
- **Add** — Missing RMBC elements that don't exist in the original (every "No" from the beat checklist becomes a mandatory addition)
- **Cut** — Content that's diluting the argument (tangents, redundancy, weak proof)

### Step 5 — Execute Section-by-Section Rewrite

For each section that needs work:

1. **Quote the original** — Exact text from the input
2. **Diagnose** — One line: what's wrong and why it underperforms
3. **Rewrite** — The improved version
4. **Explain** — What changed and what RMBC principle it applies

Preserve the original's voice and tone unless the user specified a different tone.

### Step 6 — Enforce Three-Part UMP

If UMP is missing (Step 2), the rewrite MUST include:
- **Part A** — "Here is how [system] normally works"
- **Part B** — "Here is why it is not working for you"
- **Part C** — "Here are the external factors causing this" (never the reader's fault)

**Retellability test:** Summarize the mechanism in 2 plain sentences. If it needs jargon or multiple cognitive leaps, simplify.

### Step 7 — Add Out-of-Box Dismissal

Between mechanism and product, insert: "Why you can't just buy [generic solution] off Amazon / at the gym / from a doctor." Address wrong form, dosage, co-factors, or proprietary process. Enhance existing dismissals scoring below 4.

### Step 8 — Assemble the Full Rewrite

Combine all sections (kept, rewritten, and added) into a cohesive final version. Ensure transitions between sections are smooth — a rewrite of individual sections can create jarring seams.

## Output Format

```
## Copy Rewrite: [Copy Type] for [Product/Brand]

---

### Audit Scorecard

| Dimension | Score (1-5) | Verdict |
|-----------|-------------|---------|
| Hook strength | X | [1 line] |
| Problem agitation | X | [1 line] |
| Mechanism clarity | X | [1 line] |
| Proof quality | X | [1 line] |
| Offer structure | X | [1 line] |
| CTA clarity | X | [1 line] |

**Overall:** X/30
**Weakest areas:** [2-3 dimensions to focus on]

---

### Section-by-Section Rewrite

#### [Section Name]

**BEFORE:**
> [original text]

**DIAGNOSIS:** [what's wrong — 1 line]

**AFTER:**
[rewritten text]

**WHY:** [what RMBC principle this applies — 1 line]

[...repeat for each section...]

---

### Full Rewrite (Assembled)

[Complete rewritten copy, all sections combined with smooth transitions]

---

### Rewrite Summary

- **Sections kept:** [list]
- **Sections rewritten:** [list]
- **Sections added:** [list]
- **Sections cut:** [list]
- **Estimated impact:** [what should improve and why]
```

## Quality Criteria

- Audit must score honestly — do not inflate weaknesses to justify more rewrites
- Before/after must be shown for every rewritten section — no invisible changes
- Rewrites must preserve the original voice unless a different tone was requested
- Added sections must fill genuine RMBC gaps, not pad word count
- The assembled full rewrite must read as cohesive copy, not a patchwork
- "Why" explanations must reference specific RMBC principles, not generic "this is better"
- Sections scoring 4-5 in audit should be kept with minimal changes — resist rewriting what works

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)
- **RMBC 2 diagnostic:** The rewrite must output a structural beat checklist BEFORE the rewrite — missing beats must be explicitly addressed in the new version

## Related Skills

- Run `/rmbc-copy-audit` for a deeper standalone audit (without rewrite)
- Run `/mechanism-ideation` if the audit reveals no mechanism in the original
- Run `/hook-battery` if the hook scores 1-2
- Use format-specific skills for full rewrites from scratch: `/lander-copy`, `/email-promo`, `/vsl-script`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/rmbc-copy-audit` — score the rewrite against RMBC dimensions
- `/hook-battery` — test new opening hooks
- `/mechanism-ideation` — strengthen the mechanism

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

