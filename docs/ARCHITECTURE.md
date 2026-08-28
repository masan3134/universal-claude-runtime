# Architecture / Mimari

## Türkçe

Universal Claude Runtime, Claude Code CLI'nin kendisini fork'lamaz veya değiştirmez. Runtime, seçilen provider profiline göre kontrollü bir process environment oluşturur ve native Claude binary'yi çalıştırır.

User command
  -> command shim
  -> runtime core
  -> profile loader
  -> provider adapter
  -> environment builder
  -> Claude Code CLI
  -> optional tmux session

Katmanlar:

1. Command layer: claude-muse, claude-deepseek-flash, claude-deepseek-pro, claude-runtime ve claude-doctor komutlarını sağlar.
2. Runtime core: config, profile doğrulama, provider seçimi, process lifecycle ve exit code yönetir.
3. Provider adapters: endpoint, authentication, model, capability, health check ve pricing mantığını izole eder.
4. Claude integration: Claude CLI sürüm pinleme, indirme manifesti, checksum, atomic activation ve rollback.
5. Session layer: tmux kalıcı oturum sağlar; provider routing yapmaz.
6. Security layer: secret loader, non-root, environment allowlist, redaction ve fail-close kontrolleri.

Her provider şu alanları ilan eder: id, display_name, base_url, auth_env, model, aliases, health_check, capabilities ve pricing_reference.

## English

Universal Claude Runtime does not fork or modify Claude Code CLI. The runtime builds a controlled process environment for the selected provider profile and starts the native Claude binary.

Layers:

1. Command layer: stable user-facing commands.
2. Runtime core: configuration, profile validation, provider selection, lifecycle, and exit codes.
3. Provider adapters: isolated endpoint, authentication, model, capability, health, and pricing logic.
4. Claude integration: version pinning, manifest verification, checksum validation, atomic activation, and rollback.
5. Session layer: tmux persistence only; it does not perform provider routing.
6. Security layer: secret loading, non-root execution, environment allowlists, redaction, and fail-closed checks.

Each provider declares: id, display_name, base_url, auth_env, model, aliases, health_check, capabilities, and pricing_reference.

## Non-goals

- No remote VPS control
- No API key proxy service
- No modification of Claude Code internals
- No provider-specific logic in the core runtime
- No secrets committed to Git
- No silent provider fallback
- No production PASS based only on mocks
