---
name: pdp-ecomm-template
description: Generate RMBC-structured product detail page (PDP) copy for e-commerce — extracts proven structure from top-performing pages and rewrites for a new product.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "pdp-ecomm-template" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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
# PDP E-Commerce Template

## Purpose
Generate high-converting product detail page copy using RMBC methodology. The skill extracts structural patterns from proven top-performing PDPs (Primal Queen, Happy Mammoth, etc.) and applies that architecture to a new product. The PDP is often the highest-revenue page in a DTC funnel — every word is high-leverage.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_name` | Yes | Product name as it appears on the label/site |
| `product_description` | Yes | What the product is, what it does, core value proposition |
| `key_ingredients_features` | Yes | Top ingredients or features with proof points (clinical data, patents, percentages) |
| `price_point` | Yes | Retail price + any bundle/subscription pricing |
| `target_audience` | Yes | ICP description — demographics, psychographics, core pain |
| `reference_page_url` | No | URL of a high-performing PDP to extract structure from |
| `traffic_source` | No | `meta` \| `native` \| `organic` \| `email`. Default: `meta`. Adjusts tone/length |

## Execution Protocol

### Step 1: Load Context
Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework, including framework overview, quality dimensions, and mobile-first principles.

### Step 2: Calibrate for Traffic Source
Adjust copy length and tone based on traffic source:
- **Meta (warm):** Shorter, proof-heavy, assumes some brand awareness. Lead with social proof or results.
- **Meta (cold):** Medium length, problem-agitate-mechanism structure. Education required.
- **Native ads:** Longest copy. Advertorial-adjacent tone. Full mechanism education before product reveal.
- **Organic/SEO:** Balanced length. Feature-benefit focus. FAQ-heavy for search intent.
- **Email:** Shortest. Relationship-aware. Lead with offer or new proof.

### Step 3: Extract Reference Structure
If `reference_page_url` is provided, analyze the page structure and extract the section-by-section template (headings, proof placement, CTA cadence, mobile layout). If not provided, use the default 9-section PDP architecture below.

### Step 4: Generate PDP Copy
Write each section following the output structure. Apply mobile-first hierarchy: short paragraphs, scannable subheads, visual break points noted in brackets.

### Step 5: Apply Value-Comparison Pricing
In the price anchoring section, explicitly calculate unit economics. Show the math: "$X per serving vs $Y for [competitor/alternative]." Make the comparison visceral and specific.

### Step 6: Validate Against Quality Dimensions
Score the draft against RMBC quality dimensions (result specificity, mechanism novelty, proof believability, CTA clarity). Flag any dimension below 15/25 with a revision note.

## Output Format

```
## PDP Copy: [Product Name]
**Traffic source:** [source] | **ICP:** [1-line summary]

---

### 1. Above the Fold
**Headline:** [Primary headline — benefit-driven, specific]
**Subhead:** [Mechanism hint or proof point]
**Hero image direction:** [What the image should communicate]
**Primary CTA:** [Button text + context]

### 2. Problem Section
[Agitate the core pain. Be specific to the ICP. Use their language. 3-5 short paragraphs, mobile-optimized.]

### 3. Mechanism Reveal
[Why THIS product works. Unique angle that passes the "only we" test. Bridge from problem to solution without being generic.]

### 4. Ingredient/Feature Highlights
**[Ingredient/Feature 1]:** [Proof point — clinical data, percentage, patent]
**[Ingredient/Feature 2]:** [Proof point]
**[Ingredient/Feature 3]:** [Proof point]
[Up to 5. Each must have a specific proof point, not a vague claim.]

### 5. Social Proof Section
**Star rating:** [X.X / 5]
**Review count:** [N+ reviews]
**Featured testimonial 1:** "[Quote]" — [Name, credential/context]
**Featured testimonial 2:** "[Quote]" — [Name, credential/context]
**Placement note:** [Where to position reviews relative to CTA]

### 6. Value Stack
| You Get | Retail Value |
|---------|-------------|
| [Item 1] | $XX |
| [Item 2] | $XX |
| [Bonus if applicable] | $XX |
| **Total value** | **$XXX** |

### 7. Price Anchoring
[Value-comparison pricing. Show unit economics explicitly. Compare to competitor price, daily coffee, or relevant anchor. Make the math obvious.]

### 8. CTA + Guarantee
**CTA:** [Specific button text + urgency element]
**Guarantee:** [Risk reversal — days, terms, tone]
**Guarantee framing:** [How to present the guarantee as confidence, not desperation]

### 9. FAQ
1. **[Objection as question]** — [Direct answer that resolves and redirects to benefit]
2. **[Objection as question]** — [Answer]
3. **[Objection as question]** — [Answer]
4. **[Objection as question]** — [Answer]
5. **[Objection as question]** — [Answer]

---

```

## Quality Criteria
- Mobile-first: no paragraph longer than 3 lines on mobile (roughly 40 words max)
- Every ingredient/feature claim backed by a specific proof point (number, study, patent)
- Value-comparison pricing includes explicit unit economics math
- Mechanism section passes the "only we" test — not interchangeable with competitor claims
- CTA is specific action + urgency + risk reversal (never "Learn more")
- FAQ questions are real objections, not softballs

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills
- `ingredient-research` — run first to generate proof points for ingredient/feature highlights
- `unified-research-synthesizer` — run first for strategic brief and ICP deep-dive
- `mechanism-ideation` — run first to develop the unique angle for section 3
- `rmbc-copy-audit` — validate the finished PDP copy against RMBC scoring

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/hook-battery` — generate product page hooks
- `/rmbc-copy-audit` — score page quality
- `/order-form-cro` — optimize the checkout

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

