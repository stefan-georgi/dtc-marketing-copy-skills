---
name: offer-stack
description: Design irresistible offer stacks — core offer, bonuses, guarantee, urgency, and price anchoring structured to hit a 10:1 perceived-value-to-price ratio using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "offer-stack" --product "${_ACTIVE_PRODUCT:-none}" --tier 3 2>/dev/null &
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
# offer-stack

## Purpose

Design irresistible offer stacks that make the price feel like a steal. An offer stack is the complete package a prospect receives — the core offer plus bonuses, guarantee, urgency, and price anchoring. The target: 10:1 perceived value to actual price. If the product costs $97, the stack should feel worth $970+. This skill structures every component with a name, description, retail value, and a reason it matters to the ICP. The offer stack is where Mechanism meets money — every bonus reinforces the core mechanism and removes a specific objection.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `core_product` | Yes | What the main product/service is, what it does, key features or deliverables |
| `price_point` | Yes | Actual price the customer pays, plus any payment plan options |
| `target_audience` | Yes | Who the buyer is — demographics, pain points, desires, awareness level |
| `num_bonuses` | No | Number of bonuses to include (default: 3, range: 2-5) |
| `guarantee_type` | No | Preferred guarantee: `money_back`, `conditional`, `better_than_money_back`, `performance`, `double_money_back` (default: `money_back`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Offer stacking applies RMBC at the deal level — Research reveals which objections the bonuses must neutralize, the Mechanism determines what "only we" bonuses make sense, the Brief structures the stack for maximum perceived value, and Copy names each component compellingly.

### Step 2 — Analyze the Value Architecture

Before building the stack, map the prospect's decision framework:

| Factor | Question | How It Shapes the Stack |
|--------|----------|------------------------|
| **Core desire** | What outcome do they want most? | Core offer messaging leads with this |
| **Primary objection** | Why would they NOT buy? | Guarantee and key bonus address this |
| **Secondary objections** | What else holds them back? | Remaining bonuses address these |
| **Comparison set** | What else could they spend this money on? | Price anchoring uses this as reference |
| **Time to value** | How quickly do they need results? | Fast-start bonus accelerates perceived time to value |

### Step 3 — Build the Offer Stack

#### Component 1: Core Offer
- **Name:** A benefit-loaded name, not a product description ("The 90-Day Metabolic Reset System" not "Weight Loss Course")
- **Description:** 2-3 sentences focused on the transformation, not the features
- **Retail Value:** Anchored to market comparables (what would an equivalent service/product cost?)
- **Key deliverables:** Bullet list of what's included — specific and tangible

#### Component 2: Bonuses (default 3)
Each bonus must pass three tests:
1. **Objection killer** — Does it neutralize a specific reason NOT to buy?
2. **Mechanism reinforcer** — Does it connect to the core product's mechanism?
3. **Low fulfillment cost** — Can it be delivered without significant additional cost?

Bonus types ranked by perceived value:
| Type | Perceived Value | Fulfillment Cost | Best For |
|------|----------------|-------------------|----------|
| Live session/call | Very high | Medium (time) | High-ticket, coaching, services |
| Video training | High | Low (one-time creation) | Courses, info products |
| Template/toolkit | High | Very low | Any product with implementation |
| Digital guide/PDF | Medium | Very low | Supplements, physical products |
| Community access | High | Low (ongoing moderation) | Subscriptions, courses |
| Checklist/cheatsheet | Medium | Very low | Quick wins, fast-start items |

For each bonus:
- **Name:** Named and branded ("The Quick-Start Implementation Checklist" not "a checklist")
- **Description:** 1-2 sentences — what it is AND why it matters for their outcome
- **Retail Value:** What this would cost if purchased separately (be defensible, not absurd)
- **Objection it kills:** Which specific objection this bonus neutralizes

#### Component 3: Guarantee
Frame the guarantee as confidence, not risk — "We're so confident because [mechanism-based reason]."

| Guarantee Type | Copy Frame | Best For |
|----------------|-----------|----------|
| **Money-back** | "Try it for [X] days. If you don't [outcome], we refund every penny." | Standard, low-risk |
| **Conditional** | "Follow the [system] for [X] days. If you don't [outcome], we refund you." | Courses, coaching (filters tire-kickers) |
| **Better-than-money-back** | "If it doesn't work, keep [bonus] AND get your money back." | High-confidence offers |
| **Performance** | "If you don't [specific measurable result], we [specific compensation]." | Results-based services |
| **Double-money-back** | "If you don't [outcome], we'll refund double your investment." | Very high-confidence, attention-grabbing |

#### Component 4: Urgency
Only include if the urgency is genuine. Types:
- **Deadline:** Specific date the offer expires
- **Quantity:** Limited units, spots, or seats available
- **Bonus expiry:** Bonuses available only until [date]
- **Price increase:** Price goes up after [date/event]

Never fabricate urgency. If no genuine urgency exists, skip this component and note that the offer is evergreen.

#### Component 5: Price Anchoring
Structure the value reveal to make the price feel small:
1. Stack total retail value of all components
2. Show the "value" total prominently
3. Reveal the actual price as a fraction
4. Calculate the ratio: Total Value / Actual Price = X:1
5. Target: 10:1 minimum. Below 5:1 means the stack needs more perceived value.

### Step 4 — Validate the Stack

Check the complete offer against these criteria:
- [ ] Value ratio is 10:1 or higher
- [ ] Every bonus kills a specific objection (no "filler" bonuses)
- [ ] Guarantee duration is long enough to try the product (30 days minimum)
- [ ] Price anchoring uses defensible retail values — not inflated nonsense
- [ ] A first-time visitor could understand the full offer in under 60 seconds
- [ ] The stack works on mobile — the value breakdown must be scannable

## Output Format

```
## Offer Stack: [Core Product Name]

**Target Audience:** [ICP summary]
**Price:** [actual price]
**Target Value Ratio:** 10:1

---

### CORE OFFER
**[Product Name]** — Retail Value: $X,XXX
[2-3 sentence description focused on transformation]

Key deliverables:
- [Deliverable 1]
- [Deliverable 2]
- [Deliverable 3]

---

### BONUS 1: [Bonus Name] — Value: $XXX
[1-2 sentence description]
**Kills objection:** "[specific objection]"

### BONUS 2: [Bonus Name] — Value: $XXX
[1-2 sentence description]
**Kills objection:** "[specific objection]"

### BONUS 3: [Bonus Name] — Value: $XXX
[1-2 sentence description]
**Kills objection:** "[specific objection]"

---

### GUARANTEE
**[Guarantee Name]** ([type] — [duration])
[2-3 sentence guarantee copy]

---

### URGENCY
[Urgency element — or "Evergreen offer: no artificial urgency"]

---

### PRICE ANCHOR

| Component | Value |
|-----------|------:|
| [Core Offer] | $X,XXX |
| [Bonus 1] | $XXX |
| [Bonus 2] | $XXX |
| [Bonus 3] | $XXX |
| **Total Value** | **$X,XXX** |
| **You Pay** | **$XX** |
| **Value Ratio** | **X:1** |

---

### STACK VALIDATION
- Value ratio: [X:1 — pass/fail]
- Every bonus kills an objection: [pass/fail]
- Guarantee duration adequate: [pass/fail]
- Retail values defensible: [pass/fail]
- Mobile-scannable: [pass/fail]
```

## Quality Criteria

- Value ratio must hit 10:1 minimum — below this the offer doesn't feel irresistible
- Every bonus must name the specific objection it neutralizes — "nice to have" bonuses dilute the stack
- Retail values must be defensible — if someone Googled the bonus, the value should hold up
- Guarantee must be specific about duration, process, and conditions — vague guarantees feel like loopholes
- Urgency must be genuine or explicitly omitted — fake scarcity is worse than no urgency
- The stack must be presentable on a mobile sales page — if the value table is unreadable on a phone, it fails

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/bonus-stack` for deeper bonus design with fulfillment cost analysis
- Run `/guarantee-writer` for extended guarantee copy variations
- Run `/lander-copy` to write the sales page that presents this offer stack
- Run `/hook-battery` for headlines that lead into the offer reveal
- Run `/mechanism-ideation` to ensure bonuses reinforce the core mechanism
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/pricing-strategy` — validate pricing
- `/bonus-stack` — design bonuses
- `/guarantee-writer` — craft guarantee
- `/funnel-architecture` — map the delivery funnel

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

