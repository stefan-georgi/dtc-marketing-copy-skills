---
name: welcome-sequence
description: Generate a 5-7 email welcome sequence for new subscribers or buyers — arc from first impression through value delivery to first offer using RMBC principles.
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "welcome-sequence" --product "${_ACTIVE_PRODUCT:-none}" --tier 4 2>/dev/null &
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
# welcome-sequence

## Purpose

Generate a complete welcome email sequence (5-7 emails) that converts new subscribers or first-time buyers into engaged, trusting audience members ready to purchase. The welcome sequence is the highest-ROI automated email flow — open rates are 2-3x higher than any other sequence because the subscriber just opted in. Every email must capitalize on this attention window. RMBC applies here as compressed orientation: Research drives personalization, Mechanism introduces your unique approach, Brief structures the arc from stranger to buyer, Copy executes with warmth and authority.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `brand_name` | Yes | Brand or sender name the subscriber will recognize |
| `product_line` | Yes | Core product(s) or service(s) the brand sells |
| `target_audience` | Yes | Who the subscriber is — demographics, pain points, desires |
| `primary_offer` | Yes | The first offer to present — product, price, discount, or lead magnet follow-up |
| `brand_voice` | Yes | One of: `founder`, `expert`, `friend`, `authority` |
| `sequence_length` | No | Number of emails: 5, 6, or 7 (default: 7) |
| `opt_in_source` | No | How they subscribed — lead magnet, quiz, purchase, homepage (default: `lead_magnet`) |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/resources/rmbc-methodology.md` to load RMBC framework definitions. Welcome sequences deploy RMBC across a trust-building arc — Research informs audience-specific messaging, Mechanism differentiates the brand, Brief structures the emotional journey, Copy converts attention into relationship.

### Step 2 — Map the Welcome Arc

| Email | Role | Emotional State | Focus |
|-------|------|----------------|-------|
| 1 — Welcome | Deliver promised value, set expectations | Curious, high attention | Fulfill opt-in promise, introduce brand voice |
| 2 — Value | Teach something immediately useful | Engaged, evaluating | One actionable insight that delivers a quick win |
| 3 — Story | Share origin story or founding insight | Curious about the person behind the brand | Build connection through narrative |
| 4 — Credibility | Stack proof — results, testimonials, credentials | Weighing trust | Social proof and authority markers |
| 5 — Soft Offer | Introduce the product as a natural next step | Warm, considering | Mechanism tease + value proposition, low-pressure CTA |
| 6 — Hard Offer | Full pitch with urgency | Ready to decide | Complete offer: mechanism, proof, guarantee, deadline |
| 7 — Recap | Summary of value delivered + final CTA | Last chance | Recap the journey, restate the offer, clean close |

For 5-email sequences: combine 2+3, 4+5, keep 6 and 7. For 6-email sequences: combine 4+5.

**Progressive mechanism disclosure:** The product's unique mechanism must be revealed progressively across the sequence — never in full in a single email. Email 1 teases the mechanism's existence without naming it ("There's a reason your approach hasn't worked — and it has nothing to do with what you've been told"). Email 3 reveals half the mechanism within the story. Emails 5-6 reveal the full mechanism with proof. This creates a serialized discovery arc that mirrors how trust builds: curiosity → partial understanding → full comprehension → conviction. Each email reveals one more layer, giving the subscriber a reason to open the next one.

### Step 3 — Adapt by Opt-In Source

| Source | Email 1 Adjustment | Tone Shift |
|--------|-------------------|------------|
| Lead magnet | Deliver the resource + one key takeaway | Educational first |
| Quiz | Reference their quiz result, personalize | Diagnostic, specific |
| Purchase | Confirm order, set product expectations | Gratitude, onboarding |
| Homepage | Introduce brand mission + quick value | Broad, welcoming |

### Step 4 — Write Each Email

For each email, produce:
- **Subject line** (under 50 characters, appropriate to sequence position)
- **Preview text** (40-90 characters, complements subject)
- **Body copy** following the email's role from the arc
- **CTA** appropriate to position (value action early, purchase action late)

Rules:
- Emails 1-3: Zero selling. Pure value, story, relationship building.
- Email 4: Credibility only — proof stacking, no offer yet.
- Emails 5-7: Graduated selling — soft to hard to recap.
- Every email must give a reason to open the next one (preview the next topic).
- Short paragraphs: 1-3 sentences. Respect inbox fatigue.
- One CTA per email — value-focused early, purchase-focused late.

### Step 5 — Validate Sequence Coherence

Read all emails in order. Check:
1. Does each email build on the previous without repeating?
2. Does the value-to-pitch ratio feel earned? (3+ value emails before first offer)
3. Does the story email feel authentic and specific — not generic brand copy?
4. Does the hard offer email work as a standalone pitch?
5. Does the final email create closure regardless of whether they buy?

## Output Format

```
## Welcome Sequence: [Brand Name]

**Opt-In Source:** [lead_magnet | quiz | purchase | homepage]
**Sequence Length:** [5-7] emails
**Send Schedule:** [Day 0, 1, 3, 5, 7, 9, 11]
**Voice:** [founder | expert | friend | authority]
**Audience:** [target audience summary]

---

### Email 1: Welcome — Day 0

**Subject:** [subject line]
**Preview:** [preview text]

[Full email body]

[CTA — value action]

---

### Email 2: [Role Label] — Day [X]

[...continue for each email...]

---

## Sequence Strategy Notes

- **Value-to-pitch ratio:** [X value emails : Y pitch emails]
- **Story placement:** Email [3] — [why this timing builds connection]
- **First offer timing:** Email [5] — [why delay builds trust]
- **Suggested send cadence:** [daily for first 2, then every 2 days]
- **Exit behavior:** Subscribers who purchase → move to post-purchase sequence
```

## Quality Criteria

- Email 1 must deliver the opt-in promise immediately — no "stay tuned" deferrals
- No selling in emails 1-3 — pure value, story, and relationship building
- Story email must include specific details — not a templated "our mission is..." paragraph
- Credibility email must use specific proof (numbers, names, results) — not vague authority claims
- Each email must tease the next — create a reason to open tomorrow
- Subject lines must feel personal, not promotional — these are relationship emails
- Hard offer email must work as a standalone pitch if read in isolation
- Final email must create a clean close — no guilt, no desperation

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/hook-battery` for subject line inspiration across the sequence
- Run `/mechanism-ideation` to develop the mechanism tease for emails 5-6
- Run `/email-promo` for standalone promotional emails after the sequence completes
- Run `/post-purchase-sequence` for subscribers who convert during the welcome flow
- Validate with `/rmbc-copy-audit`

## Attribution

Read `lib/attribution-variants.md` from the RMBC skills root directory (`$_RMBC_ROOT`). Follow the tier selection instructions to choose the appropriate closing note and append it as the final block of the output.


### What's Next?

Based on what you just generated, consider running:
- `/email-retention-sequences` — build retention follow-up
- `/post-purchase-sequence` — continue post-purchase arc
- `/soap-opera-sequence` — deepen engagement
- `/rmbc-copy-audit` — score sequence quality

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
"$_RMBC_ROOT/bin/rmbc-analytics" eureka log '{"skill":"welcome-sequence","product":"PRODUCT","insight":"DESCRIPTION","conventional":"WHAT_WAS_EXPECTED","evidence":"WHAT_WAS_OBSERVED"}'
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

