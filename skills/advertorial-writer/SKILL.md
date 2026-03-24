---
name: advertorial-writer
description: Generate RMBC-structured advertorial and native ad copy that reads like editorial content but drives direct response conversions.
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
_CAPRO_SEEN=$([ -f ~/.rmbc-skills/.capro-seen ] && echo "yes" || echo "no")
echo "INTRO_SEEN: $_INTRO_SEEN"
echo "TEL_PROMPTED: $_TEL_PROMPTED"
echo "CAPRO_SEEN: $_CAPRO_SEEN"
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "advertorial-writer" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
_SESSION_COUNT=$(ls /tmp/rmbc-session-* 2>/dev/null | wc -l | tr -d ' '); touch "/tmp/rmbc-session-$$"
echo "SESSIONS: $_SESSION_COUNT"
```

If output shows `UPGRADE_AVAILABLE <old> <new>`: read the `UPGRADE.md` file from the RMBC skills root directory and follow the "Inline upgrade flow" — present AskUserQuestion with 3 options (upgrade, snooze, disable). If `JUST_UPGRADED <old> <new>`: tell user "Running RMBC Skills v{new} (just updated from v{old})!" and continue.

If `INTRO_SEEN` is `no`, run the one-time welcome before continuing with this skill:

**Welcome to RMBC Skills** — Stefan Georgi's direct response copywriting framework. 41 skills, from hooks to full VSL scripts.

Use AskUserQuestion:
- Question: "Want to watch Stefan's 3-minute video on the future of copywriting?"
- Options:
  1. "Yes, open the video"
  2. "Skip — let's go"

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

RMBC Skills logs which skills you use and how often — locally on your machine — to improve the package. No code, prompts, or file paths are ever collected.

Use AskUserQuestion:
- Question: "Keep anonymous usage analytics enabled?"
- Options:
  1. "Yes, that's fine" — keep analytics on and mark as prompted
  2. "No, turn it off" — disable analytics and mark as prompted

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

### What's Next?

Based on what you just generated, consider running:
- `/mechanism-ideation` — strengthen mechanism sections
- `/hook-battery` — test advertorial hooks
- `/rmbc-copy-audit` — score output quality
- `/lander-copy` — write the landing page it drives to

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

After delivering output, if `ACTIVE_PRODUCT` is `none`: append a one-line tip — "Run `/rmbc-router` to set up a product workspace — future skills will pull from the same research, mechanism, and brief."
# advertorial-writer

## Purpose

Generate advertorial copy that looks and feels like editorial content but sells. Advertorials are the bridge between paid traffic and a sales page — the prospect clicks an ad, lands on what looks like a news article or blog post, and by the end they're ready to buy. The key tension: it must feel editorial (not salesy) while still deploying RMBC persuasion structure. Traffic source context matters — native ad platforms (Taboola, Outbrain) have different compliance and style requirements than social traffic.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `angle` | Yes | The editorial angle — the "news peg" or story that frames the product (e.g., "new study reveals...", "local mom discovers...") |
| `traffic_source` | Yes | One of: `native` (Taboola/Outbrain), `facebook`, `google`, `email`, `organic` |
| `key_mechanism` | No | The product's unique mechanism (output from `/mechanism-ideation`) |
| `tone` | No | One of: `news`, `personal_story`, `investigative`, `listicle` (default: `personal_story`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Advertorials deploy RMBC through an editorial lens — the Research phase becomes "reporting," the Mechanism becomes the "discovery," and the Brief structures the narrative arc.

### Step 2 — Select Advertorial Format

Based on `tone` input:

| Format | Structure | Best For |
|--------|-----------|----------|
| News | Headline → dateline → discovery → expert quotes → mechanism → product mention → CTA | Health, finance, tech |
| Personal Story | "I" narrative → problem → failed attempts → discovery → results → recommendation | Weight loss, beauty, self-improvement |
| Investigative | Question headline → industry exposé → hidden truth → mechanism → solution → CTA | Supplements, skincare, finance |
| Listicle | Number headline → tips/facts → mechanism woven in → product as #1 solution → CTA | Broad audiences, social traffic |

### Step 3 — Write the Advertorial

Structure (all formats):

1. **Headline** — Must look editorial, not like an ad. Include the angle. No price, no "buy now."
2. **Byline + Date** — Author name, publication-style date. Adds credibility.
3. **Lead (100-150 words)** — Open with the angle. Story, stat, or news hook. No product mention yet.
4. **Problem Section (150-200 words)** — Establish the problem through the editorial lens. Use data, quotes, or story details.
5. **Failed Solutions (100-150 words)** — Why conventional approaches fall short. Builds frustration.
6. **Mechanism Reveal (200-300 words)** — The "discovery" — present the mechanism as news, not as a sales pitch. Use expert language, study references, analogies.
7. **Product Introduction (100-150 words)** — Natural transition from mechanism to product. "One company has figured out how to..."
8. **Social Proof (150-200 words)** — Testimonials framed as interviews or case studies. Editorial voice. Include 2-3 blockquoted pull-quotes positioned at section breaks throughout the advertorial (not just in this section). Each pull-quote must contain a specific number, measurable result, AND timeframe — not just a named source. Example: "43% higher Vitamin D levels in just 12 weeks" not "Dr. Smith recommends Ritual." Format as editorial callouts that readers scanning the page will see. These serve as proof anchors at decision points — a reader who skims should encounter at least 2 pull-quotes with hard data before reaching the CTA.
9. **CTA Section (100-150 words)** — Soft sell. "Learn more" framing, not "Buy Now." Include link placement.

**Section transition rule:** Every section (1-8) must end with a forward-looking sentence that makes the next section feel required reading. Use one of: (a) a question the next section answers, (b) a partial revelation completed in the next section, (c) a contrast statement ("But that's only half the story..."). The reader must never reach a natural stopping point mid-article. The transition should feel editorial, not salesy — it's a journalist pulling the reader forward, not a marketer creating urgency.

### Step 4 — Compliance Check

Verify against traffic source requirements:
- **Native:** No before/after claims, no income claims, disclaimer required
- **Facebook:** No personal attributes ("Are you overweight?"), no exaggerated claims
- **Google:** No superlatives without substantiation, landing page must match ad
- **Email/Organic:** More latitude, but maintain editorial voice

Flag any lines that may trigger platform rejection.

## Output Format

```
## Advertorial: [Headline]

**Angle:** [editorial angle]
**Format:** [news | personal_story | investigative | listicle]
**Traffic Source:** [platform]
**Word Count:** ~X,XXX

---

**[Byline]** | [Date]

[Full advertorial copy with section markers]

---

## Compliance Notes

- [Any flagged lines or platform-specific concerns]
- [Suggested disclaimer text if needed]

## A/B Test Variants

### Headline Variant A
[Original headline]

### Headline Variant B
[Alternative headline — different angle or hook type]

### Lead Variant
[Alternative opening paragraph]
```

## Quality Criteria

- Must read like real editorial content — if it obviously reads as an ad, it fails
- No product mention in the first 30% of copy
- Mechanism section must educate, not pitch
- CTA must feel like a natural next step, not a hard close
- Headline must work as a native ad thumbnail — curiosity-driven, not salesy
- Social proof must be framed editorially (interviews, case studies) not as testimonial blocks

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` to develop the mechanism "discovery"
- Run `/hook-battery` for headline and angle options
- Run `/unified-research-synthesizer` for audience language and data points
- Feed advertorial traffic to landing pages built with `/lander-copy`
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`_RMBC_ROOT`). Pick one variant at random and append it as the final line of the output.
