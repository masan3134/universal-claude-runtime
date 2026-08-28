#!/usr/bin/env bash
set -euo pipefail

ucr_install_tmux() {
  if command -v tmux >/dev/null 2>&1; then
    printf '[UCR][PASS] tmux already installed / tmux zaten kurulu\n'
    return 0
  fi
  if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq
    DEBIAN_FRONTEND=noninteractive apt-get install -y -qq tmux
  elif command -v dnf >/dev/null 2>&1; then
    dnf install -y tmux
  elif command -v yum >/dev/null 2>&1; then
    yum install -y tmux
  else
    printf '[UCR][BLOCKED] unsupported package manager / desteklenmeyen paket yöneticisi\n' >&2
    return 78
  fi
  command -v tmux >/dev/null 2>&1 || return 78
  printf '[UCR][PASS] tmux installed / tmux kuruldu\n'
}
