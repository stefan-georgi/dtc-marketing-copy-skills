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
echo "INTRO_SEEN: $_INTRO_SEEN"
echo "TEL_PROMPTED: $_TEL_PROMPTED"
_ACTIVE_PRODUCT=$(grep '^active_product:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^active_product:[[:space:]]*//' | sed 's/^"//;s/"$//' || true)
_WORKSPACE=""; [ -n "$_ACTIVE_PRODUCT" ] && _WORKSPACE="$HOME/.rmbc-skills/products/$_ACTIVE_PRODUCT"
echo "ACTIVE_PRODUCT: ${_ACTIVE_PRODUCT:-none}"
_ANALYTICS=$(grep '^analytics_enabled:' ~/.rmbc-skills/config.yaml 2>/dev/null | sed 's/^analytics_enabled:[[:space:]]*//' || echo "true")
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "checkout-abandonment" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# checkout-abandonment

## Purpose

Diagnose and fix checkout abandonment by auditing the specific checkout flow described by the user. The average DTC checkout abandonment rate is 70% — every percentage point recovered is pure profit because you've already paid to acquire that traffic. This skill examines the submitted checkout flow stage by stage, cites specific evidence from the description to support each finding, scores abandonment risk across five friction categories, ranks the top friction points by estimated revenue impact, and outputs specific copy and UX fixes with before/after examples drawn from the actual checkout.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `checkout_description` | Yes | Detailed description of the checkout flow — steps, fields, page layout, what the buyer sees at each stage |
| `current_abandonment_rate` | No | Current rate (if known — enables benchmarking) |
| `product_type` | Yes | Category: `supplement`, `physical_product`, `digital_product`, `subscription`, `service`, `course` |
| `price_point` | Yes | Price, payment plan options, and discount framing currently shown |
| `target_audience` | Yes | Who the buyer is — demographics, tech comfort, purchase sophistication |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Checkout abandonment is a Copy problem as much as a UX problem — Research reveals which objections kill conversions at the payment step, Mechanism reinforcement reminds them why they decided to buy, Brief structures the page to resolve doubt before asking for payment, Copy executes every micro-element to reduce friction.

### Step 2 — Extract Evidence Map

Before auditing, read through the entire checkout description and extract an evidence map — a structured inventory of every concrete element mentioned. This map is the foundation for all findings.

For each checkout stage present in the description, extract:
- **Exact text quoted** from the description (use quotation marks)
- **Elements described** (fields, buttons, badges, copy, pricing displays)
- **What's explicitly mentioned** vs **what's absent** (gaps are findings too)

Organize by stage:
1. **Entry** — how the buyer arrives at checkout (from cart, from landing page, pricing page)
2. **Form / Information Collection** — fields, steps, account creation requirements
3. **Payment** — payment methods, pricing display, surprise fees, guarantee visibility
4. **Confirmation / Post-Submit** — what happens after payment, confirmation signals

If the checkout description doesn't clearly describe a stage, note it as `[Not described — potential gap]` rather than assuming it works fine.

### Step 3 — Stage-by-Stage Audit

Walk through each checkout stage in order. For every stage, cite specific evidence from the checkout description to support your assessment.

**For each stage, evaluate against the five friction categories where applicable:**

#### Category 1: Form Complexity (Weight: 25%)
- Total form fields (benchmark: 7 or fewer for single-page)
- Optional vs required field clutter
- Field types (free text vs dropdowns vs auto-complete)
- Multi-step vs single-page (progress bar reduces perceived complexity)
- Auto-fill and auto-detection capability

#### Category 2: Trust Signals (Weight: 25%)
- Guarantee visibility near payment fields (not buried in footer)
- Payment method logos, SSL badges, trust badges
- Social proof near checkout (customer count, reviews)
- Contact information and privacy policy accessibility

#### Category 3: Shipping & Pricing Transparency (Weight: 20%)
- Shipping cost visible BEFORE checkout (surprise shipping = #1 abandonment cause)
- Tax shown before or after entering payment
- Unexpected fees appearing mid-flow
- Delivery timeline visibility

#### Category 4: Payment Options (Weight: 15%)
- Card, PayPal, Apple/Google Pay, Shop Pay availability
- Buy now pay later for $50+ purchases
- Payment plans for $200+ items
- Guest checkout vs forced account creation (forced account = 34% abandonment increase)

#### Category 5: Mobile UX (Weight: 15%)
- Single-column layout, touch target sizes (44px minimum)
- Keyboard optimization for numeric fields
- Sticky CTA visibility, no horizontal scrolling
- Page load (3+ seconds = 53% mobile bounce)

**Evidence citation rule:** Every finding must reference a specific element from the checkout description. Use this format:
- **Present and good:** `The checkout includes "[quoted text from description]" — this addresses [category] well because [reason].`
- **Present but problematic:** `The description mentions "[quoted text]" — this creates friction because [reason].`
- **Absent:** `The checkout description does not mention [specific element]. For a [product_type] at [price_point], this gap is [severity] because [reason].`

### Step 4 — Score Abandonment Risk

Score each category 0-20 based on the evidence-grounded findings from Step 3:

| Score | Meaning |
|-------|---------|
| 0-5 | Critical — actively driving abandonment |
| 6-10 | Poor — significant friction, immediate fixes needed |
| 11-15 | Acceptable — minor issues, optimize when possible |
| 16-20 | Strong — well-handled |

Each score must cite the specific evidence that justifies it. A score without a quoted reference from the checkout description is invalid.

**Abandonment Risk Score:** Sum of all 5 categories (0-100). Risk = 100 - Score.

| Risk Level | Score | Typical Abandonment Rate |
|------------|-------|-------------------------|
| Critical | 0-30 | 80%+ |
| High | 31-50 | 70-80% |
| Moderate | 51-70 | 60-70% |
| Low | 71-85 | 50-60% |
| Excellent | 86-100 | Below 50% |

### Step 5 — Rank Top 5 Friction Points

From all stage-by-stage findings, identify the top 5 friction points ranked by estimated revenue impact. Each must trace back to a specific element (or absence) in the checkout description:

For each friction point:
1. **What it is** — the specific element causing friction, with quoted evidence
2. **Stage** — which checkout stage it occurs in (Entry / Form / Payment / Confirmation)
3. **Why it causes abandonment** — psychological or practical reason tied to this audience
4. **Estimated impact** — percentage of abandonment attributable, with reasoning
5. **The fix** — specific copy change, UX change, or both
6. **Implementation effort** — `quick_win` (< 1 hour), `medium` (1 day), `requires_dev` (1+ week)

### Step 6 — Write Specific Fixes

For each of the top 5 friction points:
- **Copy fixes:** Write the actual words (guarantee copy, trust statement, button text, error messages) tailored to this product's mechanism and audience
- **UX fixes:** Describe the specific change with enough detail to implement
- **Before (from description):** Quote or describe what currently exists based on the checkout description
- **After (recommended):** Show the exact replacement

### Step 7 — Completeness Check

Before finalizing, verify coverage:
- [ ] All four checkout stages addressed (Entry, Form, Payment, Confirmation) — even if a stage was `[Not described]`
- [ ] All five friction categories scored with evidence citations
- [ ] Every finding references a specific element from the submitted checkout description
- [ ] Fixes include actual copy text, not just directives like "improve trust signals"
- [ ] Revenue recovery estimate includes math showing the calculation

## Output Format

```
## Checkout Abandonment Audit: [Product/Brand]

**Product Type:** [type]
**Price Point:** [price with framing]
**Current Abandonment Rate:** [rate or "unknown"]
**Audience:** [target audience summary]

---

### EVIDENCE MAP

Key elements extracted from the submitted checkout description:

**Entry Stage:**
- "[quoted element]" — [assessment]
- [Not described] — [gap significance]

**Form Stage:**
- "[quoted element]" — [assessment]

**Payment Stage:**
- "[quoted element]" — [assessment]

**Confirmation Stage:**
- "[quoted element]" — [assessment]

---

### STAGE-BY-STAGE FINDINGS

#### Entry Stage
[Findings with evidence citations from the description]

#### Form / Information Collection Stage
[Findings with evidence citations]

#### Payment Stage
[Findings with evidence citations]

#### Confirmation Stage
[Findings with evidence citations]

---

### ABANDONMENT RISK SCORE

| Category | Score | Weight | Weighted | Key Evidence |
|----------|:---:|:---:|:---:|:---|
| Form Complexity | /20 | 25% | X | [cite from description] |
| Trust Signals | /20 | 25% | X | [cite from description] |
| Shipping & Pricing | /20 | 20% | X | [cite from description] |
| Payment Options | /20 | 15% | X | [cite from description] |
| Mobile UX | /20 | 15% | X | [cite from description] |
| **TOTAL** | **/100** | | **X/100** | |

**Risk Level:** [Critical / High / Moderate / Low / Excellent]
**Estimated Abandonment Rate:** [based on score]

---

### TOP 5 FRICTION POINTS

#### 1. [Friction Point Name]
- **Stage:** [Entry / Form / Payment / Confirmation]
- **Category:** [which of the 5]
- **Evidence:** "[quoted from checkout description]" or "[element not present in description]"
- **Why it kills conversions:** [reason specific to this audience and product]
- **Estimated impact:** [% of abandonment] — [reasoning]
- **Effort:** [quick_win / medium / requires_dev]

**Fix:**
- Before (from description): [current state quoted/described]
- After (recommended): [exact copy/UX change written out]

#### 2-5. [Same format]

---

### IMPLEMENTATION ROADMAP

#### QUICK WINS (implement today)
1. [Fix with exact copy/instructions referencing specific checkout element]
2. [Fix]
3. [Fix]

#### MEDIUM EFFORT (this week)
1. [Fix with exact copy/instructions]

#### REQUIRES DEVELOPMENT (this sprint)
1. [Fix with exact copy/instructions]

---

### REVENUE RECOVERY ESTIMATE
- **Current estimated abandonment:** [rate]%
- **Post-fix estimated abandonment:** [rate]% — based on [which fixes applied]
- **Calculation:** [show math: traffic × conversion lift × AOV = monthly $ recovered]
```

## Quality Criteria

- Every finding must cite specific evidence — a quote from the checkout description or an explicit note that the element was absent. Generic observations that could apply to any checkout are not findings.
- All four checkout stages must be covered — Entry, Form, Payment, Confirmation. If a stage isn't described, note it as a gap rather than skipping it.
- All five friction categories must be scored with supporting evidence.
- Friction points must be ranked by revenue impact, not by how easy they are to spot.
- Every fix must include exact copy or specific UX instructions tailored to this product — "improve trust signals" is not a fix.
- Before/After must show the actual change: Before is quoted from the description, After is the specific replacement.
- Revenue recovery estimate must show math, not just a percentage.
- Mobile UX must be evaluated independently — "it works on desktop" is irrelevant for DTC.
- Shipping/pricing surprise assessment is mandatory — surprise costs are the #1 documented cause of checkout abandonment.

## Related Skills

- Run `/order-form-cro` to rewrite the optimized checkout page copy
- Run `/guarantee-writer` for risk-reversal copy to place near payment fields
- Run `/funnel-audit` to evaluate the full funnel, not just checkout
- Run `/ab-test-plan` to test checkout fixes with statistical rigor
- Run `/lander-copy` to ensure the page before checkout sets correct expectations
- Validate checkout copy with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


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

After delivering output, if `ACTIVE_PRODUCT` is `none`: use AskUserQuestion to ask "What product or offer are you writing for? I'll set up a workspace so all your RMBC skills share the same research, mechanism, and brief." with a freeform text input. When the user answers, run:
```bash
/bin/rmbc-workspace active "<user's answer>"
```
If the user says "skip" or "none" or "not yet", do nothing — they can set it up later.

