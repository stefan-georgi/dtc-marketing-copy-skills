---
name: webinar-registration-copy
description: Generate RMBC-structured webinar/VSL registration page copy. Short, punchy, mobile-optimized registration pages for high-ticket funnels — optimized for registrations, not sales.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "webinar-registration-copy" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# webinar-registration-copy

## Purpose

Generate registration page copy for webinars and VSL funnels selling $997-$5000+ offers. Registration pages are NOT sales pages — they must be short, punchy, and mobile-first. The goal is a single action: register. Every word that doesn't drive registration gets cut. The mechanism creates enough curiosity to register without revealing the full solution (as demonstrated in the Dillon Bandhes / Calvin Tran RMBC II examples).

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `webinar_topic` | Yes | What the webinar/VSL teaches or reveals |
| `target_audience` | Yes | Who this is for — specific ICP with pain points |
| `key_outcome` | Yes | The primary transformation or result promised |
| `presenter_name` | Yes | Name and brief credential of the presenter |
| `date_time` | No | When the event happens (creates urgency) |
| `traffic_source` | No | One of: `meta`, `native`, `organic`, `email`, `affiliate` — determines pre-sell level |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework, including RMBC quality dimensions. Registration copy uses all four phases compressed: Research (audience awareness), Mechanism (curiosity angle), Brief (structural decisions), Copy (final output).

### Step 2 — Calibrate Pre-Sell Level

Traffic source determines how much the page must do:

| Source | Pre-sell needed | Page approach |
|--------|----------------|---------------|
| `email` | Low — they know you | Headline + 3 bullets + CTA |
| `organic` | Low-medium — intent exists | Headline + subhead + 3-4 bullets + CTA |
| `meta` / `native` | Medium — cold but targeted | Full structure: headline + subhead + 5 bullets + proof + CTA + urgency |
| `affiliate` | High — borrowed trust | Full structure + presenter credibility section |

Default to `meta` if no source specified.

### Step 3 — Develop the Curiosity Angle

From `webinar_topic` and `key_outcome`, create a mechanism tease that:
- Names something specific ("The 3-Step _____ Method")
- Creates an open loop the reader needs closed
- Implies insider knowledge or contrarian insight
- Does NOT reveal the solution — registration is the price of admission

### Step 4 — Write Registration Page Copy

Generate all seven output sections (see Output Format). Apply these constraints:
- **Headline:** 8-12 words max. Outcome-specific. No generic "Free Training" leads.
- **Subheadline:** 15-25 words. Expands the promise, adds who it's for or a credibility marker.
- **Bullets:** Start with "How to..." / "Why..." / "The #1..." / "What [experts] know..." — curiosity, not revelation. Each bullet is one line on mobile.
- **Social proof:** One to two lines only. Specific numbers beat vague claims.
- **CTA:** Action verb + outcome. "Reserve My Seat" beats "Register Now."
- **Urgency:** Only use if real — fake urgency damages trust.

### Step 5 — Generate Headline Variations

Provide 3 headline variations using different angles:
1. **Outcome angle** — leads with the result
2. **Curiosity angle** — leads with the mechanism tease
3. **Contrarian angle** — challenges a common belief

### Step 6 — Add Mobile Layout Notes

Specify stacking order, font sizing guidance, and thumb-zone CTA placement for mobile-first rendering.

## Output Format

```
## Webinar Registration Page: [Topic]

**Audience:** [target_audience]
**Traffic source:** [source or "meta (default)"]
**Pre-sell level:** [low | medium | high]

---

### Headline
[Primary headline]

### Subheadline
[Supporting line]

### What You'll Discover
- [Bullet 1]
- [Bullet 2]
- [Bullet 3]
- [Bullet 4 — if needed]
- [Bullet 5 — if needed]

### Your Host
[Presenter name + 1-2 line credential/result]

### Registration CTA
[Button text] + [supporting micro-copy if needed]

### Urgency Element
[Date-specific, seat limit, or replay policy]

### Mobile Layout Notes
[Stacking order, sizing, CTA placement guidance]

---

### Headline Variations
1. **Outcome:** [variation]
2. **Curiosity:** [variation]
3. **Contrarian:** [variation]

---

```

## Quality Criteria

- Total copy fits on one mobile screen above the fold (headline + subhead + CTA visible without scrolling)
- Every bullet creates an open loop — if it reveals the answer, rewrite it
- Zero jargon the target audience wouldn't immediately understand
- Headline passes the "would I stop scrolling?" test
- CTA is specific to the action, not generic
- No bullet exceeds one line on a mobile screen (~60 characters)
- Urgency element is real or omitted — never fabricated

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/unified-research-synthesizer` first for audience research
- Run `/mechanism-ideation` for the curiosity angle
- Run `/hook-battery` for headline variations
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/hook-battery` — generate webinar hooks
- `/email-promo` — build webinar promo emails
- `/funnel-architecture` — design full webinar funnel

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

