# Contributing / Katkı Rehberi

Thank you for improving Universal Claude Runtime. Keep changes small, reviewable, provider-isolated, and bilingual where they affect users.

Universal Claude Runtime'a katkı için teşekkürler. Değişiklikleri küçük, incelenebilir, provider-isolated ve kullanıcıyı etkiliyorsa bilingual tutun.

## Before opening a change / Değişiklik öncesi

- Open an issue for security-sensitive, incompatible, or provider-contract changes.
- Never include real API keys, private IP addresses, passwords, SSH material, customer prompts, or proprietary logs.
- Preserve the public command contract unless the change is explicitly versioned.
- Do not add silent fallback between providers.
- Do not weaken checksum, file-mode, or non-root checks.

## Development checks / Geliştirme kontrolleri

Required local tools: bash and jq.

    make test

make test currently runs Bash syntax validation and provider contract tests. New behavior must add the smallest relevant automated test. Provider live tests must be opt-in, use dedicated low-privilege credentials, avoid printing responses that may contain user data, and clearly warn about cost.

make test şu anda Bash syntax ve provider contract testlerini çalıştırır. Yeni davranış ilgili en küçük otomatik testi eklemelidir. Live provider testi opt-in ve maliyet uyarılı olmalıdır.

## Change requirements / Değişiklik gereksinimleri

### Provider changes

A provider change must update:

- config profile;
- isolated adapter;
- contract tests;
- PROVIDERS.md;
- SECURITY.md and THREAT_MODEL.md when auth or endpoint behavior changes;
- release notes and an opt-in live smoke plan.

### Runtime changes

Document command behavior, exit status, privilege requirements, paths, upgrade impact, and rollback. Keep provider-specific secrets out of the core runtime.

### Documentation changes

Turkish and English must describe the same behavior. Commands must be runnable and mutable provider pricing must be linked or described as provider-controlled, not frozen as fact.

## Pull request checklist / PR kontrol listesi

- [ ] Scope and non-goals are clear
- [ ] make test passes
- [ ] No secret or private infrastructure data is included
- [ ] Security boundaries remain fail-closed
- [ ] TR/EN documentation is synchronized
- [ ] Upgrade and rollback impact is documented
- [ ] User-visible changes are added to CHANGELOG.md
- [ ] Live-test evidence is redacted and opt-in

## Commit and review / Commit ve inceleme

Use concise imperative commit messages. Reviewers should verify behavior against code, not only prose. A passing mock or local diagnostic must not be described as provider availability evidence.

Security reports: info@gaiai.ai  
Project: https://gaiai.ai
