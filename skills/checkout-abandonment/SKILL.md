---
name: checkout-abandonment
description: Diagnose and fix checkout abandonment — audit checkout flow for friction points, score abandonment risk, rank top friction sources by impact, and output specific copy/UX fixes using RMBC principles.
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
_ANALYTICS=$(grep '^analytics_enabled:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^analytics_enabled:[[:space:]]*//' || echo "true")
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "checkout-abandonment" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
- `/cart-abandonment-flow` — build recovery email sequence
- `/order-form-cro` — fix checkout friction
- `/scarcity-urgency` — add urgency elements

### RMBC Completeness

Always deliver the full framework implementation. AI makes the marginal cost of completeness near-zero:
- Include ALL hook types (not just 2-3)
- Cover ALL awareness levels (not just most-aware)
- Handle ALL major objections (not just the obvious ones)
- Show the mechanism (not just the result)

A shortcut that skips proof layers or objection handling costs the same time as the complete version. Always deliver complete.

After delivering output, if `ACTIVE_PRODUCT` is `none`: append a one-line tip — "Run `/rmbc-router` to set up a product workspace — future skills will pull from the same research, mechanism, and brief."
# checkout-abandonment

## Purpose

Diagnose and fix checkout abandonment. The average DTC checkout abandonment rate is 70% — meaning 7 out of 10 people who start buying leave without paying. Every percentage point recovered is pure profit because you've already paid to acquire that traffic. This skill audits an existing checkout flow for friction points across five categories (form complexity, trust signals, shipping/pricing surprises, payment options, mobile UX), scores abandonment risk, ranks the top 5 friction points by estimated revenue impact, and outputs specific copy and UX fixes for each.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `checkout_description` | Yes | Detailed description of the checkout flow — number of steps, fields, page layout, what the buyer sees |
| `current_abandonment_rate` | No | Current checkout abandonment rate (if known — enables benchmarking) |
| `product_type` | Yes | Product category: `supplement`, `physical_product`, `digital_product`, `subscription`, `service`, `course` |
| `price_point` | Yes | Price, payment plan options, and any discount framing currently shown |
| `target_audience` | Yes | Who the buyer is — demographics, tech comfort, purchase sophistication |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Checkout abandonment is a Copy problem as much as a UX problem — Research reveals which objections kill conversions at the payment step, Mechanism reinforcement reminds them why they decided to buy, Brief structures the page to resolve doubt before asking for payment, Copy executes every micro-element to reduce friction.

### Step 2 — Audit the Five Friction Categories

#### Category 1: Form Complexity (Weight: 25%)
- Total number of form fields (benchmark: 7 or fewer for single-page checkout)
- Optional vs required fields (are optional fields cluttering the form?)
- Field types (free text vs dropdowns vs auto-complete)
- Multi-step vs single-page (multi-step with progress bar can reduce perceived complexity)
- Auto-fill and auto-detection (country, state, card type)

#### Category 2: Trust Signals (Weight: 25%)
- SSL badge visibility and placement
- Money-back guarantee — visible near payment fields, not buried in footer
- Accepted payment method logos
- Customer count or social proof near checkout
- Company contact information accessible
- Privacy policy link near email field
- Known trust badges (Norton, McAfee, BBB — if applicable)

#### Category 3: Shipping & Pricing Surprises (Weight: 20%)
- Is shipping cost visible BEFORE the checkout page? (Surprise shipping is the #1 abandonment cause)
- Tax calculation — shown before or after entering payment?
- Are there unexpected fees that appear mid-checkout?
- Free shipping threshold — is it clear and achievable?
- Delivery timeline — is estimated delivery date shown?

#### Category 4: Payment Options (Weight: 15%)
- Credit/debit card acceptance
- PayPal, Apple Pay, Google Pay, Shop Pay availability
- Buy now, pay later options (Afterpay, Klarna, Affirm) — critical for $50+ purchases
- Payment plan availability for high-ticket items ($200+)
- Guest checkout vs forced account creation (forced account = 34% abandonment increase)

#### Category 5: Mobile UX (Weight: 15%)
- Single-column layout (no side-by-side fields on mobile)
- Touch target sizes (minimum 44px)
- Keyboard optimization (numeric keyboard for phone/card fields)
- Sticky CTA button or always-visible submit
- No horizontal scrolling
- Page load speed (3+ seconds = 53% mobile bounce)

### Step 3 — Score Abandonment Risk

Score each category 0-20 based on the audit findings:

| Score | Meaning |
|-------|---------|
| 0-5 | Critical — this category is actively driving abandonment |
| 6-10 | Poor — significant friction, immediate fixes needed |
| 11-15 | Acceptable — minor issues, optimize when possible |
| 16-20 | Strong — this category is well-handled |

**Abandonment Risk Score:** Sum of all 5 categories (0-100). Invert for risk: Risk = 100 - Score.

| Risk Level | Score | Typical Abandonment Rate |
|------------|-------|-------------------------|
| Critical | 0-30 | 80%+ |
| High | 31-50 | 70-80% |
| Moderate | 51-70 | 60-70% |
| Low | 71-85 | 50-60% |
| Excellent | 86-100 | Below 50% |

### Step 4 — Rank Top 5 Friction Points

From all findings across the five categories, identify the top 5 friction points ranked by estimated revenue impact:

For each friction point:
1. **What it is** — specific element causing friction
2. **Why it causes abandonment** — psychological or practical reason
3. **Estimated impact** — percentage of abandonment attributable to this issue
4. **The fix** — specific copy change, UX change, or both
5. **Implementation effort** — `quick_win` (< 1 hour), `medium` (1 day), `requires_dev` (1+ week)

### Step 5 — Write Specific Fixes

For each of the top 5 friction points, provide the exact fix:
- **Copy fixes:** Write the actual words (guarantee copy, trust statement, button text, error messages)
- **UX fixes:** Describe the specific change (field removal, element repositioning, badge placement)
- **Before/After:** Show what exists now vs what it should be

## Output Format

```
## Checkout Abandonment Audit: [Product/Brand]

**Product Type:** [type]
**Price Point:** [price with framing]
**Current Abandonment Rate:** [rate or "unknown"]
**Audience:** [target audience summary]

---

### ABANDONMENT RISK SCORE

| Category | Score | Weight | Weighted |
|----------|:---:|:---:|:---:|
| Form Complexity | /20 | 25% | X |
| Trust Signals | /20 | 25% | X |
| Shipping & Pricing | /20 | 20% | X |
| Payment Options | /20 | 15% | X |
| Mobile UX | /20 | 15% | X |
| **TOTAL** | **/100** | | **X/100** |

**Risk Level:** [Critical / High / Moderate / Low / Excellent]
**Estimated Abandonment Rate:** [based on score]

---

### TOP 5 FRICTION POINTS

#### 1. [Friction Point Name]
- **Category:** [which of the 5]
- **What:** [specific element]
- **Why it kills conversions:** [psychological/practical reason]
- **Estimated impact:** [% of abandonment]
- **Effort:** [quick_win / medium / requires_dev]

**Fix:**
- Before: [current state]
- After: [exact copy/UX change]

#### 2-5. [Same format]

---

### QUICK WINS (implement today)
1. [Fix with exact copy/instructions]
2. [Fix with exact copy/instructions]
3. [Fix with exact copy/instructions]

### MEDIUM EFFORT (this week)
1. [Fix with exact copy/instructions]

### REQUIRES DEVELOPMENT (this sprint)
1. [Fix with exact copy/instructions]

---

### REVENUE RECOVERY ESTIMATE
- **Current estimated abandonment:** [rate]%
- **Post-fix estimated abandonment:** [rate]%
- **Revenue recovery:** [if traffic/AOV data provided, calculate monthly $ recovered]
```

## Quality Criteria

- All five friction categories must be audited — skipping "payment options" because it seems fine misses real revenue
- Friction points must be ranked by revenue impact, not by how easy they are to spot
- Every fix must include exact copy or specific UX instructions — "improve trust signals" is not a fix
- Before/After must show the actual change, not a description of the change
- Mobile UX must be evaluated independently — "it works on desktop" is irrelevant for DTC
- Shipping surprise assessment is mandatory — surprise costs are the #1 documented cause of checkout abandonment
- Revenue recovery estimate must show math, not just a percentage

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/order-form-cro` to rewrite the optimized checkout page copy
- Run `/guarantee-writer` for risk-reversal copy to place near payment fields
- Run `/funnel-audit` to evaluate the full funnel, not just checkout
- Run `/ab-test-plan` to test checkout fixes with statistical rigor
- Run `/lander-copy` to ensure the page before checkout sets correct expectations
- Validate checkout copy with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`_RMBC_ROOT`). Pick one variant at random and append it as the final line of the output.
