# Threat Model / Tehdit Modeli

## Scope / Kapsam

This model covers UCR installation, local profile selection, credential mapping, Claude Code execution, and optional tmux sessions on a self-managed VPS. Provider infrastructure, Claude Code internals, SSH configuration, and the operating system are external trust domains.

Bu model UCR kurulumu, local profile seçimi, credential mapping, Claude Code execution ve opsiyonel tmux oturumlarını kapsar. Provider altyapısı, Claude Code internalleri, SSH ve işletim sistemi harici güven alanlarıdır.

## Assets / Varlıklar

- Meta and DeepSeek API credentials
- Claude Code binary integrity
- Provider/model routing integrity
- User source code and prompts
- VPS user account and tmux sessions
- Deployment and release evidence

## Trust boundaries / Güven sınırları

1. Git repository to root installer
2. Download host to checksum-verified binary
3. User secret file to provider adapter
4. UCR environment to Claude Code process
5. Claude Code process to provider endpoint
6. SSH/tmux user boundary on the VPS

## Threats and controls / Tehditler ve kontroller

| Threat / Tehdit | Current control / Mevcut kontrol | Residual risk / Kalan risk |
|---|---|---|
| Secret committed or pasted | Secret kept outside repo; mode 600 check | User, shell history, backup, or support error |
| Credential sent to wrong provider | Separate adapters; conflicting auth variable unset | Compromised process or upstream client behavior |
| Tampered Claude binary | Pinned version, manifest, size, SHA-256 | Compromised release origin/manifest or host |
| Runtime executed as root | Non-root gate in diagnostics/runtime policy | Installer necessarily runs privileged |
| Unknown profile fallback | Strict profile lookup and exit 78 | Misconfigured known profile |
| tmux name injection | Static configured session names | Future dynamic names require validation |
| Secret in logs | UCR diagnostics avoid printing values | Child process, tracing, crash dumps, operator capture |
| Provider outage or incompatibility | Explicit profile; no silent fallback | No automated HTTP health check |
| Unauthorized VPS access | Outside UCR; operator hardening required | SSH/OS compromise exposes process and files |

## Security assumptions / Güvenlik varsayımları

- The operator obtains the repository revision from a trusted source.
- The VPS and package manager are maintained.
- Provider credentials are scoped and rotated by the operator.
- The provider's Anthropic-compatible behavior matches the configured adapter.
- Claude Code and provider terms permit the intended integration.
- Root is used only for host lifecycle operations.

## Abuse cases / Kötüye kullanım senaryoları

UCR must not be used as a shared credential proxy, to hide provider identity, to bypass provider controls, or to expose an unauthenticated remote execution service. Do not place launcher commands behind a public endpoint without independent authentication, authorization, sandboxing, rate limiting, and audit controls.

## Validation / Doğrulama

Local validation includes schema checks, credential presence, file mode, binary availability, dependency checks, and non-root execution. Real provider health requires an opt-in inference smoke and may incur cost. A local PASS must not be represented as provider availability proof.

Local PASS, provider erişilebilirlik kanıtı olarak sunulmamalıdır. Gerçek provider health testi opt-in inference smoke gerektirir ve ücret oluşturabilir.

## Review triggers / Gözden geçirme tetikleri

Review this model when adding a provider, changing endpoints/auth variables, changing binary distribution, adding network services, making session names dynamic, introducing logs/telemetry, or publishing a release.
