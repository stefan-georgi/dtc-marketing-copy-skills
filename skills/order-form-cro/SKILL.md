---
name: order-form-cro
description: Optimize order form / checkout page copy for conversion — mobile-first layout, trust elements, guarantee copy, bump offers, and friction reduction using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "order-form-cro" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
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
# order-form-cro

## Purpose

Optimize order form and checkout page copy for maximum conversion. The order form is where money changes hands — and where most funnels lose 60-80% of their prospects. Every element on this page either builds confidence or creates doubt. This skill outputs optimized copy for every checkout element: headline reinforcement, order summary, trust badges, guarantee, testimonials, urgency, form field labels, and bump offer copy. Mobile-first is mandatory — minimize fields, single-column layout, thumb-friendly buttons.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Product name and brief description |
| `price_point` | Yes | Price, payment plans, and any discount framing |
| `guarantee` | Yes | Money-back guarantee details — duration, terms, process |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, sophistication level |
| `current_conversion_rate` | No | Current checkout conversion rate (if known — enables gap analysis) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Order form CRO applies RMBC at the point of highest friction — Research reveals the objections that kill conversions, Mechanism reinforcement reminds them WHY they're buying, Brief structures trust-building elements around the form, Copy executes every micro-element to reduce friction and build confidence.

### Step 2 — Diagnose Conversion Killers

Before writing, identify the top friction sources for this checkout:

| Friction Type | Signal | Impact |
|---------------|--------|--------|
| **Price shock** | Price feels high relative to perceived value | Cart abandonment spike |
| **Trust deficit** | Prospect doesn't feel safe entering payment info | Form abandonment |
| **Complexity** | Too many fields, confusing layout, unclear steps | Drop-off mid-form |
| **Doubt** | "Will this actually work for me?" | Last-second exit |
| **Distraction** | Navigation, links, competing CTAs on page | Attention leak |

### Step 3 — Write Each Checkout Element

**Decision-sequence ordering:** Present checkout elements in the buyer's psychological decision sequence: (1) Price justification — why this is worth it (headline + order summary), (2) Social proof — others have done this and succeeded (testimonial), (3) Risk removal — you can't lose (guarantee), (4) Urgency — why now, not later (urgency element), (5) Final commitment — make it easy (form + button). Do NOT place urgency before trust elements, or guarantee after the submit button. Each element builds on the confidence established by the previous one.

#### Element 1: Headline Reinforcement
- Restate the core promise from the landing page — message match is critical
- Format: "[Product Name]: [Core Outcome]" or "Complete Your Order: [Benefit]"
- Must match the exact language from the CTA they clicked to get here

#### Element 2: Order Summary Copy
- Product name with a benefit-loaded description (not just SKU)
- Price with value anchoring: "Regular $XXX — Today: $XX (Save XX%)"
- If subscription: clearly state billing frequency and cancellation terms
- Include a product image — visual confirmation of what they're getting

#### Element 3: Trust Badges
- Placement: directly below price, above payment fields
- Required badges: SSL/secure checkout, money-back guarantee icon, accepted payment methods
- Optional: "As seen in" logos, customer count, industry certifications
- Copy beneath badges: one-line trust statement ("256-bit SSL encryption — your information is safe")

#### Element 4: Guarantee Copy
- Position: visible without scrolling past the form
- Bold the guarantee duration: "**60-Day** Money-Back Guarantee"
- Name the guarantee (e.g., "The No-Questions Promise")
- Explain the process in 1-2 sentences: "If you're not thrilled, email us and we'll refund every penny"
- Remove risk language — "no risk" is less effective than describing the positive process

#### Element 5: Testimonial Placement
- 1-2 short testimonials directly on the checkout page
- Must address the #1 objection for this product (results skepticism, value for money, ease of use)
- Include name and photo if available — specificity builds trust
- Position: beside or below the form, never above the fold competing with the headline

#### Element 6: Urgency Elements
- Only use if genuine: limited stock, expiring discount, bonus deadline
- Copy: specific and verifiable ("Sale ends March 15" not "Act now!")
- Visual: countdown timer or stock counter (if truthful)
- Never fabricate urgency — false scarcity destroys trust permanently

#### Element 7: Form Field Optimization
- Minimum viable fields: name, email, payment. Remove everything else possible
- Single-column layout — never side-by-side fields on mobile
- Smart defaults: auto-detect country, auto-format card number
- Field labels above fields (not placeholder text that disappears)
- Progress indicator if multi-step: "Step 2 of 2" with a progress bar
- Error messages inline and specific: "Please enter a valid email" not "Error in field"

#### Element 8: Bump Offer Copy
- Checkbox below order summary, above payment button
- Format: "YES! Add [Product] for just $XX (one-time)"
- 1-2 sentence description focused on how it complements the main purchase
- Price must feel incidental relative to the main purchase (typically 20-40% of front-end price)
- Pre-checked is aggressive; unchecked with compelling copy is higher-trust

#### Element 9: Submit Button
- Button text must restate the benefit: "Get [Outcome] Now" or "Complete My Order"
- Never: "Submit", "Pay Now", "Buy", "Process Payment"
- Below button: micro-copy reinforcing guarantee ("Protected by our 60-day guarantee")
- Button color must contrast with page — highest-contrast element on screen

#### Element 10: Progress Micro-Copy Between Elements
Between every major element (after order summary, after trust badges, after guarantee, after testimonial), include one line of progress micro-copy: a reassurance statement that reduces cognitive friction at that specific checkpoint. Each micro-copy line must include a specific number, name, or fact — no generic "You're almost there." Examples: "Join 10,847 customers who chose JointShield this month", "Your card is protected by 256-bit SSL — same encryption used by Chase and Wells Fargo", "You're 30 seconds from the same UC-II formula used in the Mount Sinai trial." These lines serve as friction-reducers that address the specific anxiety a buyer feels at each stage of the form.

### Step 4 — Mobile Audit

Verify all elements work on a single-column mobile layout:
- [ ] Headline visible without scrolling
- [ ] Order summary collapsible or compact
- [ ] Form fields full-width, thumb-friendly (min 44px tap targets)
- [ ] Trust badges visible near payment fields
- [ ] Submit button sticky or always accessible
- [ ] No horizontal scrolling anywhere
- [ ] Guarantee visible without scrolling past the form

## Output Format

```
## Order Form CRO: [Product Name]

**Price:** [price with framing]
**Guarantee:** [guarantee summary]
**Target Audience:** [ICP summary]
**Current Conversion Rate:** [if provided]

---

### HEADLINE
[Headline copy — message-matched to landing page CTA]

### ORDER SUMMARY
[Product description + price anchoring + image note]

### TRUST BADGES
[Badge list + trust statement copy]

### GUARANTEE
[Named guarantee + copy — 2-3 sentences]

### TESTIMONIAL
[1-2 checkout-specific testimonials]

### URGENCY
[Urgency element — only if genuine]

### FORM FIELDS
[Recommended field list with labels + layout notes]

### BUMP OFFER
☐ YES! [Bump offer copy — 1-2 sentences + price]

### SUBMIT BUTTON
**Button:** "[Benefit-driven button text]"
**Micro-copy:** [guarantee reinforcement below button]

---

### MOBILE CHECKLIST
[Pass/fail on each mobile criterion]

---

### CONVERSION NOTES
- **Primary objection addressed:** [which objection and how]
- **Friction points removed:** [what was simplified]
- **Expected lift:** [estimated improvement if current rate provided]
```

## Quality Criteria

- Headline must message-match the CTA the prospect clicked to arrive — any mismatch kills conversions
- Form must require the minimum viable fields — every extra field reduces conversion by 5-10%
- Guarantee must be visible without scrolling past the form — hidden guarantees don't reduce risk
- Submit button must use benefit language — "Submit" and "Pay Now" both reduce click rates
- Urgency elements must be genuine — fabricated scarcity destroys trust and invites chargebacks
- Bump offer must complement the main purchase — not a random product
- Every element must pass the mobile audit — desktop-only checkout is a conversion killer in DTC

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/lander-copy` for the sales page that precedes this checkout
- Run `/guarantee-writer` for extended guarantee copy options
- Run `/upsell-script` for the page that follows successful checkout
- Run `/funnel-audit` to evaluate this checkout in context of the full funnel
- Run `/funnel-architecture` to see optimal checkout placement and flow
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/checkout-abandonment` — build recovery flow
- `/funnel-audit` — audit full funnel context
- `/scarcity-urgency` — add urgency elements

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

