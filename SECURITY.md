# Security / Güvenlik

## Türkçe

Bu ürün API anahtarlarını Git repository'sinde tutmaz.

Desteklenen secret değişkenleri:

    META_MODEL_API_KEY=
    DEEPSEEK_API_KEY=
    DEEPSEEK_NEW_API=

Kurallar:

- Secret dosyası chmod 600 ile korunur.
- Secret değerleri stdout, stderr veya loglara yazılmaz.
- Meta anahtarı DeepSeek'e gönderilmez.
- DeepSeek anahtarı Meta'ya gönderilmez.
- Runtime root olarak Claude çalıştırmaz.
- Bilinmeyen endpoint veya model fail-close olur.
- Binary checksum doğrulanmadan etkinleştirilmez.
- Gerçek health check olmadan provider PASS sayılmaz.

Güvenlik bildirimi: info@gaiai.ai

## English

This product never stores API keys in the Git repository.

Supported secret variables:

    META_MODEL_API_KEY=
    DEEPSEEK_API_KEY=
    DEEPSEEK_NEW_API=

Rules:

- Secret files use mode 600.
- Secret values never appear in stdout, stderr, or logs.
- Meta credentials never go to DeepSeek.
- DeepSeek credentials never go to Meta.
- Claude never runs as root.
- Unknown endpoints or models fail closed.
- Binaries are not activated before checksum verification.
- A provider is not PASS without a real health check.

Security contact: info@gaiai.ai
