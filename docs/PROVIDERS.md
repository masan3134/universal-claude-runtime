# Providers / Sağlayıcılar

## Türkçe

Provider seçimi profile üzerinden yapılır. Runtime provider'a göre endpoint, auth değişkeni ve model alias'larını ayarlar.

### DeepSeek

- `deepseek-flash`: `deepseek-v4-flash`
- `deepseek-pro`: `deepseek-v4-pro[1m]`
- Endpoint: `https://api.deepseek.com/anthropic`
- Secret: `DEEPSEEK_API_KEY` veya `DEEPSEEK_NEW_API`

### Meta Muse

- `muse`: `muse-spark-1.2-contributor`
- Endpoint: `https://api.meta.ai`
- Secret: `META_MODEL_API_KEY` veya `META_API_KEY`

Provider fallback sessiz değildir. Seçilen provider başarısız olursa runtime durur ve kanıtlanabilir hata döndürür.

## English

Provider selection is profile-based. The runtime sets endpoint, authentication variables, and model aliases according to the selected provider.

### DeepSeek

- `deepseek-flash`: `deepseek-v4-flash`
- `deepseek-pro`: `deepseek-v4-pro[1m]`
- Endpoint: `https://api.deepseek.com/anthropic`
- Secret: `DEEPSEEK_API_KEY` or `DEEPSEEK_NEW_API`

### Meta Muse

- `muse`: `muse-spark-1.2-contributor`
- Endpoint: `https://api.meta.ai`
- Secret: `META_MODEL_API_KEY` or `META_API_KEY`

Provider fallback is never silent. If the selected provider fails, the runtime stops and returns an evidence-based error.
