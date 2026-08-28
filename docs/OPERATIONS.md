# Operations Runbook / Operasyon Runbook'u

## Daily operation / Günlük kullanım

Run runtime commands as a regular user:

    claude-muse
    claude-deepseek-flash
    claude-deepseek-pro

Optional persistent session:

    export UCR_TMUX_ENABLED=true
    claude-muse
    tmux list-sessions
    tmux attach -t ucr-muse

Runtime komutlarını normal kullanıcıyla çalıştırın. tmux açıkken her profile sabit bir oturum adı kullanılır.

## Pre-flight / Ön kontrol

    test "$(id -u)" -ne 0
    command -v jq
    command -v tmux
    stat -c '%a %n' ~/.config/universal-claude-runtime/secrets.env
    claude-doctor

Expected secret mode is 600. doctor is a local pre-flight check, not an HTTP provider probe. Gerçek provider bağlantısı için profile özel küçük bir smoke çalıştırın.

## Upgrade / Güncelleme

1. Read CHANGELOG.md and review config differences.
2. Back up the user secret file without printing its contents.
3. Pull or check out the intended repository revision.
4. Run:

       sudo ./upgrade.sh

5. Exit the root shell.
6. Run claude-doctor as the runtime user.
7. Run one explicit smoke per provider you depend on.

The installer logic verifies manifest version, artifact size, SHA-256, and the binary's --version before activation. It may preserve one prior binary copy under the configured rollback directory. v1 does not provide an automated rollback command.

Installer; manifest sürümü, artefakt boyutu, SHA-256 ve binary --version sonucunu activation öncesi doğrular. Rollback dizininde bir önceki binary kopyası tutulabilir; v1 otomatik rollback komutu sağlamaz.

## Manual rollback / Manuel rollback

Use only after confirming paths and stopping active sessions. The supported operational fallback is to check out the last known-good repository revision and reinstall it. If using the saved binary copy manually, validate its checksum/provenance and use UCR_CLAUDE_BINARY for a scoped test before replacing anything.

Yolları doğrulamadan veya aktif oturumları durdurmadan binary taşımayın. Tercih edilen fallback, son bilinen iyi repository revision'ına dönüp yeniden kurmaktır. Saved binary manuel kullanılacaksa önce checksum/provenance doğrulayın ve replacement öncesi UCR_CLAUDE_BINARY ile sınırlı test yapın.

## Uninstall / Kaldırma

    sudo ./uninstall.sh

Launcher'lar silinir ve runtime prefix timestamp'li .removed dizinine taşınır. Kullanıcının secrets.env dosyası korunur.  
Launchers are removed and the runtime prefix is moved to a timestamped .removed directory. The user's secrets.env is preserved.

After validation, the operator may archive or remove the recoverable directory manually. Secret deletion and provider-key revocation are always explicit operator actions.

## Incident response / Olay müdahalesi

For a suspected key leak:

1. Stop related Claude/tmux sessions.
2. Revoke or rotate the key at the provider.
3. Replace the local value and enforce mode 600.
4. Inspect shell history, process logs, CI logs, and support tickets.
5. Re-run local checks and a minimal provider smoke.
6. Report product vulnerabilities privately to info@gaiai.ai.

For provider failure, do not assume fallback. Capture the profile, timestamp, command exit status, redacted error, Claude Code version, and provider status. Never capture the credential value.

## Backup and recovery / Yedekleme ve kurtarma

Back up provider-independent configuration and deployment records. Avoid copying plaintext secrets into general-purpose backups. Provider keys should be recoverable through rotation, not restoration from insecure archives.

Config ve deployment kayıtlarını yedekleyin; plaintext secret'ları genel yedeklere taşımayın. Provider key kurtarma yöntemi güvensiz arşivden restore değil, rotation olmalıdır.

## Release acceptance / Sürüm kabulü

A production deployment is accepted only when installation/upgrade exits successfully, local diagnostics pass for the intended configuration, required provider smoke tests pass, tmux behavior is confirmed if enabled, and no secret appears in captured output. Record the exact commit and date.
