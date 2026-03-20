# Getting Started — Developers

This guide covers installing the RMBC Skills Package, running your first skill, and integrating with APIs.

## Prerequisites

- **Claude Code CLI** installed ([claude.ai/code](https://claude.ai/code)), or any platform that supports Agent Skills (SKILL.md format)
- A terminal with git access
- For API/JSON schema usage: an OpenAI or Anthropic API key

## Installation

### Claude Code CLI

```bash
npx skills add StefanGeorgi/copywritingskills-rmbc
```

This installs all RMBC skills into your local skills directory. You can then invoke them directly in Claude Code sessions.

### Manual Installation

```bash
git clone https://github.com/StefanGeorgi/copywritingskills-rmbc.git
```

Copy the `skills/` directory into your project's `.claude/skills/` or `~/.claude/skills/` directory.

## Your First Run: Audit Some Copy

The fastest way to see RMBC Skills in action is to audit existing copy. Paste any ad, email, or landing page text and run:

```
/rmbc-copy-audit
```

Or in a Claude Code session:

```
Audit this copy against the RMBC framework:

"Tired of slow mornings? Our new GreenBoost formula uses high-altitude
matcha extract to activate your body's natural energy pathways. Join
50,000+ customers who start every day sharp. Try it risk-free for 30 days."
```

The audit returns a scorecard (0-100) with per-dimension breakdowns for Research, Mechanism, Brief, and Copy, a letter grade, and prioritized recommendations.

## Skill Chain: The RMBC Workflow

The skills mirror the four RMBC phases. Run them in sequence for a full copywriting workflow:

```
1. /ingredient-research       → Deep product/market research
2. /unified-research-synthesizer → Synthesize research into usable insights
3. /mechanism-ideation         → Identify or create the core mechanism
4. /rmbc-context               → Build the brief with Big Idea + structure
5. /hook-battery               → Generate headline/hook variations
6. /webinar-registration-copy  → (Optional) Generate registration page copy
7. /pdp-ecomm-template         → (Optional) Generate product page copy
8. /rmbc-copy-audit            → Score and improve the output
```

You do not need to run every skill. Use what fits your project. The audit skill works standalone on any existing copy.

## JSON Schema Usage (OpenAI Assistants)

The `openai/` directory contains JSON schema versions of each skill, formatted for OpenAI's Assistants API and function calling.

To use with an OpenAI Assistant:

1. Open the JSON file for the skill you want (e.g., `openai/rmbc-copy-audit.json`)
2. In the OpenAI Playground or API, add it as a function/tool definition
3. The assistant will use the schema to structure its output

```python
import openai

client = openai.OpenAI()

# Load the schema
import json
with open("openai/rmbc-copy-audit.json") as f:
    audit_schema = json.load(f)

# Create assistant with RMBC tool
assistant = client.beta.assistants.create(
    name="RMBC Copy Auditor",
    instructions="You audit copy using the RMBC framework.",
    tools=[{"type": "function", "function": audit_schema}],
    model="gpt-4o"
)
```

## API Integration (Claude)

Use the SKILL.md files as system prompts or tool definitions with the Claude API:

```python
import anthropic

client = anthropic.Anthropic()

# Read the skill file
with open("skills/rmbc-copy-audit/SKILL.md") as f:
    skill_content = f.read()

message = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=4096,
    system=skill_content,
    messages=[{
        "role": "user",
        "content": "Audit this copy: [your copy here]"
    }]
)
```

The skill's YAML frontmatter and execution protocol give the model structured instructions. This works with any model that follows system prompt instructions.

## Customization

### Fork and Modify

1. Fork the repository on GitHub
2. Edit any `skills/<name>/SKILL.md` — the YAML frontmatter and markdown body are the entire skill definition
3. Test locally by copying into your skills directory
4. Submit a PR if your improvement is generally useful (see `CONTRIBUTING.md`)

### Key Files in Each Skill

```
skills/<name>/
├── SKILL.md              # The skill definition (required)
└── resources/            # Supporting files (rubrics, templates, examples)
    └── scoring-rubric.md # Referenced by the skill
```

### Creating a New Skill

Follow the SKILL.md format:

```yaml
---
name: your-skill-name
description: One-line description of what this skill does.
model: sonnet
user-invocable: true
---

# Skill Title

## Purpose
What this skill does and when to use it.

## Inputs
| Input | Required | Description |
|-------|----------|-------------|

## Execution Protocol
Step-by-step instructions the agent follows.

## Output Format
What the skill returns.
```

## Troubleshooting

**Skill not found after installation:**
Verify the skill files are in your active skills directory. Run `ls ~/.claude/skills/` or check your project's `.claude/skills/`.

**Low audit scores on short copy:**
The audit skill is calibrated for mid-to-long-form copy (emails, landing pages, VSLs). Very short ads (under 50 words) may score low on Research and Brief dimensions. Add context about the target audience and product to improve accuracy.

**Model not following the scoring rubric:**
Use Claude Sonnet 3.5+ or GPT-4o. Smaller models may not follow the multi-step execution protocol reliably.

**JSON schema errors with OpenAI:**
Ensure you are using the files from the `openai/` directory, not the raw SKILL.md files. The JSON schemas are pre-formatted for OpenAI's function calling spec.

**Skills conflict with existing tools:**
RMBC skills use unique names (`rmbc-copy-audit`, `mechanism-ideation`, etc.) and should not conflict. If they do, check for duplicate skill names in your skills directory.

## Resources

- [What Is RMBC?](what-is-rmbc.md) — Framework overview for non-technical readers
- [CONTRIBUTING.md](../CONTRIBUTING.md) — How to contribute improvements
- [Copy Accelerator](https://copyaccelerator.com/join) — Full RMBC training and community
