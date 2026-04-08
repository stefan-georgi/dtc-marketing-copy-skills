---
name: thank-you-page
description: Generate RMBC-structured thank you / order confirmation page copy — the highest-converting upsell real estate where buyer trust peaks and post-purchase momentum drives action.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "thank-you-page" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# thank-you-page

## Purpose

Generate complete thank you / order confirmation page copy structured around RMBC principles. The thank you page is the most underused conversion asset in DTC funnels — the customer just bought, trust is at its absolute peak, and they're actively looking for confirmation they made the right decision. This page must do three things: confirm their purchase, set expectations, and (optionally) present one more offer while the buying window is wide open. Structure: order confirmation → "what happens next" → surprise bonus → upsell offer → social share prompt.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_purchased` | Yes | What the customer just bought — name, price, core promise |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, desires |
| `delivery_details` | Yes | What happens next — shipping timeline, digital access instructions, onboarding steps |
| `upsell_product` | No | Optional next offer — name, price, how it complements the purchase |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Thank you pages apply RMBC in post-purchase mode — Research validates what buyers need to hear after committing, Mechanism reinforces why their purchase decision was smart, Brief structures the page for both confirmation and conversion, Copy executes with warmth first, sell second.

### Step 2 — Map Post-Purchase Psychology

The buyer is in a unique emotional state. Map the psychology driving this page:

- **Validation hunger** — They just spent money and need confirmation it was smart
- **Peak trust** — Payment is complete; they have nothing left to fear from you
- **Consumption anxiety** — "Did I make the right choice? Will this actually work for me?"
- **Reciprocity window** — You delivered on the sale; they feel inclined to give back (share, review, buy more)
- **Attention spike** — They're actively reading this page, not passively scrolling

### Step 3 — Write the Thank You Page

#### Section 1: Order Confirmation with Warm Tone (3-5 sentences)
- Confirm the order with specifics (product name, order number placeholder)
- Express genuine gratitude — not generic "thanks for your order"
- Reinforce the outcome they're about to experience
- Include a receipt summary block (product, price, order number, email confirmation note)
- **Tone shift:** Write as a friend congratulating them, not a corporation processing a transaction. Use warm, direct language: "Hey, you still there? You just did something amazing." Not: "Thank you for your purchase. Your order has been confirmed."

#### Section 1B: Four-Dimensional Future-Pacing

Immediately after confirmation, paint the transformation across all four dimensions:

- **Physical:** "Imagine waking up and [specific physical benefit]..."
- **Emotional:** "That nagging worry about [problem] starts to fade..."
- **Social:** "Picture the look on [person]'s face when they notice [visible change]..."
- **Psychological:** "The voice that told you nothing would work? It goes quiet..."

All four are mandatory. Each must use specific, vivid language tied to the product's promise -- no generic statements.

#### Section 2: What Happens Next (3-5 bullet points)
- Step-by-step: what they should expect and when
- For physical products: shipping timeline, tracking info, expected delivery
- For digital products: access instructions, login details, first-step guidance
- Set clear expectations to prevent support tickets and buyer's remorse

#### Section 3: Surprise Bonus (2-3 sentences)
- Introduce an unexpected bonus they didn't know about during checkout
- This could be: bonus content, extended guarantee, priority support, community access
- Frame it as a reward for being a customer — "Because you just joined..."
- This section builds goodwill before any upsell attempt

#### Section 4: Upsell Offer with Crossroads Close (if `upsell_product` provided)
- Transition: "One more thing before you go..."
- **Crossroads close** before CTA -- two contrasting paths:
  - **Stopping here:** "You could stop here -- [product] will [deliver core promise]."
  - **Continuing:** "But if you want [accelerated outcome], there's one more step..."
- Frame as continuation of transformation, NEVER correction of purchase. The upsell accelerates or protects results.
- 3-5 sentences after crossroads. Single CTA: "Add [Product] To My Order"
- Skip if no upsell_product provided

#### Section 5: Social Proof Bombardment

After the upsell CTA (or after bonus if no upsell), include 3-5 proof elements:
- Short testimonial quotes (1-2 sentences each)
- Specific metrics: "[X] customers served," "[Y]% report [outcome] within [timeframe]"
- UGC references or expert endorsements

Reduces buyer's remorse and provides indirect social proof for any upsell.

#### Section 6: Social Share Prompt (2-3 sentences)
- Ask them to share their purchase or excitement on social media
- Provide a pre-written share template they can copy
- Optional: incentive for sharing (discount code for next purchase, bonus content)

### Step 4 — Add Consumption Triggers

Include 1-2 elements that drive immediate product consumption:
- **Quick-start guide** — "Do this first" instruction (reduces refund rates)
- **Community link** — Facebook group, forum, or support channel
- **First milestone** — "Within 24 hours, you'll notice..." (sets expectations)

## Output Format

```
## Thank You Page: [Product Name]

**Product Purchased:** [name + price]
**Delivery Method:** [physical/digital]
**Upsell Included:** [yes/no]

---

### ORDER CONFIRMED

[3-5 sentences — warm confirmation + gratitude + outcome reinforcement]

**Order Summary:**
- Product: [name]
- Price: $XX
- Order #: [placeholder]
- Confirmation email sent to: [your email]

---

### YOUR TRANSFORMATION STARTS NOW

**Physical:** [1-2 sentences — vivid physical benefit]
**Emotional:** [1-2 sentences — inner state shift]
**Social:** [1-2 sentences — how others notice]
**Psychological:** [1-2 sentences — belief/identity change]

---

### WHAT HAPPENS NEXT

1. [Step 1 — immediate]
2. [Step 2 — within X hours/days]
3. [Step 3 — ongoing]

---

### YOUR BONUS

[2-3 sentences — surprise bonus reveal]

---

### [UPSELL SECTION — if applicable]

**You could stop here...** [1-2 sentences — baseline result acknowledgment]

**But if you want more...** [2-3 sentences — crossroads close + upsell offer]

**[CTA BUTTON]:** "Add [Product] To My Order — Just $XX"

---

### PROOF IT WORKS

[3-5 testimonial/proof elements reinforcing purchase decision]

---

### SHARE THE LOVE

[2-3 sentences + pre-written share template]

---

## Quick Start

- **Do this first:** [immediate action]
- **Join the community:** [link placeholder]
- **Your first milestone:** [what to expect within 24 hours]
```

## Quality Criteria

- Order confirmation must include specific product details — never generic "your order is confirmed"
- "What happens next" must set concrete timelines — no vague "soon" or "shortly"
- Surprise bonus must be genuinely unexpected — not something already promised during checkout
- Upsell section (if present) must be shorter than the confirmation section — confirmation first, sell second
- Social share template must be pre-written and copy-pasteable — don't ask them to compose from scratch
- Quick-start section must include one immediately actionable step — not "wait for delivery"
- Page tone must be warm and celebratory — this is a relationship moment, not a transaction

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)
- **RMBC 2 future-pacing:** Must include all four dimensions (physical, emotional, social, psychological) in the post-purchase reinforcement section

## Related Skills

- Run `/upsell-script` for a dedicated upsell page (separate from thank-you page upsell section)
- Run `/post-purchase-sequence` for the email follow-up after this page
- Run `/funnel-architecture` to see where this page fits in the full funnel
- Run `/order-form-cro` for the checkout page that precedes this page
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/upsell-script` — add post-purchase upsell
- `/post-purchase-sequence` — build follow-up emails
- `/welcome-sequence` — start onboarding

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

