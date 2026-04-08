---
name: email-promo
description: Generate RMBC-structured promotional email copy with A/B subject line variants — short-form, high-impact direct response emails.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "email-promo" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# email-promo

## Purpose

Generate promotional email copy structured around RMBC principles. Emails are short-form DR — every word must earn its place. The subject line is the hook (determines open rate), the preview text is the subhook (supports the open), and the body must drive a single click. This skill produces complete email copy including 3 subject line variants for A/B testing, preview text, body copy, CTA, and PS line. Output adapts to email type: launch, flash sale, cart recovery, or content-to-sale bridge.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires, sophistication level |
| `offer_details` | Yes | Price, discount, deadline, bonuses, or whatever makes this email worth sending now |
| `email_type` | Yes | One of: `launch`, `flash_sale`, `cart_recovery`, `content_to_sale` |
| `key_mechanism` | No | The product's unique mechanism (output from `/mechanism-ideation`) |
| `sender_voice` | No | One of: `founder`, `brand`, `expert`, `friend` (default: `founder`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Email applies RMBC in compressed form — Research drives subject line targeting, Mechanism is teased (not fully revealed — that's the landing page's job), Brief structures the email arc, Copy executes with economy.

### Step 2 — Define Email Structure by Type

| Type | Structure | Tone | Length |
|------|-----------|------|--------|
| Launch | Announcement → mechanism tease → offer → scarcity → CTA | Excitement + authority | 300-500 words |
| Flash Sale | Urgency → offer → proof → deadline → CTA | Direct + urgent | 200-350 words |
| Cart Recovery | Reminder → objection handling → guarantee → CTA | Empathetic + helpful | 150-250 words |
| Content-to-Sale | Value content → bridge → product mention → soft CTA | Educational + subtle | 400-600 words |

### Step 3 — Write Subject Lines (3 Variants)

Generate 3 subject lines for A/B testing:

| Variant | Strategy | Example Pattern |
|---------|----------|----------------|
| A | Curiosity | Open a loop — "The weird reason your [problem] won't go away" |
| B | Benefit-direct | State the outcome — "Get [result] in [timeframe]" |
| C | Pattern interrupt | Break inbox expectations — use a question, single word, or emoji |

Rules:
- Max 50 characters (mobile truncation)
- No ALL CAPS words
- No spam triggers (FREE!!!, Act Now, Limited Time)
- Each must work without preview text context

### Step 4 — Write Preview Text

- 40-90 characters
- Must complement (not repeat) the subject line
- Extends the curiosity loop or adds a proof point
- Appears in inbox preview on mobile — treat as a second headline

### Step 5 — Write Email Body

Structure for all types:
1. **Opening line (1-2 sentences)** — Hook that justifies the open. Deliver on the subject line promise immediately.
2. **Body (varies by type)** — Deploy the email-type structure from Step 2. One idea per paragraph. Short paragraphs (1-3 sentences max).
3. **CTA (1 clear link/button)** — One action. One link. Repeat it 2x in the email (mid-body and end).
4. **PS line** — The most-read line after the subject. Use it for: guarantee restatement, deadline reminder, or strongest proof point.

Formatting rules:
- Maximum 2 sentences per paragraph. At least 50% of paragraphs must be exactly 1 sentence. Single-sentence paragraphs create white space that guides the eye down the page on mobile — critical for scroll momentum through the email
- Line breaks between every paragraph
- Bold key phrases sparingly (1-2 per email)
- One link/CTA — never split attention across multiple offers
- No images in the copy output (images reduce deliverability in cold-ish lists)

### Step 6 — Write Sequence Context (if applicable)

If this email is part of a sequence, note:
- What email comes before this (what has the reader already seen?)
- What email comes after (what should this email set up?)
- Suggested send timing relative to previous email

## Output Format

```
## Promo Email: [Product/Offer Name]

**Email Type:** [launch | flash_sale | cart_recovery | content_to_sale]
**Sender Voice:** [founder | brand | expert | friend]
**Word Count:** ~XXX

---

### Subject Lines (A/B Test)

| Variant | Subject Line | Strategy |
|---------|-------------|----------|
| A | [subject] | Curiosity |
| B | [subject] | Benefit-direct |
| C | [subject] | Pattern interrupt |

**Preview Text:** [preview text]

---

### Email Body

**From:** [sender name/brand]

[Full email copy with line breaks between paragraphs]

[CTA BUTTON: Button text]

[Continued copy if needed]

[CTA LINK: Anchor text]

**PS —** [PS line]

---

## Testing Notes

- **Subject line test:** Send A vs B to 20% of list, winner to remaining 80%
- **Best send time for [email_type]:** [recommendation]
- **Sequence note:** [where this fits in a series, if applicable]
```

## Quality Criteria

- Subject lines must be under 50 characters and work on mobile inbox preview
- Preview text must not repeat the subject line
- Body must have only ONE call to action (one offer, one link destination)
- Opening line must deliver on the subject line's promise — no bait-and-switch
- PS line must be a standalone selling argument — many readers skip to PS first
- Email must scan well: short paragraphs, clear CTA, no walls of text
- Cart recovery emails must NOT hard-sell — empathy first, objection handling second

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/hook-battery` for subject line inspiration
- Run `/mechanism-ideation` for mechanism tease content
- Drive email clicks to pages built with `/lander-copy`
- Use `/lead-writer` for opening line variations
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/hook-battery` — generate subject line hooks
- `/copy-rewrite` — improve underperforming sections
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

