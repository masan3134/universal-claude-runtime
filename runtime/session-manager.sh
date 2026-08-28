#!/usr/bin/env bash
set -euo pipefail

ucr_require_tmux() {
  command -v tmux >/dev/null 2>&1 || {
    printf '[UCR][BLOCKED] tmux is not installed. / tmux kurulu değil.\n' >&2
    return 78
  }
}

ucr_valid_session_name() {
  [[ "$1" =~ ^[A-Za-z0-9_.-]+$ ]] || {
    printf '[UCR][BLOCKED] invalid tmux session name\n' >&2
    return 78
  }
}
