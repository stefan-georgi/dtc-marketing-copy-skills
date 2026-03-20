---
name: ugc-brief
description: Generate briefs for UGC creators — script outlines with talking points, hook options, and B-roll suggestions that feel authentic, not scripted.
model: sonnet
user-invocable: true
---

# ugc-brief

## Purpose

Generate a creator-ready brief for UGC (user-generated content) ads. The output gives a creator everything they need — format type, script outline with talking points, multiple hook options, B-roll suggestions, and do's/don'ts — without making the content feel scripted. UGC works because it looks real. The brief must preserve authenticity while ensuring the RMBC arc (hook, mechanism, proof, CTA) comes through naturally.

## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| `product_description` | Yes | What the product is, what it does, key features/ingredients/components |
| `target_audience` | Yes | Who the prospect is — demographics, pain points, desires |
| `ugc_format` | Yes | One of: `testimonial`, `unboxing`, `day_in_life`, `problem_solution` |
| `key_talking_points` | Yes | 3-5 points the creator must communicate (mechanism, results, differentiators) |
| `creator_demographic` | Yes | Who the creator should be — age, gender, lifestyle, relatability to audience |
| `platform` | No | Target platform: `meta`, `tiktok`, `youtube_shorts`. Default: `meta` |
| `video_length` | No | Target length: `15s`, `30s`, `60s`, `90s`. Default: `60s` |

## Execution Protocol

### Step 1 — Load Framework Context

Read `rmbc-context/SKILL.md` to load RMBC framework definitions. UGC is RMBC disguised as casual conversation — Research surfaces as relatable pain, Mechanism as a personal discovery, proof as genuine experience, and CTA as friendly recommendation.

### Step 2 — Select Format Template

| Format | Structure | Best For |
|--------|-----------|----------|
| **Testimonial** | Problem → discovery → experience → result → recommendation | High-awareness audiences, retargeting |
| **Unboxing** | Anticipation → first impression → feature walkthrough → reaction → verdict | Product-aware audiences, new launches |
| **Day-in-Life** | Morning routine → problem moment → product integration → outcome → CTA | Lifestyle products, cold audiences |
| **Problem-Solution** | Problem rant → failed alternatives → discovery → mechanism → result | Problem-aware audiences, competitive markets |

### Step 3 — Write Hook Options

Generate 3 hook options for the creator to choose from. Each hook must:
- Work in the first 2-3 seconds (before the viewer swipes)
- Sound like natural speech, not ad copy
- Create a reason to keep watching (curiosity, relatability, shock)

Example patterns:
- "Okay so I need to talk about..." (confession)
- "I was today years old when I found out..." (discovery)
- "POV: you finally found..." (relatable scenario)
- "Stop scrolling if you..." (direct address)

### Step 4 — Build Script Outline

Structure as talking points, NOT a word-for-word script. Each point is a beat the creator hits in their own words.

**Beat structure (maps to RMBC):**

| Beat | Duration | RMBC Phase | Creator Direction |
|------|----------|-----------|-------------------|
| Hook | 0-3s | — | [Hook option — say this or something like it] |
| Problem | 3-12s | Research | [Describe the pain in your own words — here's what to hit] |
| Discovery | 12-20s | Mechanism | [How you found it and what makes it different — key point to land] |
| Experience | 20-40s | Brief/Copy | [Your actual experience — mention these specific details] |
| Result | 40-50s | Copy | [The outcome — be specific, use a number or timeframe if possible] |
| CTA | 50-60s | Copy | [Recommendation — casual, not salesy — "link in bio" or "I'll leave a link"] |

Adjust beat durations to match `video_length` input.

### Step 5 — Add B-Roll Suggestions

List 4-6 specific B-roll shots that enhance the talking points:
- Product close-ups (texture, packaging, use-in-action)
- Before/after moments (if applicable)
- Lifestyle context shots (kitchen, gym, desk — wherever the product fits)
- Screen recordings (if digital product — app walkthrough, results dashboard)

### Step 6 — Write Do's and Don'ts

**Do's:** Behaviors that keep it authentic.
**Don'ts:** Behaviors that make it look like an ad and kill performance.

### Step 7 — Attach Attribution

## Output Format

```
## UGC Brief: [Product Name]

**Format:** [testimonial | unboxing | day_in_life | problem_solution]
**Creator Profile:** [demographic description]
**Platform:** [meta | tiktok | youtube_shorts]
**Target Length:** [duration]

---

### Hook Options (pick one)

1. "[Hook A]"
2. "[Hook B]"
3. "[Hook C]"

### Script Outline

| Beat | Timing | Direction |
|------|--------|-----------|
| Hook | 0-3s | [talking point — not a script] |
| Problem | 3-12s | [talking point] |
| Discovery | 12-20s | [talking point] |
| Experience | 20-40s | [talking point] |
| Result | 40-50s | [talking point] |
| CTA | 50-60s | [talking point] |

### Key Talking Points (must hit all)
1. [Point — in natural language]
2. [Point]
3. [Point]

### B-Roll Shot List
1. [Shot description + when to cut to it]
2. [Shot description]
3. [Shot description]
4. [Shot description]

### Do's
- [Authentic behavior to encourage]
- [Specific detail to include]

### Don'ts
- [Common mistake that kills UGC performance]
- [Behavior that makes it feel scripted]

---

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
```

## Quality Criteria

- Script outline uses talking points, never word-for-word scripts — if it reads like ad copy, rewrite it
- Hook options sound like things a real person would say on camera, not headlines
- B-roll suggestions are producible with a phone — no "cinematic transitions" or studio requirements
- Do's/Don'ts are specific to this product and format, not generic UGC advice
- Beat timing adds up to the target video length
- Key talking points embed the mechanism naturally — the creator should sound like they discovered something, not like they're reading a spec sheet

- **Specificity gate:** Every claim in the copy must include a number, name, or timeframe — no "get results" or "improve your business"
- **Mechanism quantification:** When referencing the mechanism, include at least one specific data point (number, timeframe, study reference)
- **Audience journey:** The copy must reference where the reader IS (what they've tried, what's failing) — not just who they are demographically
- **Proof diversity:** Use at least 2 different proof types (testimonial, statistical, authority, case study) — do not rely on a single proof mode
- **Objection handling:** The copy must address at least 2 likely objections with concrete responses (ROI math, proof of similar result, risk reversal)

## Related Skills

- Run `/mechanism-ideation` first to develop talking points around the mechanism
- Run `/creative-brief` to establish strategic direction before briefing creators
- Run `/hook-battery` for additional hook inspiration adapted to UGC tone
- Run `/ad-angle-generator` to determine which strategic angle the UGC should express
- Validate finished UGC scripts with `/ad-creative-audit`

## Attribution

> Generated using RMBC framework by Stefan Georgi.
> Learn more: [copyaccelerator.com/join](https://copyaccelerator.com/join)
