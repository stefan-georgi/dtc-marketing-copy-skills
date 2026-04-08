---
name: guarantee-writer
description: Generate risk-reversal guarantees that convert fence-sitters — money-back, conditional, better-than-money-back, double-your-money, and performance-based with headline, terms, and visual treatment using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "guarantee-writer" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# guarantee-writer

## Purpose

Generate risk-reversal guarantees that convert fence-sitters into buyers. The guarantee is the most underrated conversion element in direct response — it doesn't just reduce risk, it demonstrates confidence in your mechanism. A strong guarantee says "we believe in our [mechanism] so much that we'll put our money where our mouth is." This skill produces 3 guarantee options across different types, each with a headline, terms, visual treatment suggestion, and copy ready for the checkout page, sales page, and email.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Product name and brief description of what it delivers |
| `price_point` | Yes | Price — affects guarantee framing (higher price = stronger guarantee needed) |
| `guarantee_type` | Yes | One of: `money_back`, `conditional`, `better_than_money_back`, `double_money_back`, `performance_based`, or `all` to generate one of each |
| `guarantee_duration` | Yes | How long the guarantee lasts: 30, 60, 90, 365 days, or `lifetime` |
| `target_audience` | Yes | Who the buyer is — their risk tolerance, sophistication, past experiences with guarantees |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. The guarantee is a Mechanism expression — it proves you believe in your own "why it works" story. Research reveals what risks the audience fears most. The Brief determines how aggressively to position the guarantee. Copy executes the guarantee language to feel confident, not defensive.

### Step 2 — Diagnose the Risk Profile

Before writing, understand what's actually at stake for the buyer:

| Risk Type | Question | Impact on Guarantee |
|-----------|----------|-------------------|
| **Financial** | Can they afford to lose this money? | Higher price = longer duration, stronger terms |
| **Results** | Do they believe the product will work? | Results skepticism = conditional or performance guarantee |
| **Trust** | Do they trust the company to honor the guarantee? | Low trust = simple process, no fine print, well-known payment processor |
| **Effort** | Will they have to work hard to get a refund? | Friction fear = "no questions asked" + clear process |
| **Social** | Will they feel foolish if it doesn't work? | Ego risk = frame guarantee as "smart insurance" not "safety net" |

### Step 3 — Generate Guarantee Options

For each requested type (or all 5 if `all` selected):

#### Type 1: Money-Back Guarantee
The standard. Simple, clear, no conditions.
- **Best for:** First-time buyers, lower price points, building initial trust
- **Headline pattern:** "The [Duration] No-Questions-Asked Guarantee"
- **Key copy element:** Emphasize the process simplicity — "Email us, get your money back. Period."
- **Risk to seller:** Highest refund rate but highest conversion lift
- **Duration guidance:** Match to time needed to see results (minimum 30 days)

#### Type 2: Conditional Guarantee
Refund if the buyer follows the program/uses the product AND doesn't get results.
- **Best for:** Courses, coaching, programs where effort matters
- **Headline pattern:** "The [Product/Method Name] Promise"
- **Key copy element:** Name the conditions clearly — "Use [system] for [X] days, do [specific actions], and if you don't [outcome]..."
- **Risk to seller:** Lower refund rate (conditions filter tire-kickers), slightly lower conversion lift
- **Duration guidance:** Conditions period + buffer (if 30-day program, offer 60-day guarantee)

#### Type 3: Better-Than-Money-Back
Buyer keeps something valuable AND gets a full refund.
- **Best for:** High-confidence offers, products with low-cost bonuses
- **Headline pattern:** "The Keep-Everything Guarantee"
- **Key copy element:** Name what they keep — "Even if you want a refund, keep [Bonus X] as our gift"
- **Risk to seller:** Same refund cost plus bonus fulfillment, but very high conversion lift
- **Duration guidance:** Same as money-back; the bonus retention is the differentiator

#### Type 4: Double-Your-Money-Back
If it doesn't work, buyer gets 2x their purchase price refunded.
- **Best for:** Ultra-high-confidence offers, market disruption, attention-grabbing
- **Headline pattern:** "The Double-Your-Money [Outcome] Guarantee"
- **Key copy element:** Make the math explicit — "Pay $97 today. If [product] doesn't [outcome], we send you $194."
- **Risk to seller:** Highest financial exposure; only use with proven product and low refund history
- **Duration guidance:** Typically shorter (30-60 days) to limit exposure window

#### Type 5: Performance-Based Guarantee
Tied to a specific, measurable result.
- **Best for:** Services, B2B, results-based offerings
- **Headline pattern:** "The [Specific Number] Guarantee"
- **Key copy element:** Name the exact metric — "If your [metric] doesn't improve by [X%] in [timeframe], we [refund/credit/compensate]"
- **Risk to seller:** Moderate — tied to measurable outcome, requires tracking
- **Duration guidance:** Match to realistic results timeline for the service

### Step 4 — Write Each Guarantee

For each guarantee, produce three versions:

**Sales Page Version (3-5 sentences):**
Full guarantee with headline, named guarantee, terms, and process.

**Checkout Version (1-2 sentences):**
Compressed guarantee placed near the payment button. Must build confidence in minimal space.

**Email Version (2-3 sentences):**
Guarantee copy for follow-up emails to non-buyers. Emphasize the risk-free nature of trying.

### Step 5 — Visual Treatment

For each guarantee, suggest:
- **Badge/seal design:** Shape, color, key text on the badge
- **Placement:** Where on the page the guarantee should appear (near CTA, in sidebar, above fold)
- **Typography:** What to bold, what size relative to body copy

## Output Format

```
## Guarantee Options: [Product Name]

**Price:** [price]
**Duration:** [duration]
**Audience Risk Profile:** [1-line summary of primary risk type]

---

### OPTION 1: [Guarantee Name] ([Type])

**Headline:** "[Guarantee headline]"

**Sales Page Copy:**
[3-5 sentence guarantee copy]

**Checkout Copy:**
[1-2 sentence compressed version]

**Email Copy:**
[2-3 sentence version for follow-up emails]

**Visual Treatment:**
- Badge: [shape, color, text]
- Placement: [where on page]
- Typography: [what to emphasize]

**Conversion impact:** [expected effect on conversion and refund rate]

---

### OPTION 2: [Same format]

---

### OPTION 3: [Same format]

---

### RECOMMENDATION
**Best option for this product:** [Option #] because [reason tied to audience risk profile and price point].
**Test against:** [Option #] — run as A/B test to validate.
```

## Quality Criteria

- Every guarantee must have a name — unnamed guarantees feel generic and forgettable
- Terms must be specific about duration, process, and any conditions — ambiguity feels like a loophole to buyers
- The refund process must be described in one sentence — complex processes signal the company doesn't want to honor it
- Checkout version must work in 1-2 sentences — the buyer is at the payment button, not reading paragraphs
- Conditional guarantees must name specific, achievable conditions — unreasonable conditions feel like a trap
- Double-money-back guarantees must only be recommended for proven products with low refund history
- Visual treatment must specify placement near the CTA — a guarantee buried in the footer doesn't reduce risk

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/offer-stack` to integrate the guarantee into the full offer architecture
- Run `/order-form-cro` to place the guarantee optimally on the checkout page
- Run `/lander-copy` for the sales page that presents the guarantee
- Run `/ab-test-plan` to test guarantee variations against each other
- Run `/checkout-abandonment` to diagnose if weak guarantee copy is causing drop-off
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/offer-stack` — build full offer around guarantee
- `/lander-copy` — integrate into landing page
- `/order-form-cro` — add to checkout

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

