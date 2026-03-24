# RMBC Skills — Upgrade Flow

This document is referenced by all skill preambles when they detect `UPGRADE_AVAILABLE`.

## Inline upgrade flow

### Step 1: Ask the user

Use AskUserQuestion:
- Question: "RMBC Skills **v{new}** is available (you're on v{old}). Upgrade now?"
- Options:
  1. "Yes, upgrade now"
  2. "Not now"
  3. "Never ask again"

**If "Yes, upgrade now":** Proceed to Step 2.

**If "Not now":** Write snooze state with escalating backoff (first=24h, second=48h, third+=7d), then continue with the current skill.
```bash
_SNOOZE_FILE=~/.rmbc-skills/update-snoozed
_REMOTE_VER="{new}"
_CUR_LEVEL=0
if [ -f "$_SNOOZE_FILE" ]; then
  _SNOOZED_VER=$(awk '{print $1}' "$_SNOOZE_FILE")
  if [ "$_SNOOZED_VER" = "$_REMOTE_VER" ]; then
    _CUR_LEVEL=$(awk '{print $2}' "$_SNOOZE_FILE")
    case "$_CUR_LEVEL" in *[!0-9]*) _CUR_LEVEL=0 ;; esac
  fi
fi
_NEW_LEVEL=$((_CUR_LEVEL + 1))
[ "$_NEW_LEVEL" -gt 3 ] && _NEW_LEVEL=3
echo "$_REMOTE_VER $_NEW_LEVEL $(date +%s)" > "$_SNOOZE_FILE"
```
Note: `{new}` is the remote version from `UPGRADE_AVAILABLE` output — substitute it.
Tell user the snooze duration: "Next reminder in 24h" (or 48h or 1 week).

**If "Never ask again":**
```bash
touch ~/.rmbc-skills/update-check-disabled
```
Tell user: "Update checks disabled. Remove `~/.rmbc-skills/update-check-disabled` to re-enable."
Continue with the current skill.

### Step 2: Detect install type

```bash
_RMBC_DIR=""
_LINK_TARGET=""
# Check symlink first (./setup creates a symlink)
if [ -L "$HOME/.claude/skills/dtc-copywriting-skills" ]; then
  _LINK_TARGET="$(readlink "$HOME/.claude/skills/dtc-copywriting-skills")"
  if [ -d "$_LINK_TARGET/.git" ]; then
    INSTALL_TYPE="symlink-git"
    _RMBC_DIR="$_LINK_TARGET"
  else
    INSTALL_TYPE="symlink-copy"
    _RMBC_DIR="$HOME/.claude/skills/dtc-copywriting-skills"
  fi
elif [ -d "$HOME/.claude/skills/dtc-copywriting-skills/.git" ]; then
  INSTALL_TYPE="global-git"
  _RMBC_DIR="$HOME/.claude/skills/dtc-copywriting-skills"
elif [ -d "$HOME/.claude/skills/dtc-copywriting-skills" ]; then
  INSTALL_TYPE="vendored"
  _RMBC_DIR="$HOME/.claude/skills/dtc-copywriting-skills"
elif [ -d ".claude/skills/dtc-copywriting-skills" ]; then
  INSTALL_TYPE="vendored-local"
  _RMBC_DIR=".claude/skills/dtc-copywriting-skills"
else
  echo "ERROR: RMBC skills directory not found"
fi
echo "Install type: $INSTALL_TYPE at $_RMBC_DIR"
```

### Step 3: Save old version

```bash
OLD_VERSION=$(cat "$_RMBC_DIR/VERSION" 2>/dev/null || echo "unknown")
```

### Step 4: Upgrade

**For git installs** (symlink-git, global-git):
```bash
cd "$_RMBC_DIR" && git fetch origin && git reset --hard origin/main
```

**For vendored installs** (vendored, vendored-local, symlink-copy):
```bash
TMP_DIR=$(mktemp -d)
git clone --depth 1 https://github.com/stefan-georgi/dtc-copywriting-skills.git "$TMP_DIR/rmbc"
mv "$_RMBC_DIR" "$_RMBC_DIR.bak"
mv "$TMP_DIR/rmbc" "$_RMBC_DIR"
rm -rf "$_RMBC_DIR.bak" "$TMP_DIR"
```

### Step 4b: Re-link new skills

Run `./setup` from the package directory to create symlinks for any new skills added in this version:
```bash
cd "$_RMBC_DIR" && ./setup
```
This is idempotent — existing symlinks are skipped, only new skills get linked.

### Step 5: Write marker + clear cache

```bash
mkdir -p ~/.rmbc-skills
echo "$OLD_VERSION" > ~/.rmbc-skills/just-upgraded-from
rm -f ~/.rmbc-skills/last-update-check
rm -f ~/.rmbc-skills/update-snoozed
```

### Step 6: Confirm

Tell user: "RMBC Skills updated to v{new} (from v{old}). Continuing with your skill."

### Step 7: Continue

Continue with whatever skill the user originally invoked.
