# Security Policy / Güvenlik Politikası

## Supported scope / Desteklenen kapsam

Security fixes target the latest commit on the main branch and the latest documented release. Self-managed VPS hardening, provider account security, and provider availability remain the operator's responsibility.

Güvenlik düzeltmeleri main branch'in son commit'ini ve son dokümante edilen sürümü hedefler. VPS hardening, provider hesabı güvenliği ve provider erişilebilirliği operatörün sorumluluğundadır.

## Report a vulnerability / Güvenlik açığı bildirimi

Do not open a public issue for a suspected vulnerability. Send a concise report to **info@gaiai.ai** with:

- affected version or commit;
- reproduction steps and impact;
- whether credentials or user data may be exposed;
- a safe contact method.

Şüpheli güvenlik açığı için public issue açmayın. Etkilenen sürüm/commit, tekrar adımları, etki, olası secret veya veri sızıntısı ve güvenli iletişim yöntemiyle **info@gaiai.ai** adresine yazın.

Do not include live API keys, tokens, private SSH material, or unrelated personal data. Receipt, triage, and disclosure timing are coordinated case by case; no response-time SLA is currently promised.

## Secret model / Secret modeli

Supported variables:

    META_MODEL_API_KEY=
    META_API_KEY=
    DEEPSEEK_API_KEY=
    DEEPSEEK_NEW_API=

The canonical file is:

    ~/.config/universal-claude-runtime/secrets.env

It must be readable only by its owner:

    chmod 600 ~/.config/universal-claude-runtime/secrets.env

Runtime adapters map only the selected provider credential into the Anthropic-compatible variable expected by Claude Code and unset the opposite Anthropic authentication variable. UCR-owned scripts are designed not to print credential values. Claude Code, the selected provider, the operating system, shell tracing, crash dumps, and third-party tooling remain separate trust boundaries.

Runtime adapter'ları yalnızca seçilen provider credential'ını Claude Code'un beklediği Anthropic-compatible değişkene map eder ve karşı auth değişkenini unset eder. UCR script'leri credential değerlerini yazdırmamak üzere tasarlanmıştır. Claude Code, provider, işletim sistemi, shell tracing, crash dump ve üçüncü parti araçlar ayrı güven sınırlarıdır.

## Implemented controls / Uygulanan kontroller

- Secret file mode 600 validation
- Non-root runtime gate
- Strict profile lookup; unknown providers fail with exit code 78
- Provider-specific credential isolation
- Pinned Claude Code version and manifest/size/SHA-256 verification
- tmux session names from static provider configuration
- User secret file preserved during uninstall

## Operator requirements / Operatör gereksinimleri

- Never commit secrets or paste them into issues.
- Disable shell tracing before loading credentials.
- Use a dedicated non-root VPS user.
- Restrict SSH access and keep the OS patched.
- Rotate a key immediately after suspected exposure.
- Review provider terms, data handling, and model availability.
- Run a profile-specific smoke command after upgrades.

## Current limitations / Güncel sınırlar

claude-doctor validates local state and credential presence; it is not a real provider HTTP health check. No automatic secret rotation, central vault integration, sandbox, network egress policy, or security SLA is included.
