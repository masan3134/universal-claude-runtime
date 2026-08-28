#!/usr/bin/env bash
set -euo pipefail
UCR_ROOT="${UCR_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
UCR_PROVIDER_CONFIG="${UCR_PROVIDER_CONFIG:-$UCR_ROOT/config/providers.json}"
ucr_fail(){ printf '[UCR][BLOCKED] %s\n' "$1" >&2; return 78; }
ucr_require_config(){ command -v jq >/dev/null 2>&1 || { ucr_fail 'jq is required'; return 78; }; [[ -r "$UCR_PROVIDER_CONFIG" ]] || { ucr_fail "provider config missing: $UCR_PROVIDER_CONFIG"; return 78; }; jq -e '.schemaVersion == "ucr.providers.v1" and (.profiles | type == "object")' "$UCR_PROVIDER_CONFIG" >/dev/null || { ucr_fail 'provider config schema invalid'; return 78; }; }
ucr_profile_value(){ jq -er --arg profile "$1" --arg field "$2" '.profiles[$profile][$field]' "$UCR_PROVIDER_CONFIG"; }
ucr_validate_profile(){ local profile="$1"; ucr_require_config; jq -e --arg profile "$profile" '.profiles[$profile] != null and (.profiles[$profile].provider|type=="string") and (.profiles[$profile].model|type=="string") and (.profiles[$profile].baseUrl|type=="string") and (.profiles[$profile].authEnv|type=="string") and (.profiles[$profile].claudeAuthEnv|type=="string")' "$UCR_PROVIDER_CONFIG" >/dev/null || { ucr_fail "invalid runtime profile: $profile"; return 78; }; }
ucr_default_profile(){ ucr_require_config; jq -er '.defaultProfile' "$UCR_PROVIDER_CONFIG"; }
