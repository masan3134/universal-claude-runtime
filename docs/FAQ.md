# Frequently Asked Questions / Sık Sorulan Sorular

## Is this an official Anthropic, Meta, or DeepSeek project?

No. Universal Claude Runtime is an independent integration project maintained by GAIAI. The named products and services belong to their respective owners.

Hayır. UCR, GAIAI tarafından sürdürülen bağımsız bir entegrasyon projesidir. Adı geçen ürün ve servisler kendi sahiplerine aittir.

## Does UCR connect to my VPS?

No. You clone and run it on your own VPS. It does not provide a remote control plane or request your SSH password.

Hayır. Repository'yi kendi VPS'inizde çalıştırırsınız. Remote control plane sağlamaz ve SSH password istemez.

## Does it replace Claude Code?

No. It launches a pinned native Claude Code binary with an Anthropic-compatible provider environment. It does not fork or patch Claude Code.

Hayır. Sabitlenmiş native Claude Code binary'sini provider environment'ıyla başlatır; Claude Code'u fork veya patch etmez.

## Why does doctor ask for both Meta and DeepSeek credentials?

The current doctor validates every registered profile. If you intentionally use only one provider, its launcher can still be tested directly. Profile-scoped doctor is on the post-v1 roadmap.

Mevcut doctor bütün kayıtlı profilleri doğrular. Yalnızca tek provider kullanıyorsanız ilgili launcher'ı doğrudan test edebilirsiniz. Profile-scoped doctor v1 sonrası roadmap'tedir.

## Does doctor prove provider health?

No. It validates local dependencies, config, binary, credential presence, and non-root execution. A real provider health check requires an opt-in inference request and may cost money.

Hayır. Local dependency, config, binary, credential varlığı ve non-root çalışma kontrol edilir. Gerçek provider health testi opt-in inference ister ve ücret oluşturabilir.

## Is tmux required?

tmux is installed/checked by the installer, but persistent runtime sessions are used only when UCR_TMUX_ENABLED=true.

tmux installer tarafından kontrol edilir; kalıcı runtime oturumu yalnızca UCR_TMUX_ENABLED=true olduğunda kullanılır.

## Where are API keys stored?

By default, in the runtime user's ~/.config/universal-claude-runtime/secrets.env file with mode 600. They must never be committed.

Varsayılan olarak runtime kullanıcısının ~/.config/universal-claude-runtime/secrets.env dosyasında, 600 modunda tutulur. Git'e yazılmamalıdır.

## What does it cost?

UCR does not add a proxy surcharge. You pay for your VPS and provider usage under the provider's current terms. Prices can change, so check the official provider console before use.

UCR proxy ek ücreti koymaz. VPS ve provider kullanımını güncel provider koşullarına göre ödersiniz. Fiyatları kullanımdan önce resmi konsoldan kontrol edin.

## Can it silently switch providers?

No. Missing credentials, unknown profiles, and unsupported providers fail closed. There is no silent fallback.

Hayır. Eksik credential, bilinmeyen profil ve desteklenmeyen provider fail-close olur. Sessiz fallback yoktur.

## How do I get support?

Read [Troubleshooting](TROUBLESHOOTING.md), then follow [Support](../SUPPORT.md). Never send credentials or private SSH material.
