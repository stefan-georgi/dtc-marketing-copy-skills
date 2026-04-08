#!/usr/bin/env bash
set -euo pipefail

ZERO_SHA="0000000000000000000000000000000000000000"

die() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

usage() {
  cat >&2 <<'EOF'
Usage:
  tools/public_repo_guard.sh check-staged
  tools/public_repo_guard.sh check-push <local-ref> <local-sha> <remote-ref> [remote-sha]
  tools/public_repo_guard.sh preflight
  tools/public_repo_guard.sh restore-remote <name> <url>
  tools/public_repo_guard.sh verify-integrity <before-ref> <after-ref>
EOF
  exit 1
}

require_git_repo() {
  git rev-parse --show-toplevel >/dev/null 2>&1 || die "run this inside the repo"
}

list_bead_paths_in_tree() {
  local ref="$1"
  git ls-tree -r --name-only "$ref" | rg '^\.beads/' || true
}

check_staged() {
  require_git_repo

  local staged
  staged="$(git diff --cached --name-only --diff-filter=ACMR | rg '^\.beads/' || true)"
  if [ -n "$staged" ]; then
    cat >&2 <<EOF
Blocked commit: staged .beads paths detected.

$staged

These files are local issue-tracker state and must not be committed.
Unstage them before committing:
  git restore --staged .beads
EOF
    exit 1
  fi
}

check_push() {
  require_git_repo

  local local_ref="${1:-}"
  local local_sha="${2:-}"
  local remote_ref="${3:-}"

  [ -n "$local_sha" ] || die "missing local SHA for check-push"
  [ "$local_sha" = "$ZERO_SHA" ] && return 0

  local bead_paths
  bead_paths="$(list_bead_paths_in_tree "$local_sha")"
  if [ -n "$bead_paths" ]; then
    cat >&2 <<EOF
Blocked push: $local_ref -> $remote_ref contains .beads paths in $local_sha.

$bead_paths

Clean the branch before pushing or use the dedicated cleanup flow from a temp clone.
EOF
    exit 1
  fi
}

preflight() {
  require_git_repo
  command -v git-filter-repo >/dev/null 2>&1 || die "git-filter-repo is required for the public branch cleanup flow"
}

restore_remote() {
  require_git_repo

  local remote_name="${1:-}"
  local remote_url="${2:-}"

  [ -n "$remote_name" ] || usage
  [ -n "$remote_url" ] || usage

  if git remote get-url "$remote_name" >/dev/null 2>&1; then
    local existing_url
    existing_url="$(git remote get-url "$remote_name")"
    if [ "$existing_url" != "$remote_url" ]; then
      die "remote $remote_name already exists with URL $existing_url"
    fi
    return 0
  fi

  git remote add "$remote_name" "$remote_url"
}

verify_integrity() {
  require_git_repo

  local before_ref="${1:-}"
  local after_ref="${2:-}"

  [ -n "$before_ref" ] || usage
  [ -n "$after_ref" ] || usage

  git rev-parse --verify "${before_ref}^{commit}" >/dev/null 2>&1 || die "unknown ref: $before_ref"
  git rev-parse --verify "${after_ref}^{commit}" >/dev/null 2>&1 || die "unknown ref: $after_ref"

  local bead_paths
  bead_paths="$(list_bead_paths_in_tree "$after_ref")"
  if [ -n "$bead_paths" ]; then
    cat >&2 <<EOF
Integrity check failed: $after_ref still contains .beads paths.

$bead_paths
EOF
    exit 1
  fi

  local anchor_path
  for anchor_path in README.md setup package.json VERSION bin/install.mjs lib/rmbc-common.sh; do
    git cat-file -e "${after_ref}:${anchor_path}" 2>/dev/null || die "missing anchor file in $after_ref: $anchor_path"
  done

  local before_count
  local after_count
  before_count="$(git ls-tree -r --name-only "$before_ref" -- skills | rg '^skills/[^/]+/SKILL\.md$' | wc -l | tr -d ' ')"
  after_count="$(git ls-tree -r --name-only "$after_ref" -- skills | rg '^skills/[^/]+/SKILL\.md$' | wc -l | tr -d ' ')"

  if [ "$before_count" != "$after_count" ]; then
    die "skill count changed unexpectedly: before=$before_count after=$after_count"
  fi

  local changed_paths
  local unexpected=""
  changed_paths="$(git diff --name-only "$before_ref" "$after_ref" | rg -v '^\.beads/' || true)"
  while IFS= read -r path; do
    [ -n "$path" ] || continue
    case "$path" in
      skills/*/SKILL.md|setup)
        ;;
      *)
        unexpected="${unexpected}${path}"$'\n'
        ;;
    esac
  done <<< "$changed_paths"

  if [ -n "$unexpected" ]; then
    cat >&2 <<EOF
Integrity check failed: unexpected non-.beads changes detected between $before_ref and $after_ref.

$unexpected
Only CAPRO/PROMO changes in skills/*/SKILL.md and setup are allowed.
EOF
    exit 1
  fi
}

main() {
  local command="${1:-}"
  shift || true

  case "$command" in
    check-staged)
      check_staged "$@"
      ;;
    check-push)
      check_push "$@"
      ;;
    preflight)
      preflight "$@"
      ;;
    restore-remote)
      restore_remote "$@"
      ;;
    verify-integrity)
      verify_integrity "$@"
      ;;
    *)
      usage
      ;;
  esac
}

main "$@"
