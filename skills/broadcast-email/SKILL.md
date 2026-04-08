---
name: broadcast-email
description: Generate one-off broadcast emails for list engagement — content, story, controversy, case study, or flash promo types with 3 subject line options using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "broadcast-email" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# broadcast-email

## Purpose

Generate standalone broadcast emails for ongoing list engagement. Unlike sequences, broadcasts are one-off sends that keep the list warm, build authority, and drive revenue between automated flows. Each broadcast type serves a different strategic purpose — content emails build trust, story emails build connection, controversy emails drive engagement, case studies build proof, and flash promos drive immediate revenue. This skill produces complete email copy with 3 subject line variants, preview text, body, CTA, and PS line.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `email_type` | Yes | One of: `content`, `story`, `controversy`, `case_study`, `flash_promo` |
| `topic` | Yes | The specific topic, story, hot take, case study, or promotion |
| `target_audience` | Yes | Who the reader is — demographics, pain points, desires |
| `product_mention` | No | Product to reference or link to (omit for pure engagement emails) |
| `brand_voice` | No | One of: `founder`, `expert`, `friend`, `provocateur` (default: `founder`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Broadcasts deploy RMBC in single-email format — Research drives topic relevance, Mechanism adds unique insight, Brief selects the angle, Copy executes with clarity and impact.

### Step 2 — Select Structure by Type

| Type | Structure | Tone | Length | CTA Style |
|------|-----------|------|--------|-----------|
| Content | Teach one thing → actionable takeaway → optional product bridge | Educational, generous | 400-600 words | Soft: "Try this today" or link to resource |
| Story | Scene → tension → resolution → lesson → bridge | Conversational, personal | 350-500 words | Soft: reply, share, or subtle product link |
| Controversy | Hot take → evidence → "here's what most people get wrong" → reframe | Bold, direct, opinionated | 300-500 words | Engagement: "Reply and tell me if I'm wrong" |
| Case Study | Situation → challenge → what they did → results → lesson | Proof-driven, specific | 400-600 words | Medium: "Want similar results? Here's how" |
| Flash Promo | Offer → reason why now → proof → scarcity → CTA | Urgent, direct | 200-350 words | Hard: "Buy now before midnight" |

### Step 3 — Big Idea Check

Identify the single most fascinating, contrarian, or surprising angle. State it in one sentence. If the topic lacks a big idea, prompt the user: "What is the single most surprising thing about [topic]?" The subject line and opening hook must tease this big idea — never bury it. Flat copy always loses to copy with one fascinating idea.

### Step 4 — Write Subject Lines (10+ Variants)

Generate a minimum of 10 subject line variants, categorized by hook type:

| Hook Type | Minimum Count | Example Pattern |
|-----------|---------------|-----------------|
| Curiosity | 3+ | Open a loop the reader must close |
| Contrarian | 2+ | Challenge a common belief or practice |
| Story-based | 2+ | Tease a narrative or character |
| Educational | 2+ | Promise a specific insight or framework |
| Urgency | 1+ | Time-bound or scarcity-driven |

Rules:
- Max 50 characters (mobile truncation)
- No ALL CAPS words or spam triggers
- Controversy subject lines should provoke without being offensive
- Flash promo subject lines can include one emoji if appropriate
- Each must work without preview text context
- The top 3 subject lines (recommended for A/B testing) must tease the big idea from Step 3

### Step 5 — Write Preview Text

- 40-90 characters
- Complements (not repeats) the subject line
- Extends the curiosity loop or adds a proof point
- Must work as a standalone teaser in mobile inbox

### Step 6 — Write Email Body

Structure per type:

**Content:**
1. Hook — why this topic matters right now (1-2 sentences)
2. One core insight — teach the idea with a specific example
3. Actionable takeaway — what the reader can do today
4. Bridge — optional: connect the insight to your product/service

**Story:**
1. Scene-setting — drop the reader into a moment (sensory details)
2. Tension — what went wrong or what was at stake
3. Resolution — what happened and what it revealed
4. Lesson — the universal takeaway
5. Bridge — optional: how this connects to what you offer

**Controversy:**
1. Hot take — state the contrarian position clearly in the first line
2. Evidence — why most people are wrong about this
3. Reframe — the correct way to think about it
4. Challenge — invite the reader to disagree or engage

**Case Study:**
1. Context — who the person/company is (relatable to audience)
2. Challenge — the specific problem they faced
3. Action — what they did (with enough detail to be credible)
4. Results — specific, measurable outcomes
5. Lesson — what the reader can learn from this

**Flash Promo:**
1. Offer — what it is, what they get, the discount/deal
2. Reason why — why this offer exists now (inventory, anniversary, mistake)
3. Proof — one strong proof point (testimonial, result, guarantee)
4. Scarcity — specific deadline or quantity limit
5. CTA — clear, urgent, repeated

Formatting rules:
- Short paragraphs: 1-3 sentences max
- Bold key phrases sparingly (1-2 per email)
- One primary CTA — do not split attention
- PS line: strongest proof point, deadline reminder, or engagement prompt

### Step 7 — Add ROI Math (Flash Promo and Case Study)

For emails mentioning price, insert value-comparison anchoring BEFORE the reveal:
1. Ask 3 "How much is [outcome] worth?" questions anchored at high amounts ($500, $2,000, $5,000)
2. Follow with: "I have good news — nowhere near that price."
3. Reveal actual price as dramatically lower

Skip for non-promo types unless a product bridge leads to price.

### Step 8 — Enforce Persuasion Density

Every 3-4 paragraphs must include at least one: mechanism reference, testimonial snippet, testable proof point (number/timeframe), or future-pacing statement. If any 4-paragraph stretch lacks a persuasion marker, insert one.

## Output Format

```
## Broadcast Email: [Topic]

**Type:** [content | story | controversy | case_study | flash_promo]
**Voice:** [founder | expert | friend | provocateur]
**Word Count:** ~XXX

---

### Big Idea

[One sentence — the single most fascinating angle]

### Subject Lines (10+ Variants by Hook Type)

| # | Subject Line | Hook Type |
|---|-------------|-----------|
| 1-3 | [curiosity subjects] | Curiosity |
| 4-5 | [contrarian subjects] | Contrarian |
| 6-7 | [story subjects] | Story-based |
| 8-9 | [educational subjects] | Educational |
| 10+ | [urgency subjects] | Urgency |

**Top 3 for A/B testing:** #X, #X, #X

**Preview Text:** [preview text]

---

### Email Body

**From:** [sender name/brand]

[Full email copy]

[CTA]

**PS —** [PS line]

---

## Broadcast Notes

- **Best send day/time for [type]:** [recommendation]
- **Engagement metric to watch:** [open rate | reply rate | click rate | revenue]
- **Follow-up opportunity:** [what to send next based on engagement]
```

## Quality Criteria

- Subject lines must be under 50 characters and A/B testable
- Preview text must not repeat the subject line
- Content emails must deliver a genuine, actionable insight — not thinly veiled pitches
- Story emails must include specific sensory details — not generic anecdotes
- Controversy emails must take a real position — not a safe "both sides" hedge
- Case study results must be specific and measurable — not "they saw great results"
- Flash promo urgency must be real — name the deadline, quantity, or trigger
- PS line must work as a standalone selling argument
- Product mentions in non-promo types must feel natural, not forced

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)
- **RMBC 2 ROI math:** Any email mentioning price must include value-comparison anchoring BEFORE the price reveal
- **RMBC 2 subject diversity:** Minimum 10 subject line variants across 5+ hook categories
- **RMBC 2 big idea:** Every email must have a single identifiable big idea that the subject line teases -- if the big idea cannot be stated in one sentence, the angle is too diffuse
- **RMBC 2 persuasion density:** No 4-paragraph stretch without at least one persuasion marker (mechanism, proof, testimonial, or future-pacing)

## Related Skills

- Run `/hook-battery` for subject line inspiration
- Run `/mechanism-ideation` for unique angles in content and controversy emails
- Run `/email-promo` for more structured promotional emails
- Run `/soap-opera-sequence` to expand a strong story broadcast into a full sequence
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/email-promo` — create promotional variant
- `/copy-rewrite` — improve weak sections
- `/rmbc-copy-audit` — score output quality

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

