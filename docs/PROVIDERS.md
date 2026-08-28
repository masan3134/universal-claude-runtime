# Providers / Sağlayıcılar

Provider behavior is config- and adapter-driven. Model names, endpoints, access, limits, and prices are provider-controlled and may change independently of this repository.

Provider davranışı config ve adapter ile belirlenir. Model adları, endpoint, erişim, limit ve fiyatlar provider tarafından kontrol edilir ve bu repodan bağımsız değişebilir.

## Profiles / Profiller

| Launcher | Profile | Provider model | Credential | Endpoint |
|---|---|---|---|---|
| claude-muse | muse | muse-spark-1.2-contributor | META_MODEL_API_KEY or META_API_KEY | https://api.meta.ai |
| claude-deepseek-flash | deepseek-flash | deepseek-v4-flash | DEEPSEEK_API_KEY or DEEPSEEK_NEW_API | https://api.deepseek.com/anthropic |
| claude-deepseek-pro | deepseek-pro | deepseek-v4-pro[1m] | DEEPSEEK_API_KEY or DEEPSEEK_NEW_API | https://api.deepseek.com/anthropic |

These values describe the current repository configuration, not a permanent provider guarantee. Confirm account access and current provider terms before production use.

Bu değerler mevcut repository config'ini açıklar; kalıcı provider garantisi değildir. Production kullanımdan önce hesap erişimini ve güncel provider koşullarını doğrulayın.

## Environment mapping / Ortam eşlemesi

### Meta Muse

The adapter sets ANTHROPIC_BASE_URL, ANTHROPIC_AUTH_TOKEN, ANTHROPIC_MODEL, the default Opus/Sonnet/Haiku model aliases, and the subagent model. It unsets ANTHROPIC_API_KEY and known Bedrock variables.

Adapter; ANTHROPIC_BASE_URL, ANTHROPIC_AUTH_TOKEN, ANTHROPIC_MODEL, varsayılan Opus/Sonnet/Haiku alias'ları ve subagent modelini ayarlar. ANTHROPIC_API_KEY ve bilinen Bedrock değişkenlerini unset eder.

### DeepSeek

The adapter maps the DeepSeek credential to ANTHROPIC_API_KEY and sets the same model aliases. It unsets ANTHROPIC_AUTH_TOKEN and known Bedrock variables.

Adapter, DeepSeek credential'ını ANTHROPIC_API_KEY'e map eder ve aynı model alias'larını ayarlar. ANTHROPIC_AUTH_TOKEN ve bilinen Bedrock değişkenlerini unset eder.

## Selection / Seçim

Use a stable launcher:

    claude-muse
    claude-deepseek-flash
    claude-deepseek-pro

Or select explicitly:

    claude-runtime --profile muse
    claude-runtime --profile deepseek-flash
    claude-runtime --profile deepseek-pro

Unknown profiles and missing credentials fail closed with status 78. There is no silent provider fallback.

Bilinmeyen profile ve eksik credential 78 ile fail-close olur. Sessiz provider fallback yoktur.

## Verification / Doğrulama

claude-doctor verifies local configuration and credential presence only. A successful real inference is the authoritative provider compatibility check for your account, region, model access, and provider state.

claude-doctor yalnızca local config ve credential varlığını doğrular. Hesap, bölge, model erişimi ve provider durumu için başarılı gerçek inference yetkili uyumluluk testidir.

## Pricing policy / Fiyat politikası

The repository intentionally does not hard-code prices. Check the provider's official console or pricing documentation immediately before cost-sensitive use. UCR does not add a proxy surcharge, but your VPS and provider charges remain your responsibility.

Repository fiyatları bilerek hard-code etmez. Maliyet duyarlı kullanımdan hemen önce provider'ın resmi konsolunu veya fiyat dokümanını kontrol edin. UCR proxy ek ücreti koymaz; VPS ve provider ücretleri size aittir.
