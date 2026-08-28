# Universal Claude Runtime

Production-ready VPS runtime for running Claude Code CLI with multiple compatible AI providers.

Maintainer: GAIAI  
Contact: info@gaiai.ai  
Website: https://gaiai.ai

## Türkçe

Universal Claude Runtime, Claude Code CLI'yi tek bir güvenli ve modüler runtime üzerinden farklı Anthropic-compatible sağlayıcılara bağlar.

İlk provider'lar:

- Meta Muse Spark 1.2 Contributor
- DeepSeek Flash
- DeepSeek Pro

Temel kullanım:

    ./install.sh
    claude-muse
    claude-deepseek-flash
    claude-deepseek-pro
    claude-doctor

Bu proje VPS'e bağlanmaz veya uzak sunucu yönetmez. Kullanıcı kurulumu kendi VPS'inde çalıştırır.

Tasarım ilkeleri: provider-agnostic runtime, tek native Claude Code binary, secret'ların repository dışında tutulması, non-root çalışma, fail-close güvenlik, checksum doğrulaması, tmux ile kalıcı oturum ve bilingual dokümantasyon.

## English

Universal Claude Runtime connects Claude Code CLI to multiple Anthropic-compatible providers through one secure and modular runtime.

Initial providers:

- Meta Muse Spark 1.2 Contributor
- DeepSeek Flash
- DeepSeek Pro

Basic usage:

    ./install.sh
    claude-muse
    claude-deepseek-flash
    claude-deepseek-pro
    claude-doctor

This project does not connect to or manage a remote VPS. The user runs the installer on their own VPS.

Design principles: provider-agnostic runtime, one native Claude Code binary, secrets outside Git, non-root execution, fail-closed security, checksum verification, persistent tmux sessions, and bilingual documentation.

## Status

Foundation phase — NOT production ready yet.

Production readiness requires every item in TODO.md to be implemented, tested, and evidenced.

Documentation:

- Architecture: docs/ARCHITECTURE.md
- Security: SECURITY.md
- Environment: .env.example
- Micro TODO: TODO.md

For support or security reports: info@gaiai.ai  
Website: https://gaiai.ai
