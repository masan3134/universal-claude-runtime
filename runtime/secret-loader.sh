#!/usr/bin/env bash
set -euo pipefail

UCR_CONFIG_DIR="${UCR_CONFIG_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/universal-claude-runtime}"
UCR_SECRET_FILE="${UCR_SECRET_FILE:-$UCR_CONFIG_DIR/secrets.env}"

ucr_load_secrets() {
  if [[ -r "$UCR_SECRET_FILE" ]]; then
    set -a
    # shellcheck disable=SC1090
    source "$UCR_SECRET_FILE"
    set +a
  fi
}

ucr_validate_secret_file() {
  [[ -r "$UCR_SECRET_FILE" ]] || return 0
  local mode
  mode="$(stat -c '%a' "$UCR_SECRET_FILE" 2>/dev/null || stat -f '%Lp' "$UCR_SECRET_FILE")"
  [[ "$mode" == "600" ]] || { printf '[UCR][BLOCKED] secret file must use mode 600\n' >&2; return 78; }
}

ucr_load_secrets
ucr_validate_secret_file
