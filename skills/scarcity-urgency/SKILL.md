---
name: scarcity-urgency
description: Generate ethical scarcity and urgency elements for DTC offers — genuine limited stock, time-limited pricing, bonus deadlines, seasonal relevance, and enrollment caps with copy, visual treatment, and ethical justification.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "scarcity-urgency" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# scarcity-urgency

## Purpose

Generate ethical scarcity and urgency elements for DTC offers. Scarcity and urgency are the two most powerful conversion accelerators in direct response — and the two most abused. Fake countdown timers, fabricated "only 3 left" claims, and phantom deadlines destroy trust and invite chargebacks. This skill produces scarcity/urgency elements that are genuinely true, ethically defensible, and conversion-effective. Every element includes copy text, visual treatment guidance, and an ethical justification proving the scarcity is real. If the scarcity isn't real, the skill says so and recommends alternatives.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `offer_description` | Yes | The product/service, price, and what the prospect gets |
| `scarcity_type` | Yes | One of: `limited_stock`, `time_limited`, `bonus_deadline`, `seasonal`, `enrollment_cap` |
| `deadline` | No | Specific date/time if applicable (e.g., "March 31, 2026 at midnight") |
| `inventory_count` | No | Actual remaining inventory or enrollment slots (must be truthful) |
| `target_audience` | Yes | Who the prospect is — awareness level and sophistication matter for scarcity framing |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Scarcity and urgency sit at the CTA layer of RMBC — they answer "why now?" after the mechanism answers "why this?" and proof answers "why believe?" Without a strong mechanism and proof foundation, urgency feels manipulative. With them, urgency feels like helpful information.

### Step 2 — Validate the Scarcity Claim

Before writing any copy, verify the scarcity is genuine:

| Scarcity Type | Genuine When | Fabricated When |
|---------------|-------------|-----------------|
| **Limited Stock** | Physical inventory has actual production/supply constraints | Digital product with "only 47 left" |
| **Time-Limited Pricing** | Price genuinely increases after deadline (and stays increased) | Countdown resets on page refresh |
| **Bonus Deadline** | Bonus is genuinely removed after date (and doesn't come back) | Bonus "expires" but is offered again next week |
| **Seasonal** | Offer tied to real calendar event, season, or market cycle | "Summer sale" in February |
| **Enrollment Cap** | Genuine capacity limit — coaching seats, cohort size, bandwidth | Artificial cap on a digital course with no interaction |

**If the scarcity claim cannot be ethically justified, STOP.** Output an honest assessment and recommend an alternative urgency approach (see Step 3 alternatives).

### Step 3 — Generate Scarcity Elements

For the validated scarcity type, produce three elements at different intensity levels:

#### Soft (Informational)
- States the scarcity as a fact without pressure
- Tone: helpful, matter-of-fact
- Best for: high-awareness, sophisticated audiences who resist hard sells

#### Medium (Motivational)
- States the scarcity with consequence framing — what happens if they miss it
- Tone: direct, clear stakes
- Best for: mid-awareness audiences who need a reason to act today vs. "someday"

#### Strong (Urgent)
- States the scarcity with specific numbers, countdown, and immediate consequence
- Tone: time-sensitive, concrete
- Best for: ready-to-buy prospects who need a final nudge, not more persuasion

For each intensity level, provide:

1. **Headline/Banner Copy** — The primary scarcity statement (1 line)
2. **Supporting Copy** — Context that makes the scarcity believable (2-3 sentences)
3. **Visual Treatment** — How to display it on the page (banner, badge, inline text, countdown)
4. **Placement** — Where on the page this element belongs (above fold, near CTA, in cart)
5. **Ethical Justification** — Why this claim is truthful and defensible

### Step 4 — Recommend Alternatives (If Scarcity Is Weak)

If the scarcity type is borderline or the user has no genuine scarcity, recommend these ethical alternatives:

| Alternative | How It Works | Example |
|-------------|-------------|---------|
| **Loss aversion framing** | Frame the cost of NOT buying (ongoing problem cost) | "Every month without this, you're losing $X to..." |
| **Momentum urgency** | The sooner they start, the sooner they see results | "Start today, see your first results by [date]" |
| **Social proof velocity** | Show how many people are buying/joining right now | "147 people joined this week" (if true) |
| **Decision fatigue** | Position buying as the END of their search, not a new commitment | "Stop researching — this is the solution" |
| **Seasonal relevance** | Connect to a real upcoming event or season | "Get ready before summer" (if it's spring) |

### Step 5 — Assemble the Scarcity Stack

Combine elements into a recommended page implementation:

1. **Primary placement** — The single most impactful scarcity element and where it goes
2. **Reinforcement** — A secondary mention that echoes the scarcity without repeating the same copy
3. **CTA integration** — How the scarcity language integrates into the call-to-action button and surrounding copy
4. **Email/ad echo** — How to reference the same scarcity in ads and emails driving to the page (must match exactly — mismatched urgency kills trust)

## Output Format

```
## Scarcity & Urgency: [Offer Name]

**Scarcity Type:** [type]
**Deadline:** [date/time or "ongoing"]
**Inventory:** [count or "N/A"]
**Ethical Status:** VERIFIED / BORDERLINE / NOT GENUINE

---

### SOFT (Informational)

**Banner:** "[copy]"
**Supporting:** [2-3 sentences]
**Visual:** [treatment]
**Placement:** [location]
**Ethics:** [justification]

---

### MEDIUM (Motivational)

**Banner:** "[copy]"
**Supporting:** [2-3 sentences]
**Visual:** [treatment]
**Placement:** [location]
**Ethics:** [justification]

---

### STRONG (Urgent)

**Banner:** "[copy]"
**Supporting:** [2-3 sentences]
**Visual:** [treatment]
**Placement:** [location]
**Ethics:** [justification]

---

### SCARCITY STACK (Recommended Implementation)

| Element | Location | Copy |
|---------|----------|------|
| Primary | [placement] | [copy] |
| Reinforcement | [placement] | [copy] |
| CTA integration | [button area] | [copy] |
| Email/ad echo | [subject line + preview] | [copy] |

---

### ALTERNATIVES (if applicable)

[Ethical alternatives if primary scarcity is weak]
```

## Quality Criteria

- Every scarcity claim must pass the ethical validation — no fabricated urgency, ever
- If scarcity cannot be verified as genuine, the skill must say so explicitly and offer alternatives
- Three intensity levels must be genuinely different in tone and approach — not the same copy with more exclamation marks
- Visual treatment must be specific and implementable — "add urgency" is not guidance
- Placement must account for mobile-first layout — scarcity elements must be visible without scrolling past the CTA
- CTA integration must feel natural — bolted-on urgency next to a calm CTA creates cognitive dissonance
- Email/ad scarcity must match page scarcity exactly — mismatched deadlines or claims destroy credibility

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/order-form-cro` to integrate scarcity elements into checkout pages
- Run `/lander-copy` to weave urgency into the full sales page
- Run `/offer-stack` to ensure the offer itself justifies the urgency
- Run `/pricing-strategy` to develop the pricing that scarcity protects
- Run `/broadcast-email` to write deadline-driven promotional emails
- Validate the full page with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/lander-copy` — integrate into landing page
- `/email-promo` — add urgency to email
- `/checkout-abandonment` — deploy at checkout

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

