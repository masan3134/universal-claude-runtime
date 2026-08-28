#!/usr/bin/env bash
set -euo pipefail

ucr_install_claude() {
  local root="$1"
  local target_root="${2:-/opt/universal-claude-runtime/claude-code}"
  local version release_root platform binary_name tmp checksum size
  command -v curl >/dev/null 2>&1 || return 78
  command -v sha256sum >/dev/null 2>&1 || return 78
  version="$(jq -er '.version' "$root/config/claude-cli.json")"
  release_root="$(jq -er '.releaseRoot' "$root/config/claude-cli.json")"
  platform="$(jq -er '.platform' "$root/config/claude-cli.json")"
  binary_name="$(jq -er '.binaryName' "$root/config/claude-cli.json")"
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' RETURN
  curl -fsSL --max-time 60 "$release_root/$version/manifest.json" -o "$tmp/manifest.json" || return 78
  checksum="$(jq -er --arg p "$platform" '.platforms[$p].checksum' "$tmp/manifest.json")"
  size="$(jq -er --arg p "$platform" '.platforms[$p].size' "$tmp/manifest.json")"
  [[ "$(jq -er '.version' "$tmp/manifest.json")" == "$version" ]] || return 78
  curl -fsSL --max-time 180 "$release_root/$version/$platform/$binary_name" -o "$tmp/$binary_name" || return 78
  [[ "$(stat -c %s "$tmp/$binary_name")" == "$size" ]] || return 78
  echo "$checksum  $tmp/$binary_name" | sha256sum -c - >/dev/null || return 78
  install -d -m 0755 "$target_root/active" "$target_root/rollback"
  [[ ! -x "$target_root/active/claude" ]] || install -m 0755 "$target_root/active/claude" "$target_root/rollback/claude"
  install -m 0755 "$tmp/$binary_name" "$target_root/active/claude"
  "$target_root/active/claude" --version >/dev/null 2>&1 || return 78
  printf '[UCR][PASS] Claude Code %s installed / checksum verified\n' "$version"
}
