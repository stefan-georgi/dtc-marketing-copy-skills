---
name: cart-abandonment-flow
description: Generate a 3-5 email cart abandonment recovery sequence with escalating urgency — from gentle reminder to final scarcity close using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "cart-abandonment-flow" --product "${_ACTIVE_PRODUCT:-none}" --tier 4 2>/dev/null &
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
# cart-abandonment-flow

## Purpose

Generate a cart abandonment email sequence (3-5 emails) that recovers lost sales from shoppers who added to cart but did not complete checkout. Cart abandoners are the highest-intent non-buyers in your funnel — they wanted the product enough to add it. Something stopped them: price doubt, distraction, shipping concern, or comparison shopping. Each email addresses a different recovery angle with escalating urgency. RMBC applies as objection architecture: Research identifies why they left, Mechanism reinforces why this product is the right choice, Brief escalates the urgency arc, Copy recovers the sale.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Name and brief description of the product left in cart |
| `price_point` | Yes | Product price — used for value framing and objection handling |
| `target_audience` | Yes | Who the shopper is — demographics, pain points, desires |
| `guarantee` | Yes | Money-back guarantee, return policy, or risk reversal offer |
| `shipping_info` | Yes | Shipping cost, free shipping threshold, or delivery timeline |
| `discount_offer` | No | Discount or incentive for completing purchase (e.g., 10% off, free gift) |
| `sequence_length` | No | Number of emails: 3, 4, or 5 (default: 4) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Cart abandonment sequences invert typical RMBC — the prospect already wants the product. The job is removing friction, not building desire. Mechanism reinforces their original interest. Proof handles objections. CTA removes the final barrier.

### Step 2 — Map the Recovery Arc

| Email | Timing | Role | Approach |
|-------|--------|------|----------|
| 1 — Reminder | 1 hour | Gentle nudge — "You left something behind" | Helpful, not pushy. Show the product. Simple CTA to return to cart. |
| 2 — Social Proof | 24 hours | Build confidence — "Here's why others love it" | Testimonials, ratings, results. Address the unspoken "is it worth it?" |
| 3 — Objection Handling | 48 hours | Remove barriers — address price, shipping, quality | Name the top objection directly. Deploy guarantee. Answer FAQ. |
| 4 — Scarcity/Final Offer | 72 hours | Last chance — urgency + sweetener | Stock warning, discount (if applicable), deadline. Final CTA. |

For 3-email sequences: combine emails 2+3 (social proof + objection handling in one email). For 5-email sequences: add a proof-stacking email between email 3 and email 4 — featuring testimonials, case studies, or user-generated results that build final-purchase confidence before the scarcity close.

### Step 3 — Identify the Abandonment Objections

Before writing, map the likely objections for this product and price point:

| Price Range | Primary Objection | Secondary Objection |
|-------------|-------------------|---------------------|
| Under $30 | "Do I really need this?" (impulse doubt) | Shipping cost exceeds perceived value |
| $30-$100 | "Is this the best option?" (comparison shopping) | "Can I find it cheaper elsewhere?" |
| $100-$300 | "Can I justify this expense?" (budget concern) | "What if it doesn't work for me?" |
| $300+ | "This is a big decision" (commitment anxiety) | "I need to think about it / ask someone" |

Email 3 must address the primary objection for the given price range directly.

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, appropriate to urgency level)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** — always links back to their cart with item(s) preserved

Rules:
- Email 1: NO discounts, NO urgency. Just a helpful reminder.
- Email 2: NO discounts. Let social proof do the work.
- Email 3: Deploy the guarantee prominently. Address objections by name.
- Email 4: Deploy discount (if provided) and scarcity. This is the last touch.
- Tone: empathetic throughout. They are not leads — they are almost-customers.
- Every email must show/reference the specific product they abandoned.
- Short and focused: cart emails compete with every other recovery email. Respect attention.

### Step 5 — Validate Recovery Coverage

Check that the sequence addresses:
1. Simple forgetfulness (email 1 — "you left this behind")
2. Social validation need (email 2 — "others love this")
3. Specific purchase objections (email 3 — named and resolved)
4. Decision urgency (email 4 — reason to act now, not later)

If any gap exists, revise.

## Output Format

```
## Cart Abandonment Flow: [Product Name]

**Product:** [product name] — $[price]
**Sequence Length:** [3-5] emails
**Send Schedule:** 1h → 24h → 48h → 72h
**Audience:** [target audience summary]
**Primary Objection:** [identified objection for this price point]

---

### Email 1: Reminder — 1 Hour

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body — gentle, helpful, product image reference]

[CTA: Return to cart]

---

### Email 2: [Role Label] — 24 Hours

[...continue for each email...]

---

## Recovery Strategy Notes

- **Primary objection:** [what stops this audience at this price point]
- **Guarantee placement:** Email [3] — [type of guarantee and how it's framed]
- **Discount strategy:** [if discount offered: which email, what %, why delayed]
- **Expected recovery rate:** [benchmark: 5-15% of abandoners for well-optimized flows]
- **Exit behavior:** Non-converters after email 4 → add to retargeting audience
```

## Quality Criteria

- Email 1 must be purely helpful — no urgency, no discount, no pressure
- Social proof in email 2 must be specific — star ratings, testimonial quotes, unit counts
- Email 3 must name the actual objection for the price point — not a vague "still thinking?"
- Guarantee must be prominently displayed — not buried in a PS line
- Discount (if used) must only appear in the final email — never reward early abandonment
- Every email must reference the specific product left in cart — not generic "items in your cart"
- Tone must be empathetic throughout — these are almost-customers, not cold leads
- CTAs must link back to the preserved cart, not to a product page

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` to reinforce why this product is uniquely effective
- Run `/email-promo` for promotional emails to non-abandoners
- Run `/post-purchase-sequence` for customers who convert from this flow
- Run `/guarantee-writer` for guarantee copy used in email 3
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/checkout-abandonment` — optimize checkout page
- `/scarcity-urgency` — add urgency to recovery emails
- `/email-promo` — promotional recovery offer

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

### Eureka Logging

If you discover a result contradicting conventional DR copywriting wisdom, log it:
```bash
"$_RMBC_ROOT/bin/rmbc-analytics" eureka log '{"skill":"cart-abandonment-flow","product":"PRODUCT","insight":"DESCRIPTION","conventional":"WHAT_WAS_EXPECTED","evidence":"WHAT_WAS_OBSERVED"}'
```
Only log genuine surprises — not every result.

### Sequence Coherence Check

Before delivering, verify:
- [ ] Tone consistency across all emails (no jarring shifts)
- [ ] Escalation arc (urgency/value builds across sequence)
- [ ] CTA progression (soft → medium → hard across emails)
- [ ] No repeated hooks/angles between emails
- [ ] Each email can stand alone (reader may skip earlier ones)

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.

