# Production Micro TODO / Production Mikro TODO

Status / Durum: NOT READY

A task is complete only with implementation, scoped tests, and evidence.
Bir görev ancak implementasyon, kapsamlı test ve kanıt ile tamamlanır.

## Scope / Kapsam

- [ ] Product scope and non-goals finalized / Ürün kapsamı kesinleştirildi
- [ ] OS compatibility matrix finalized / İşletim sistemi matrisi kesinleştirildi
- [ ] Runtime naming and command contract finalized / Komut sözleşmesi kesinleştirildi
- [ ] License and third-party notices added / Lisans bildirimi eklendi

## Runtime Core / Çekirdek

- [ ] Profile schema and strict validation
- [ ] Provider registry and deterministic selection
- [ ] Standard exit codes and error taxonomy
- [ ] Runtime lifecycle and process cleanup
- [ ] No silent provider fallback

## Providers / Sağlayıcılar

- [ ] DeepSeek adapter
- [ ] Meta Muse adapter
- [ ] Provider authentication isolation
- [ ] Model alias coherence
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

- [ ] Secret loader and mode enforcement
- [ ] Non-root execution
- [ ] Environment allowlist
- [ ] Log redaction
- [ ] Provider cross-contamination negative tests
- [ ] Threat model

## Installer UX

- [ ] Preflight checks
- [ ] Interactive and non-interactive modes
- [ ] Idempotent install
- [ ] Uninstall
- [ ] Doctor command
- [ ] Clear bilingual output

## Tests / Testler

- [ ] Shell lint
- [ ] Unit tests
- [ ] Contract tests
- [ ] Installer tests
- [ ] Security tests
- [ ] Mock provider tests
- [ ] Opt-in live DeepSeek smoke
- [ ] Opt-in live Meta smoke
- [ ] No-secret-output test

## Documentation / Dokümantasyon

- [ ] Installation guide TR/EN
- [ ] Provider guide TR/EN
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
