# RMBC Skills

Stefan Georgi's RMBC methodology as agent skills.

Works with Claude Code, Claude Desktop, OpenAI, Cursor, Windsurf, and any Agent Skills-compatible platform.

## About Stefan Georgi

Stefan Georgi is a world-class direct response copywriter with $700M+ in attributed client results. He created the RMBC Method — the most widely taught framework for writing high-converting copy — and runs Copy Accelerator Pro, an elite mastermind for top-performing copywriters and media buyers.

## What Are RMBC Skills?

**RMBC** stands for **Research, Mechanism, Brief, Copy** — the four phases of Stefan's proven copywriting method. These skills encode that methodology as executable tools that any AI agent can run, bringing structured DR copywriting expertise into your AI workflows.

Instead of generic "write me an ad" prompts, RMBC Skills give agents the same frameworks Stefan uses: deep ingredient research, mechanism-driven differentiation, hook generation from proven archetypes, and copy auditing against direct response fundamentals.

## How Skills Work Together

**rmbc-context** is the foundational hub — it loads automatically and provides every other skill with Stefan's core methodology, terminology, and quality standards.

Every copy-generation skill enforces 5 quality gates that were validated through blind A/B testing (+17pp improvement over ungated output, 83% blind preference rate):

- **Specificity gate** — every claim must include a number, name, or timeframe
- **Mechanism quantification** — mechanism references must cite a specific data point
- **Audience journey** — copy must reference where the reader IS (what they've tried, what's failed)
- **Proof diversity** — 2+ proof types required (testimonial, statistical, authority, case study)
- **Objection handling** — 2+ objections addressed with concrete responses

## Available Skills (41)

### Benchmark-Tested (3 skills)

Directly tested across multiple niches with automated grading and blind human evaluation. These are the flagship skills with the strongest quality evidence.

| Skill | What It Does | Tested Niches | Improved vs Original |
|-------|-------------|---------------|---------------------|
| `hook-battery` | Generates 10 hooks across 5 psychological trigger types | Berberine supplement, Creatine fitness | 100% vs 100% (both strong) |
| `email-promo` | Promotional email with A/B subject lines, objection handling, ROI math | Copywriting course, Budgeting app | 88% vs 50% (+38pp) |
| `copy-rewrite` | Audits then rewrites underperforming copy section-by-section | Berberine email, SaaS landing page | 88% vs 75% (+13pp) |

### Copy Generation — Full Quality Gates (24 skills)

All 5 quality gates applied. Same gate architecture as the benchmark-tested skills above, but not yet individually graded. These produce customer-facing copy.

| Skill | What It Does |
|-------|-------------|
| `advertorial-writer` | Long-form advertorial copy (editorial-style ads) |
| `bonus-stack` | Bonus stack copy that increases perceived offer value |
| `broadcast-email` | Non-promotional broadcast emails (newsletters, updates) |
| `cart-abandonment-flow` | Multi-email cart recovery sequences |
| `checkout-abandonment` | Checkout abandonment recovery copy |
| `email-retention-sequences` | Post-purchase retention email sequences |
| `fb-ad-copy` | Facebook/Meta ad copy (primary text, headlines, descriptions) |
| `guarantee-writer` | Risk-reversal guarantee copy |
| `lander-copy` | Full landing page copy (hero, body, CTA, FAQ) |
| `lead-writer` | Lead magnet and lead generation copy |
| `offer-stack` | Offer stack construction with price anchoring |
| `order-form-cro` | Order form copy optimized for conversion |
| `pdp-ecomm-template` | Product detail page copy for e-commerce |
| `post-purchase-sequence` | Post-purchase onboarding and upsell sequences |
| `reengagement-sequence` | Win-back sequences for lapsed customers |
| `scarcity-urgency` | Scarcity and urgency copy elements |
| `soap-opera-sequence` | Story-driven email sequences (Andre Chaperon style) |
| `thank-you-page` | Thank-you / confirmation page copy with next-step CTA |
| `ugc-brief` | UGC creator briefs for testimonial-style content |
| `upsell-script` | Post-purchase upsell page scripts |
| `upsell-sequence-writer` | Multi-touch upsell email sequences |
| `vsl-script` | Video sales letter scripts (long-form) |
| `webinar-registration-copy` | Webinar registration page copy |
| `welcome-sequence` | Welcome/onboarding email sequences |

### Strategy & Planning — Partial Gates (11 skills)

4 of 5 quality gates (no objection handling — these produce strategic output, not customer-facing copy). Specificity, mechanism quantification, audience journey, and proof diversity still enforced.

| Skill | What It Does |
|-------|-------------|
| `ab-test-plan` | A/B test planning with hypothesis, variants, and success criteria |
| `ad-angle-generator` | Generates advertising angles and creative directions |
| `ad-creative-audit` | Audits ad creative against DR performance criteria |
| `competitor-offer-analysis` | Analyzes competitor offers, positioning, and pricing |
| `creative-brief` | Creates creative briefs for copy and design teams |
| `free-offer-brief` | Structures free offer / lead magnet strategy |
| `funnel-architecture` | Maps full funnel architecture (traffic → conversion → retention) |
| `funnel-audit` | Audits existing funnels for conversion leaks |
| `mechanism-ideation` | Creates unique mechanism angles for product differentiation |
| `media-buying-brief` | Briefs for media buyers (targeting, budget, creative specs) |
| `pricing-strategy` | Pricing strategy with anchoring, tiers, and positioning |

### Foundation & Research — No Gates (4 skills)

These don't generate copy. They provide framework context or raw research that feeds into copy-generation skills.

| Skill | What It Does | Why No Gates |
|-------|-------------|-------------|
| `rmbc-context` | Loads RMBC methodology and terminology into agent context | Framework definition — consumed by other skills |
| `rmbc-copy-audit` | Scores and critiques copy against DR fundamentals | Auditing rubric — evaluates, doesn't generate |
| `ingredient-research` | Deep-dives ingredients with clinical studies and claims | Raw research output — no persuasion layer |
| `unified-research-synthesizer` | Synthesizes multi-source research into actionable briefs | Research synthesis — feeds into copy skills |

## Install — 30 seconds

**Requirements:** [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Git](https://git-scm.com/)

### Step 1: Install on your machine

Open Claude Code and paste this. Claude does the rest.

> Install RMBC Skills: run **`git clone https://github.com/stefan-georgi/dtc-copywriting-skills.git ~/.claude/skills/dtc-copywriting-skills && cd ~/.claude/skills/dtc-copywriting-skills && ./setup`** then add an "RMBC Skills" section to my CLAUDE.md that lists the available skills: /write-copy, /ab-test-plan, /ad-angle-generator, /ad-creative-audit, /advertorial-writer, /bonus-stack, /broadcast-email, /cart-abandonment-flow, /checkout-abandonment, /competitor-offer-analysis, /copy-rewrite, /creative-brief, /email-promo, /email-retention-sequences, /fb-ad-copy, /free-offer-brief, /funnel-architecture, /funnel-audit, /guarantee-writer, /hook-battery, /ingredient-research, /lander-copy, /lead-writer, /mechanism-ideation, /media-buying-brief, /offer-stack, /order-form-cro, /pdp-ecomm-template, /post-purchase-sequence, /pricing-strategy, /reengagement-sequence, /rmbc-context, /rmbc-copy-audit, /scarcity-urgency, /soap-opera-sequence, /thank-you-page, /ugc-brief, /unified-research-synthesizer, /upsell-script, /upsell-sequence-writer, /vsl-script, /webinar-registration-copy, /welcome-sequence, and says to use /write-copy to discover all skills and set up a product workspace. After updating CLAUDE.md, use the AskUserQuestion tool to ask if they also want to add RMBC Skills to the current project's CLAUDE.md so teammates get it. Finally, run /write-copy to help the user set up their first product workspace.

This symlinks the package into `~/.claude/skills/` so `git pull` auto-updates all skills. Nothing touches your PATH or runs in the background.

### Step 2: Add to your repo so teammates get it (optional)

> Add RMBC Skills to this project: run **`cp -Rf ~/.claude/skills/dtc-copywriting-skills .claude/skills/dtc-copywriting-skills && rm -rf .claude/skills/dtc-copywriting-skills/.git && cd .claude/skills/dtc-copywriting-skills && ./setup`** then add an "RMBC Skills" section to this project's CLAUDE.md that lists the available skills: /write-copy, /ab-test-plan, /ad-angle-generator, /ad-creative-audit, /advertorial-writer, /bonus-stack, /broadcast-email, /cart-abandonment-flow, /checkout-abandonment, /competitor-offer-analysis, /copy-rewrite, /creative-brief, /email-promo, /email-retention-sequences, /fb-ad-copy, /free-offer-brief, /funnel-architecture, /funnel-audit, /guarantee-writer, /hook-battery, /ingredient-research, /lander-copy, /lead-writer, /mechanism-ideation, /media-buying-brief, /offer-stack, /order-form-cro, /pdp-ecomm-template, /post-purchase-sequence, /pricing-strategy, /reengagement-sequence, /rmbc-context, /rmbc-copy-audit, /scarcity-urgency, /soap-opera-sequence, /thank-you-page, /ugc-brief, /unified-research-synthesizer, /upsell-script, /upsell-sequence-writer, /vsl-script, /webinar-registration-copy, /welcome-sequence, and says to use /write-copy to discover all skills and set up a product workspace. Also tells Claude that if RMBC skills aren't working, run `cd .claude/skills/dtc-copywriting-skills && ./setup` to re-link skills.

Real files get committed to your repo (not a submodule), so `git clone` just works.

### Other platforms

**Cursor, Windsurf, or other Agent Skills hosts:** Clone into the platform's skills directory and run `./setup`.

**Claude Desktop (Chat Mode):** Create a Project and paste skill contents into Project Instructions. Always include `rmbc-context` — it's the foundation every other skill references.

**Fork & Customize:** Fork the repo on GitHub, then modify skills for your niche or domain.

## Usage Examples

RMBC Skills respond to natural language. Just describe what you need:

- **"Audit this ad copy"** → runs `rmbc-copy-audit` — scores your copy against DR fundamentals and returns specific fixes
- **"Generate hooks for my supplement"** → runs `hook-battery` — produces hooks from proven archetype patterns
- **"Research CoQ10 ingredients"** → runs `ingredient-research` — pulls clinical studies, dosage data, and compliant claims
- **"Create a unique mechanism for this fat burner"** → runs `mechanism-ideation` — generates differentiated mechanism angles
- **"Write PDP copy for this product"** → runs `pdp-ecomm-template` — produces full product detail page copy

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on submitting new skills, reporting issues, and proposing changes.

## Copy Accelerator Pro

Want RMBC applied to your copy by Stefan directly? Learn more at [copyaccelerator.com/join](https://copyaccelerator.com/join).

## License

[MIT](LICENSE)
