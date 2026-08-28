#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
jq empty "$ROOT/config/providers.json"
bash -n "$ROOT/bin/claude-runtime" "$ROOT/runtime"/*.sh "$ROOT/providers"/*/*.sh
DEEPSEEK_API_KEY=test bash -c 'source "$1/providers/deepseek/adapter.sh"; ucr_deepseek_prepare_env deepseek-v4-flash; test "$ANTHROPIC_BASE_URL" = https://api.deepseek.com/anthropic; test "$ANTHROPIC_API_KEY" = test' _ "$ROOT"
META_MODEL_API_KEY=test bash -c 'source "$1/providers/meta-muse/adapter.sh"; ucr_meta_muse_prepare_env muse-spark-1.2-contributor; test "$ANTHROPIC_BASE_URL" = https://api.meta.ai; test "$ANTHROPIC_AUTH_TOKEN" = test; test -z "${ANTHROPIC_API_KEY:-}"' _ "$ROOT"
printf 'UCR_PROVIDER_CONTRACT_PASS\n'
