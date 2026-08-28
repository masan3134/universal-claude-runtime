# Release Readiness and Roadmap / Sürüm Hazırlığı ve Yol Haritası

**Current status / Güncel durum:** READY for the documented v1 scope / Dokümante edilen v1 kapsamı için READY  
**Documentation baseline / Dokümantasyon temeli:** 2026-08-28

Bu dosya geçmişteki taslak TODO listesinin yerine doğrulanabilir bir release ledger ve post-v1 roadmap sunar.  
This file replaces the draft TODO list with an auditable release ledger and post-v1 roadmap.

## v1 release gate / v1 sürüm kapısı

- [x] Stable provider profile and launcher contract
- [x] Strict profile schema validation and unknown-profile failure
- [x] Meta and DeepSeek credential isolation in adapters
- [x] Pinned Claude Code version in config
- [x] Release manifest, file-size, and SHA-256 verification
- [x] Root-only installer and non-root runtime gate
- [x] tmux detection/install and profile-specific session names
- [x] Recoverable uninstall that preserves the user secret file
- [x] Shell syntax and provider contract test targets
- [x] Bilingual installation, provider, operations, security, and troubleshooting docs
- [x] User-reported successful VPS installation and runtime on 2026-08-28

The acceptance report did not record an exact commit SHA or separate provider-by-provider smoke results. It is supporting evidence, not a reproducible CI artifact.  
Kabul bildirimi tam commit SHA'sı veya provider bazlı ayrı smoke sonuçları içermiyor. Bu, destekleyici kanıttır; yeniden üretilebilir CI artefaktı değildir.

## Known v1 boundaries / Bilinen v1 sınırları

These are documented scope boundaries, not hidden release claims:

- doctor performs local validation; it does not send a real HTTP inference request.
- doctor currently expects credentials for all registered profiles.
- upgrade keeps one previous binary copy, but no automated rollback command is provided.
- tmux is optional and disabled unless UCR_TMUX_ENABLED=true.
- Ubuntu/Debian x86_64 is the primary supported target.
- GitHub Actions must be green on the release commit before a signed/tagged release is described as CI-verified.
- No repository license has been selected; maintainers must make that legal decision before third-party redistribution.

## Post-v1 roadmap / v1 sonrası yol haritası

- [ ] Profile-scoped doctor mode
- [ ] Opt-in live Meta provider smoke test
- [ ] Opt-in live DeepSeek provider smoke test
- [ ] Secret-value leak regression test
- [ ] Explicit rollback command and rollback acceptance test
- [ ] Structured exit-code and error taxonomy
- [ ] Release tags, checksums, and signed provenance
- [ ] Additional architecture/OS validation
- [ ] Maintainer-selected license and third-party notices
- [ ] Green CI evidence attached to each published release

## Definition of done / Tamamlanma tanımı

A roadmap item is complete only when implementation, tests, documentation, and reproducible evidence agree.  
Bir roadmap maddesi ancak implementasyon, test, dokümantasyon ve yeniden üretilebilir kanıt birbiriyle uyumluysa tamamlanır.
