#!/usr/bin/env bash
# rmbc-common.sh — Shared function library for RMBC skills infrastructure.
# Source this file; do not execute directly.
# Usage: source "$_RMBC_ROOT/lib/rmbc-common.sh"

_RMBC_STATE_DIR="$HOME/.rmbc-skills"
_RMBC_CONFIG="$_RMBC_STATE_DIR/config.yaml"

rmbc_state_dir() {
  mkdir -p "$_RMBC_STATE_DIR"
  echo "$_RMBC_STATE_DIR"
}

rmbc_ensure_config() {
  mkdir -p "$_RMBC_STATE_DIR"
  if [ ! -f "$_RMBC_CONFIG" ]; then
    cat > "$_RMBC_CONFIG" << 'EOF'
analytics_enabled: true
auto_upgrade: false
active_product: ""
EOF
  fi
}

rmbc_config_get() {
  local key="$1"
  rmbc_ensure_config
  grep -E "^${key}:" "$_RMBC_CONFIG" 2>/dev/null | sed -E 's/^[^:]+:[[:space:]]*//' | sed 's/^"//;s/"$//'
}

rmbc_config_set() {
  local key="$1" value="$2"
  rmbc_ensure_config
  if grep -qE "^${key}:" "$_RMBC_CONFIG" 2>/dev/null; then
    local tmp
    tmp=$(mktemp)
    sed -E "s|^${key}:.*|${key}: ${value}|" "$_RMBC_CONFIG" > "$tmp"
    mv "$tmp" "$_RMBC_CONFIG"
  else
    echo "${key}: ${value}" >> "$_RMBC_CONFIG"
  fi
}

rmbc_config_list() {
  rmbc_ensure_config
  cat "$_RMBC_CONFIG"
}

rmbc_active_product() {
  rmbc_config_get active_product
}

rmbc_product_dir() {
  local slug="$1"
  echo "$_RMBC_STATE_DIR/products/$slug"
}

rmbc_slugify() {
  echo "$*" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//'
}
