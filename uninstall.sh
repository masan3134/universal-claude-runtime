#!/usr/bin/env bash
set -euo pipefail
PREFIX="${UCR_PREFIX:-/opt/universal-claude-runtime}"
BIN_DIR="${UCR_BIN_DIR:-/usr/local/bin}"
[[ "$(id -u)" -eq 0 ]] || { printf '[UCR][BLOCKED] root required / root gerekli\n' >&2; exit 78; }
for name in claude-runtime claude-muse claude-deepseek-flash claude-deepseek-pro claude-doctor; do rm -f "$BIN_DIR/$name"; done
if [[ -d "$PREFIX" ]]; then mv "$PREFIX" "${PREFIX}.removed.$(date -u +%Y%m%d%H%M%S)"; fi
printf '[UCR][PASS] runtime removed; secrets were preserved / runtime kaldırıldı; secret dosyaları korundu\n'
