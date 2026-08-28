# Universal Claude Runtime

Run Claude Code CLI on your own VPS with selectable Anthropic-compatible provider profiles.

**Status:** Production-ready for the documented v1 scope  
**Maintainer:** GAIAI  
**Contact:** info@gaiai.ai  
**Website:** https://gaiai.ai

> This is an independent integration project. Claude Code, Meta Muse, and DeepSeek remain products and services of their respective owners.

## Türkçe

Universal Claude Runtime (UCR), tek bir Claude Code CLI kurulumunu Meta Muse veya DeepSeek profiliyle başlatan modüler bir Linux runtime'ıdır. UCR uzak VPS'e bağlanmaz; kurulumu ve komutları kendi sunucunuzda çalıştırırsınız.

### Hızlı başlangıç

Desteklenen ana hedef: x86_64 Ubuntu/Debian VPS. Kurulum root, runtime komutları normal kullanıcı ile çalıştırılır.

    git clone https://github.com/masan3134/universal-claude-runtime.git
    cd universal-claude-runtime
    sudo ./install.sh

Anahtarları şu dosyaya ekleyin:

    ~/.config/universal-claude-runtime/secrets.env

Örnek:

    META_MODEL_API_KEY=replace_me
    DEEPSEEK_API_KEY=replace_me

Ardından:

    chmod 600 ~/.config/universal-claude-runtime/secrets.env
    claude-doctor
    claude-muse
    claude-deepseek-flash
    claude-deepseek-pro

Yalnızca bir provider kullanıyorsanız ilgili launcher doğrudan çalışabilir. Mevcut doctor sürümü kayıtlı bütün profillerin credential'larını kontrol eder; bu nedenle eksik, kullanılmayan provider anahtarı doctor sonucunu BLOCKED yapabilir.

tmux varsayılan olarak kapalıdır. Kalıcı oturum için:

    export UCR_TMUX_ENABLED=true
    claude-muse

### v1 destek kapsamı

| Alan | Destek |
|---|---|
| İşletim sistemi | Ubuntu/Debian x86_64 ana hedef; dnf/yum tmux kurulumu best-effort |
| Claude Code | Sabitlenmiş Linux x64 binary, manifest/boyut/SHA-256 doğrulaması |
| Provider profilleri | Meta Muse, DeepSeek Flash, DeepSeek Pro |
| Oturum | Opsiyonel, profile özel tmux oturumu |
| Secret | Git dışında, kullanıcı config dizininde, dosya modu 600 |
| Kurulum | Kullanıcı VPS'inde root installer; non-root runtime |
| Kabul | 2026-08-28 tarihinde kullanıcı tarafından kurulum ve çalışma doğrulandı; doğrulanan commit kaydedilmedi |

Production-ready ifadesi yalnızca bu dokümante edilen self-managed kapsam içindir. Otomatik provider HTTP health check, SLA, yönetilen servis, otomatik rollback komutu ve gizli anahtar kasası v1 kapsamı dışındadır.

## English

Universal Claude Runtime (UCR) is a modular Linux runtime that launches one Claude Code CLI installation with a Meta Muse or DeepSeek profile. UCR does not connect to or administer your VPS; you run it on your own server.

### Quick start

Primary target: x86_64 Ubuntu/Debian VPS. Run installation as root and runtime commands as a regular user.

    git clone https://github.com/masan3134/universal-claude-runtime.git
    cd universal-claude-runtime
    sudo ./install.sh

Add credentials to:

    ~/.config/universal-claude-runtime/secrets.env

Example:

    META_MODEL_API_KEY=replace_me
    DEEPSEEK_API_KEY=replace_me

Then run:

    chmod 600 ~/.config/universal-claude-runtime/secrets.env
    claude-doctor
    claude-muse
    claude-deepseek-flash
    claude-deepseek-pro

If you use one provider only, its launcher can be used directly. The current doctor checks credentials for every registered profile, so a missing unused-provider credential can make doctor report BLOCKED.

tmux is disabled by default. To use persistent sessions:

    export UCR_TMUX_ENABLED=true
    claude-muse

### v1 support scope

| Area | Support |
|---|---|
| Operating system | Ubuntu/Debian x86_64 primary target; dnf/yum tmux install is best-effort |
| Claude Code | Pinned Linux x64 binary with manifest, size, and SHA-256 verification |
| Provider profiles | Meta Muse, DeepSeek Flash, DeepSeek Pro |
| Sessions | Optional profile-specific tmux session |
| Secrets | Outside Git, user config directory, file mode 600 |
| Installation | Root installer on the user's VPS; non-root runtime |
| Acceptance | User-reported successful install and runtime on 2026-08-28; tested commit was not recorded |

“Production-ready” applies only to this documented self-managed scope. Automated provider HTTP health checks, an SLA, a managed service, an automated rollback command, and a secret vault are outside v1.

## Commands

| Command | Purpose |
|---|---|
| claude-muse | Start Claude Code with the Muse profile |
| claude-deepseek-flash | Start with DeepSeek Flash |
| claude-deepseek-pro | Start with DeepSeek Pro |
| claude-runtime --profile NAME | Select a profile explicitly |
| claude-doctor | Validate local dependencies, config, binary, credentials, and non-root execution |

## Documentation

- [Documentation index](docs/README.md)
- [Installation](docs/INSTALLATION.md)
- [Providers](docs/PROVIDERS.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Operations](docs/OPERATIONS.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)
- [FAQ](docs/FAQ.md)
- [Release guide](docs/RELEASE.md)
- [Security](SECURITY.md)
- [Threat model](docs/THREAT_MODEL.md)
- [Contributing](CONTRIBUTING.md)
- [Support](SUPPORT.md)
- [Changelog](CHANGELOG.md)
- [Readiness and roadmap](TODO.md)

Support and security reports: info@gaiai.ai — https://gaiai.ai
