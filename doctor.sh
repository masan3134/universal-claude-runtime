#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$ROOT/runtime/provider-loader.sh"
source "$ROOT/runtime/secret-loader.sh"

ok(){ printf '[PASS] %s\n' "$1"; }
blocked(){ printf '[BLOCKED] %s\n' "$1" >&2; exit 78; }

command -v jq >/dev/null 2>&1 && ok 'jq / jq mevcut' || blocked 'jq is required / jq gerekli'
ucr_require_config
ok 'provider config / provider yapılandırması'
command -v tmux >/dev/null 2>&1 && ok 'tmux installed / tmux kurulu' || blocked 'tmux missing / tmux eksik'
[[ -x "${UCR_CLAUDE_BINARY:-$ROOT/claude/claude-code}" ]] && ok 'Claude Code binary installed / Claude Code binary kurulu' || blocked 'Claude Code binary missing / Claude Code binary eksik'

for profile in $(jq -r '.profiles | keys[]' "$UCR_PROVIDER_CONFIG"); do
  ucr_validate_profile "$profile"
  provider="$(ucr_profile_value "$profile" provider)"
  model="$(ucr_profile_value "$profile" model)"
  case "$provider" in
    deepseek) [[ -n "${DEEPSEEK_API_KEY:-${DEEPSEEK_NEW_API:-}}" ]] || blocked "DeepSeek credential missing / DeepSeek anahtarı eksik" ;;
    meta-muse) [[ -n "${META_MODEL_API_KEY:-${META_API_KEY:-}}" ]] || blocked "Meta credential missing / Meta anahtarı eksik" ;;
    *) blocked "unsupported provider: $provider" ;;
  esac
  ok "$profile -> $provider / $model"
done

if [[ "$(id -u)" -eq 0 ]]; then
  blocked 'runtime must not run as root / runtime root çalışmamalı'
fi

ok 'credential values were not printed / secret değerleri yazdırılmadı'
printf 'UCR_DOCTOR_PASS / UCR_DOCTOR_PASS\n'
