---
name: rmbc-router
description: "Route copywriting requests to the right RMBC skill. Matches: hooks, headlines, openers, scroll-stoppers → hook-battery | Facebook ads, Meta ads, paid social → fb-ad-copy | email, promotional email, blast → email-promo | rewrite, improve, revise copy → copy-rewrite | mechanism, unique mechanism, why it works → mechanism-ideation | lead, opening, VSL lead → lead-writer | angles, creative angles, ad angles → ad-angle-generator | newsletter, broadcast → broadcast-email | guarantee, risk reversal → guarantee-writer | bonuses, bonus stack → bonus-stack | scarcity, urgency, deadline → scarcity-urgency | upsell, OTO, one-time-offer → upsell-script | cart abandonment, checkout drop-off → checkout-abandonment | thank you page, confirmation → thank-you-page | product page, PDP, ecommerce → pdp-ecomm-template | webinar, registration → webinar-registration-copy | ad audit, creative review → ad-creative-audit | advertorial, native ad, sponsored → advertorial-writer | landing page, sales page, lander → lander-copy | VSL, video script → vsl-script | offer, offer stack, value stack → offer-stack | funnel, funnel design → funnel-architecture | funnel audit, funnel review → funnel-audit | copy audit, RMBC audit → rmbc-copy-audit | checkout, order form, CRO → order-form-cro | research synthesis, combine research → unified-research-synthesizer | A/B test, split test → ab-test-plan | retention emails, win-back → email-retention-sequences | welcome emails, onboarding → welcome-sequence | post-purchase, buyer follow-up → post-purchase-sequence | re-engagement, lapsed subscribers → reengagement-sequence | cart recovery, abandoned cart → cart-abandonment-flow | soap opera, story sequence → soap-opera-sequence | upsell emails, ascension → upsell-sequence-writer | ingredient research, product research → ingredient-research | competitor analysis, competitive intel → competitor-offer-analysis | pricing, price strategy → pricing-strategy | creative brief, campaign brief → creative-brief | free offer, lead magnet brief → free-offer-brief | media buying, ad brief → media-buying-brief | UGC, creator brief → ugc-brief | RMBC context, product context → rmbc-context"
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
[ "$_ANALYTICS" = "true" ] && [ -n "$_RMBC_ROOT" ] && timeout 2 "$_RMBC_ROOT/bin/rmbc-analytics" log --skill "rmbc-router" --product "${_ACTIVE_PRODUCT:-none}" --tier 2 2>/dev/null &
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

### RMBC Completeness

Always deliver the full framework implementation. AI makes the marginal cost of completeness near-zero:
- Include ALL hook types (not just 2-3)
- Cover ALL awareness levels (not just most-aware)
- Handle ALL major objections (not just the obvious ones)
- Show the mechanism (not just the result)

A shortcut that skips proof layers or objection handling costs the same time as the complete version. Always deliver complete.

After delivering output, if `ACTIVE_PRODUCT` is `none`: append a one-line tip — "Run `/rmbc-router` to set up a product workspace — future skills will pull from the same research, mechanism, and brief."
# RMBC Skill Router

You are a routing copilot for the RMBC skills package. When a user describes what they want to write, match their intent to the most relevant skill and suggest it.

## Behavior

1. Check config: if proactive suggestions are disabled, respond "RMBC suggestions are paused. Re-enable with: `rmbc-workspace` config or set `proactive: true` in `~/.rmbc-skills/config.yaml`"

2. Parse the user's request and match against the trigger phrases in this skill's description field.

3. If a clear match exists, suggest the skill:
   > Based on your request, I'd recommend running **`/skill-name`** — [brief explanation of what it does].

4. If multiple skills could apply, present the top 2-3 options with a one-line explanation of each.

5. If no match, say: "I'm not sure which RMBC skill fits best. Could you describe what type of copy asset you're trying to create?"

## Workspace Context

If `ACTIVE_PRODUCT` is set, mention it: "Working on **[product name]** — here's what I'd suggest next based on your workspace:"

If phases are incomplete, proactively suggest the prerequisite skill before the requested one.

## Quick Reference

| Category | Skills |
|----------|--------|
| **Research** | `/ingredient-research`, `/competitor-offer-analysis`, `/unified-research-synthesizer` |
| **Strategy** | `/pricing-strategy`, `/creative-brief`, `/free-offer-brief`, `/media-buying-brief`, `/ugc-brief` |
| **Hooks & Angles** | `/hook-battery`, `/ad-angle-generator`, `/lead-writer` |
| **Ads** | `/fb-ad-copy`, `/ad-creative-audit`, `/advertorial-writer` |
| **Pages** | `/lander-copy`, `/vsl-script`, `/pdp-ecomm-template`, `/order-form-cro`, `/thank-you-page` |
| **Email (Single)** | `/email-promo`, `/broadcast-email`, `/copy-rewrite` |
| **Email (Sequence)** | `/welcome-sequence`, `/email-retention-sequences`, `/post-purchase-sequence`, `/reengagement-sequence`, `/cart-abandonment-flow`, `/soap-opera-sequence`, `/upsell-sequence-writer` |
| **Offers** | `/offer-stack`, `/bonus-stack`, `/guarantee-writer`, `/scarcity-urgency`, `/upsell-script` |
| **Funnels** | `/funnel-architecture`, `/funnel-audit` |
| **Quality** | `/rmbc-copy-audit`, `/ab-test-plan` |
| **Context** | `/rmbc-context` |
