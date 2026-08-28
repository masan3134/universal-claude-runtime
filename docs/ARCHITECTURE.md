# Architecture / Mimari

## Overview / Genel bakış

Universal Claude Runtime does not fork or modify Claude Code. It selects a validated profile, builds provider-specific environment variables, and execs the pinned native Claude Code binary. tmux is an optional session wrapper, not a routing layer.

Universal Claude Runtime, Claude Code'u fork'lamaz veya değiştirmez. Doğrulanan profili seçer, provider'a özel environment değişkenlerini üretir ve sabitlenmiş native Claude Code binary'sini çalıştırır. tmux opsiyonel oturum katmanıdır; routing yapmaz.

    User command
      -> launcher shim
      -> profile loader
      -> provider adapter
      -> Claude Code process
      -> provider endpoint

When UCR_TMUX_ENABLED=true, the Claude Code process runs inside a profile-specific tmux session.

## Components / Bileşenler

| Component | Responsibility / Sorumluluk |
|---|---|
| bin/claude-runtime | CLI argument/profile selection and process launch |
| config/providers.json | Profile, model, endpoint, auth mapping, tmux session |
| runtime/provider-loader.sh | Schema and profile validation |
| providers/*/adapter.sh | Provider-specific env mapping and auth isolation |
| runtime/secret-loader.sh | User secret loading and mode 600 validation |
| runtime/claude-installer.sh | Pinned download, manifest/size/checksum verification |
| runtime/tmux-installer.sh | tmux detection and package-manager installation |
| doctor.sh | Local dependency/config/credential diagnostics |
| install/upgrade/uninstall | Host lifecycle operations |

## Runtime sequence / Çalışma sırası

1. The launcher sets or receives a profile.
2. The loader validates the providers.v1 document and requested profile.
3. The adapter requires the matching credential.
4. The adapter exports the configured base URL and model aliases, then unsets conflicting auth variables.
5. The runtime starts Claude Code directly or attaches/creates the configured tmux session.
6. An unknown profile, provider, missing credential, missing binary, or missing tmux dependency fails closed with status 78.

1. Launcher profili seçer.
2. Loader providers.v1 dokümanını ve profili doğrular.
3. Adapter ilgili credential'ı zorunlu tutar.
4. Adapter base URL ve model alias'larını export eder, çakışan auth değişkenlerini unset eder.
5. Runtime Claude Code'u doğrudan veya profile özel tmux oturumunda başlatır.
6. Bilinmeyen profil/provider, eksik credential/binary/tmux durumunda sistem 78 ile fail-close olur.

## Provider contract / Provider sözleşmesi

Each profile currently declares:

| Field | Meaning |
|---|---|
| provider | Adapter identifier |
| model | Provider model passed to Claude Code |
| baseUrl | Anthropic-compatible endpoint recorded in config |
| authEnv | Source credential name |
| claudeAuthEnv | Claude-facing auth variable |
| tmuxSession | Stable profile-specific session name |

Endpoint values are also enforced by the current adapters. Health, capabilities, and pricing are documentation/operational concerns and are not fields in the v1 profile schema.

## Boundaries / Sınırlar

- No remote VPS administration
- No API-key proxy or hosted control plane
- No modification of Claude Code internals
- No silent provider fallback
- No automated provider inference health check
- No claim that provider compatibility or pricing is permanent
- No secrets in repository configuration

## Extension rule / Genişletme kuralı

A new provider requires a profile, an isolated adapter, contract tests, bilingual provider/operations documentation, security review, and an opt-in live smoke plan. Core runtime code must not receive provider secrets or provider-specific branching beyond adapter selection.
