# Threat Model / Tehdit Modeli

## Türkçe

Korunan varlıklar: provider API anahtarları, Claude binary bütünlüğü, kullanıcı VPS'i, model endpoint seçimi ve tmux oturumları.

Temel tehditler:

- secret'ın Git/log/terminal çıktısına sızması
- Meta anahtarının DeepSeek'e veya tersi endpoint'e gitmesi
- sahte/değiştirilmiş Claude binary çalıştırılması
- root altında agent çalıştırılması
- bilinmeyen profile sessiz fallback yapılması
- tmux session adından komut enjeksiyonu

Kontroller: `chmod 600`, provider auth isolation, allowlist, checksum, non-root gate, strict profile validation, session-name regex ve fail-close exit code.

## English

Protected assets: provider API keys, Claude binary integrity, the user's VPS, model endpoint selection, and tmux sessions.

Primary threats:

- secrets leaking into Git, logs, or terminal output
- Meta credentials sent to DeepSeek or vice versa
- executing a tampered Claude binary
- running the agent as root
- silent fallback to an unknown profile
- command injection through tmux session names

Controls: mode 600, provider auth isolation, allowlists, checksum verification, non-root gate, strict profile validation, session-name regex, and fail-closed exit codes.
