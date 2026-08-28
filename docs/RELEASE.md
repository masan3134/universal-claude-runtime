# Release Guide / Sürüm Rehberi

This guide defines an evidence-based release process. A document status change is not a substitute for passing implementation checks.

Bu rehber kanıta dayalı sürüm sürecini tanımlar. Doküman status değişikliği implementasyon kontrollerinin yerine geçmez.

## Versioning / Sürümleme

Use semantic versions for tagged releases:

- MAJOR: incompatible command, config, or security-model change;
- MINOR: backward-compatible provider or feature addition;
- PATCH: backward-compatible fix or documentation correction.

Tagged release yoksa main branch geliştirme kaynağıdır. Release notu exact commit'i belirtmelidir.

## Pre-release checklist / Sürüm öncesi liste

1. Choose the exact commit and ensure the worktree/repository state is known.
2. Review provider endpoints, model names, Claude Code pin, and OS scope.
3. Run:

       make test

4. Confirm GitHub Actions is green for the release commit.
5. Perform a clean install on the primary Ubuntu/Debian x86_64 target.
6. Run claude-doctor as a non-root user.
7. Run opt-in live smoke tests for every advertised provider; record redacted results and cost awareness.
8. Test tmux attach/create behavior when enabled.
9. Test upgrade from the previous release and the documented rollback path.
10. Confirm uninstall preserves secrets and creates the recoverable runtime directory.
11. Scan output and repository history for secrets.
12. Verify TR/EN docs match the implementation.
13. Update CHANGELOG.md and TODO.md.
14. Resolve licensing and third-party notice requirements before redistribution.

## Evidence matrix / Kanıt matrisi

| Evidence | Required record |
|---|---|
| Source | Exact commit SHA |
| Static checks | make test output and exit status |
| CI | Workflow URL and green conclusion |
| Clean install | OS image, architecture, date, result |
| Provider smoke | Profile, model, date, redacted result |
| Upgrade | From/to versions and result |
| Rollback | Method and recovered version |
| Security | Secret scan method and result |
| Docs | Reviewer and parity confirmation |

The 2026-08-28 operator report confirms a successful install/runtime experience, but the exact tested commit and provider-by-provider evidence were not recorded. It must not be presented as complete CI-backed release evidence.

2026-08-28 kullanıcı bildirimi başarılı kurulum/çalıştırma deneyimini doğrular; ancak exact commit ve provider bazlı kanıt kaydedilmediği için tam CI-backed release kanıtı olarak sunulmamalıdır.

## Release notes / Sürüm notları

Each release note must include:

- summary and user impact;
- supported OS/architecture;
- Claude Code pin and provider profile changes;
- install/upgrade steps;
- security-relevant changes;
- known limitations;
- evidence links;
- rollback guidance.

## Rollback / Geri dönüş

v1 has no automated rollback command. Prefer the last known-good repository revision and a verified reinstall. A preserved binary copy may be used only after provenance/checksum verification and a scoped UCR_CLAUDE_BINARY smoke test.

v1 otomatik rollback komutu sunmaz. Son bilinen iyi revision ve doğrulanmış reinstall tercih edilir. Korunan binary kopyası yalnızca provenance/checksum doğrulaması ve sınırlı smoke sonrası kullanılmalıdır.

## Publishing rule / Yayın kuralı

Do not label a tag or release “verified,” “production,” or “secure” unless the corresponding evidence matrix is complete for that exact commit. Known failures must be explicit, not hidden in roadmap language.

Exact commit için kanıt matrisi tamamlanmadan tag/release “verified”, “production” veya “secure” diye etiketlenmemelidir.
