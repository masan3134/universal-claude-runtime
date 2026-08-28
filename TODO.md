# Production Micro TODO / Production Mikro TODO

Status / Durum: NOT READY

A task is complete only with implementation, scoped tests, and evidence.
Bir görev ancak implementasyon, kapsamlı test ve kanıt ile tamamlanır.

## Scope / Kapsam

- [x] Product scope and non-goals finalized / Ürün kapsamı kesinleştirildi
- [ ] OS compatibility matrix finalized / İşletim sistemi matrisi kesinleştirildi
- [x] Runtime naming and command contract finalized / Komut sözleşmesi kesinleştirildi
- [ ] License and third-party notices added / Lisans bildirimi eklendi

## Runtime Core / Çekirdek

- [x] Profile schema and strict validation
- [x] Provider registry and deterministic selection
- [ ] Standard exit codes and error taxonomy
- [ ] Runtime lifecycle and process cleanup
- [ ] No silent provider fallback

## Providers / Sağlayıcılar

- [x] DeepSeek adapter
- [x] Meta Muse adapter
- [x] Provider authentication isolation
- [x] Model alias coherence
- [ ] Real provider health checks
- [ ] Pricing metadata separated from runtime

## Claude CLI

- [ ] Version pinning
- [ ] Manifest and SHA-256 verification
- [ ] Atomic activation
- [ ] Upgrade and rollback
- [ ] Native CLI compatibility check

## tmux / Session

- [ ] tmux detection and installation
- [ ] Named session contract
- [ ] Attach/create behavior
- [ ] Session isolation
- [ ] Clean shutdown

## Security / Güvenlik

- [x] Secret loader and mode enforcement
- [x] Non-root execution
- [x] Environment allowlist
- [ ] Log redaction
- [ ] Provider cross-contamination negative tests
- [ ] Threat model

## Installer UX

- [x] Preflight checks
- [x] Interactive and non-interactive modes
- [x] Idempotent install
- [ ] Uninstall
- [x] Doctor command
- [x] Clear bilingual output

## Tests / Testler

- [x] Shell lint
- [x] Unit tests
- [x] Contract tests
- [ ] Installer tests
- [ ] Security tests
- [x] Mock provider tests
- [ ] Opt-in live DeepSeek smoke
- [ ] Opt-in live Meta smoke
- [ ] No-secret-output test

## Documentation / Dokümantasyon

- [x] Installation guide TR/EN
- [x] Provider guide TR/EN
- [ ] Troubleshooting TR/EN
- [ ] Operations runbook TR/EN
- [ ] Release and rollback guide TR/EN

## READY Gate

- [ ] All required TODOs completed
- [ ] No critical unknowns
- [ ] No secret exposure
- [ ] No mocked-only PASS
- [ ] Clean install evidence
- [ ] Upgrade and rollback evidence
- [ ] Bilingual docs match implementation
- [ ] Final production review completed

READY means every gate passes.
