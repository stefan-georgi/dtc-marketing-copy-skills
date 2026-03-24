# RMBC Skills

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Skills: 41](https://img.shields.io/badge/Skills-41-brightgreen.svg)](#skills)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blueviolet.svg)](https://claude.ai/code)
[![Agent Skills](https://img.shields.io/badge/Agent%20Skills-Standard-orange.svg)](https://agentskills.io)

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

## Available Skills (42)

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

## Installation

### Recommended: Git Clone + Setup

Paste this into Claude Code and it will handle the rest:

```
Clone the RMBC skills repo and run setup:
git clone https://github.com/stefan-georgi/dtc-copywriting-skills.git
cd dtc-copywriting-skills && ./setup
Then add an "RMBC Skills" section to my CLAUDE.md with /rmbc-router as the entry point.
```

This symlinks the package into `~/.claude/skills/` so `git pull` auto-updates all skills.

### Claude Code Plugin

Install as a plugin directly from Settings:

1. Open Claude Code → Settings → Plugins
2. Click **Add marketplace**
3. Enter: `stefan-georgi/dtc-copywriting-skills`
4. Click **Sync**, then install the `rmbc-skills` plugin

All 42 skills become available as `/rmbc-skills:<skill-name>` (e.g., `/rmbc-skills:hook-battery`).

### npx Install (coming soon)

```bash
npx dtcmarketingskills
```

Copies skills to `~/.claude/skills/`. Available after npm publish.

### Manual Install

```bash
git clone https://github.com/stefan-georgi/dtc-copywriting-skills.git
cp -r dtc-copywriting-skills/skills/* ~/.claude/skills/
```

### Project-Scoped Install

```bash
git clone https://github.com/stefan-georgi/dtc-copywriting-skills.git .claude/skills/dtc-copywriting-skills
```

Skills are available only in this project. Useful for teams that want skills versioned with their repo.

### Fork & Customize

Fork the repo on GitHub, then modify skills for your niche or domain.

### Claude Desktop (Chat Mode)

No Code tab? Create a **Project** and paste skill contents into Project Instructions.
Always include `rmbc-context` — it's the foundation every other skill references.


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
