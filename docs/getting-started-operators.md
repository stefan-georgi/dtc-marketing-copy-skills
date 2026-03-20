# Getting Started with RMBC Skills (No Coding Required)

This guide is for DTC operators who want to use RMBC skills through a chat interface — no coding, no command line. Just download, set up, and start getting better copy feedback in minutes.

---

## Option A: Claude Desktop (Recommended)

Claude Desktop gives you the richest experience with RMBC skills. Here's how to set it up.

### Step 1: Download the Skills

1. Go to the RMBC Skills repo on GitHub
2. Click the green **Code** button near the top right
3. Click **Download ZIP**
4. Open your Downloads folder and unzip the file (double-click it on Mac, right-click → "Extract All" on Windows)

### Step 2: Find Your Skills Folder

You need to copy the skills into a specific folder on your computer.

**On Mac:**
1. Open Finder
2. Press **Cmd + Shift + G** (this opens "Go to Folder")
3. Type `~/.claude/skills/` and press Enter
4. If the folder doesn't exist, create it: go to `~/.claude/` first, then create a new folder called `skills`

**On Windows:**
1. Open File Explorer
2. In the address bar, type `%USERPROFILE%\.claude\skills\` and press Enter
3. If the folder doesn't exist, create it inside the `.claude` folder

### Step 3: Copy the Skills

1. Open the unzipped download folder
2. Navigate into `rmbc-skills/skills/`
3. You'll see folders like `rmbc-copy-audit`, `hook-battery`, `ingredient-research`, etc.
4. Select **all** of these folders
5. Copy them into the `~/.claude/skills/` folder from Step 2

### Step 4: Start Using Skills

1. Open Claude Desktop
2. The skills are now available automatically
3. Try typing: **"Audit this ad copy:"** and paste in any ad you want feedback on

---

## Option B: ChatGPT / Custom GPTs

You can use RMBC skills inside ChatGPT by building a Custom GPT with the skill instructions baked in.

### Step 1: Download the Repo

1. Go to the RMBC Skills repo on GitHub
2. Click the green **Code** button → **Download ZIP**
3. Unzip the download

### Step 2: Get the Skill Prompt

1. Open the unzipped folder and navigate to `rmbc-skills/skills/`
2. Pick a skill (start with `rmbc-copy-audit`)
3. Open the `SKILL.md` file inside that folder — this contains the full skill instructions
4. Select all the text and copy it

### Step 3: Create Your Custom GPT

1. Go to [chat.openai.com](https://chat.openai.com)
2. Click your name (bottom left) → **My GPTs** → **Create a GPT**
3. Switch to the **Configure** tab
4. Paste the skill instructions into the **Instructions** box
5. Give it a name like "RMBC Copy Auditor"
6. Click **Save** → choose "Only me" or share with your team

### Step 4: Use It

1. Open your new Custom GPT
2. Paste in any ad copy and ask for an audit
3. The GPT will use the RMBC framework to break down your copy

---

## Option C: Cursor or Windsurf

If you use Cursor or Windsurf as your writing environment:

1. Download and unzip the repo (same as Step 1 above)
2. Put the `rmbc-skills` folder inside your project directory
3. The skills in `skills/` are automatically detected by these editors
4. Type naturally: "audit my ad copy" or "generate hooks for this product"

---

## Which Skill Should I Start With?

| Skill | What It Does | When to Use It |
|-------|-------------|----------------|
| **rmbc-copy-audit** | Scores your ad copy against the RMBC framework | Paste your best-performing ad and see where it's strong and where it breaks |
| **hook-battery** | Generates dozens of hook angles for your product | Before your next creative session — get 20+ hooks in seconds |
| **ingredient-research** | Deep research on supplement/product ingredients | Before writing any supplement or health product copy |
| **mechanism-ideation** | Finds the "mechanism" that makes your product believable | When your copy explains *what* but not *why it works* |
| **pdp-ecomm-template** | Builds product detail page copy | When launching a new product or refreshing a PDP |
| **webinar-registration-copy** | Writes webinar/VSL registration pages | Before your next webinar or virtual event |
| **unified-research-synthesizer** | Combines research from multiple sources | When you have a pile of research and need it organized |

---

## Tips for Better Results

- **Be specific.** The more product details you give (ingredients, price point, target customer, past winners), the better the output.
- **Start with your best ad.** Run `rmbc-copy-audit` on copy that's already working — the audit will show you exactly why it works and where to push further.
- **Stack skills together.** Run `ingredient-research` first, then feed that output into `hook-battery` for research-backed hooks.
- **Iterate.** Treat skill output as a strong first draft, not final copy. Your market knowledge + RMBC structure = winning creative.

---

## Getting Help

- **Found a bug or have a suggestion?** Open an issue on the GitHub repo
- **Want to go deeper with RMBC?** Join Copy Accelerator Pro at [copyaccelerator.com/join](https://copyaccelerator.com/join)
