#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[[ "$(id -u)" -eq 0 ]] || { printf '[UCR][BLOCKED] root required / root gerekli\n' >&2; exit 78; }
source "$ROOT/runtime/claude-installer.sh"
source "$ROOT/runtime/tmux-installer.sh"
ucr_install_tmux
ucr_install_claude
printf '[UCR][PASS] upgrade completed / upgrade tamamlandı\n'
