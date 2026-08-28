# Documentation / Dokümantasyon

This is the canonical documentation map for Universal Claude Runtime. Start with installation, then use the provider and operations guides for deployment.

Bu sayfa Universal Claude Runtime'ın ana dokümantasyon haritasıdır. Kurulumla başlayın; deployment için provider ve operasyon rehberlerini kullanın.

## Users / Kullanıcılar

| Document | Purpose / Amaç |
|---|---|
| [Installation](INSTALLATION.md) | Requirements, install, credentials, first verification / Gereksinimler, kurulum, credential, ilk doğrulama |
| [Providers](PROVIDERS.md) | Profiles, models, auth mapping, pricing policy / Profil, model, auth mapping, fiyat politikası |
| [Operations](OPERATIONS.md) | Daily use, upgrade, rollback, uninstall, incidents / Günlük kullanım, güncelleme, rollback, kaldırma, olaylar |
| [Troubleshooting](TROUBLESHOOTING.md) | Symptoms, diagnosis, safe fixes / Belirti, teşhis, güvenli çözüm |
| [FAQ](FAQ.md) | Common scope, health, tmux, and cost questions / Sık kapsam, health, tmux ve maliyet soruları |
| [Support](../SUPPORT.md) | Where and how to ask for help / Destek isteme yöntemi |

## Maintainers / Maintainer'lar

| Document | Purpose / Amaç |
|---|---|
| [Architecture](ARCHITECTURE.md) | Components, contracts, extension rules / Bileşen, sözleşme, genişletme |
| [Security policy](../SECURITY.md) | Reporting and implemented controls / Bildirim ve kontroller |
| [Threat model](THREAT_MODEL.md) | Assets, boundaries, threats, residual risk / Varlık, sınır, tehdit, kalan risk |
| [Release guide](RELEASE.md) | Evidence-based release process / Kanıta dayalı sürüm süreci |
| [Readiness and roadmap](../TODO.md) | v1 acceptance and post-v1 work / v1 kabulü ve sonrası |
| [Contributing](../CONTRIBUTING.md) | Change workflow and quality bar / Değişiklik akışı ve kalite standardı |
| [Changelog](../CHANGELOG.md) | User-visible changes / Kullanıcıya yansıyan değişiklikler |

## Documentation rules / Dokümantasyon kuralları

- Turkish and English must describe the same behavior.
- Commands must match the current implementation.
- Local diagnostics must not be called a provider health check.
- Mutable provider prices or availability must not be hard-coded as guarantees.
- Secrets, private IPs, SSH passwords, and live tokens must never appear in examples.
- Each release note must identify exact evidence and known limitations.

Türkçe ve İngilizce aynı davranışı anlatmalı; komutlar implementasyonla eşleşmeli; local diagnostic provider health check diye sunulmamalı; secret veya canlı altyapı bilgisi örneklere girmemelidir.

Contact: info@gaiai.ai — https://gaiai.ai
