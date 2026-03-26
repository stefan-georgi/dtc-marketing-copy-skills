---
name: rmbc-upgrade
description: "Upgrade RMBC Skills to the latest version and show what's new."
user-invocable: true
allowed-tools: [Bash, Read, AskUserQuestion]
---

# RMBC Skills Upgrade

Two modes: **inline** (called by preambles when UPGRADE_AVAILABLE detected) and **standalone** (`/rmbc-upgrade`).

## Inline Upgrade Flow

Called by other skills when preamble output contains `UPGRADE_AVAILABLE <old> <new>`.

### Step 1: Check auto-upgrade config

```bash
source "$_RMBC_ROOT/lib/rmbc-common.sh"
_AUTO=$(rmbc_config_get auto_upgrade)
echo "AUTO_UPGRADE: ${_AUTO:-false}"
```

If `AUTO_UPGRADE` is `true`: skip to Step 2 immediately.

Otherwise, present AskUserQuestion:
- Question: "RMBC Skills v{new} is available (you have v{old}). What would you like to do?"
- Options:
  1. "Upgrade now"
  2. "Always auto-upgrade"
  3. "Remind me later"
  4. "Never ask again"

Handle responses:
- **Upgrade now**: proceed to Step 2
- **Always auto-upgrade**:
  ```bash
  source "$_RMBC_ROOT/lib/rmbc-common.sh"
  rmbc_config_set auto_upgrade true
  ```
  Then proceed to Step 2.
- **Remind me later** (snooze):
  ```bash
  _SNOOZE_FILE="$HOME/.rmbc-skills/update-snoozed"
  _NEW="{new}"
  if [ -f "$_SNOOZE_FILE" ]; then
    _LEVEL=$(awk '{print $2}' "$_SNOOZE_FILE" 2>/dev/null || echo "0")
    _LEVEL=$((_LEVEL + 1))
  else
    _LEVEL=1
  fi
  echo "$_NEW $_LEVEL $(date +%s)" > "$_SNOOZE_FILE"
  ```
  Tell user snoozed (level 1=24h, 2=48h, 3+=7d). Continue with original skill.
- **Never ask again**:
  ```bash
  touch "$HOME/.rmbc-skills/update-check-disabled"
  ```
  Tell user update checks disabled. Mention they can re-enable with `/rmbc-upgrade`. Continue with original skill.

### Step 2: Run upgrade

```bash
"$_RMBC_ROOT/bin/rmbc-upgrade" 2>&1
```

Parse output lines:
- `INSTALL_TYPE=X` — note for user
- `UPGRADED <old> <new>` — confirm success
- `STASH_WARNING=true` — warn user about stashed local changes

### Step 3: Show what's new

Read `$_RMBC_ROOT/CHANGELOG.md`. Extract entries between the old and new version headers (`## X.Y.Z`). Present as 5-7 themed bullets summarizing the changes.

If CHANGELOG.md is missing or has no entries for the version range, say "Upgraded successfully" without changelog details.

### Step 4: Continue

Tell user "Now running RMBC Skills v{new}!" and continue with the original skill that triggered the upgrade.

---

## Standalone Mode

When user runs `/rmbc-upgrade` directly:

### Step 1: Locate package root

```bash
_RMBC_ROOT=""
[ -d "${CLAUDE_SKILL_DIR}/../../bin" ] && _RMBC_ROOT="$(cd "${CLAUDE_SKILL_DIR}/../.." && pwd)"
[ -z "$_RMBC_ROOT" ] && for _D in "$HOME/.claude/skills/dtc-copywriting-skills" ".claude/skills/dtc-copywriting-skills"; do [ -f "$_D/VERSION" ] && _RMBC_ROOT="$_D" && break; done
```

### Step 2: Force check

```bash
"$_RMBC_ROOT/bin/rmbc-update-check" --force 2>/dev/null || true
```

If output contains `UPGRADE_AVAILABLE`: follow the Inline Upgrade Flow above (Step 1 onward).

If output is empty or `UP_TO_DATE`: tell user "RMBC Skills v{version} is up to date."

If output contains `JUST_UPGRADED`: read CHANGELOG.md, show what's new since the old version.
