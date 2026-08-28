# Troubleshooting / Sorun Giderme

Start with the exact command, exit status, current user, selected profile, and a redacted error. Never paste credentials.

Tam komut, exit status, kullanıcı, profil ve redact edilmiş hatayla başlayın. Credential paylaşmayın.

## BLOCKED with exit 78

Status 78 means configuration or a required precondition failed closed. It is not a provider fallback.

78; config veya zorunlu ön koşulun fail-close olduğu anlamına gelir. Provider fallback değildir.

    command
    printf 'exit=%s
' "$?"

Check:

    test "$(id -u)" -ne 0
    command -v jq
    command -v tmux
    claude-doctor

## Secret file must use mode 600

    chmod 600 ~/.config/universal-claude-runtime/secrets.env
    stat -c '%a %n' ~/.config/universal-claude-runtime/secrets.env

The file must belong to the runtime user and must not be world/group-readable. Dosya runtime kullanıcısına ait olmalı ve group/world read izni taşımamalıdır.

## Credential missing

Add the credential for the selected profile:

    META_MODEL_API_KEY=replace_me
    DEEPSEEK_API_KEY=replace_me

Use one assignment per line, no export command required. Keep the file at mode 600. The current doctor checks all profiles, so it can report an unused provider as missing even when the intended launcher works.

Her satırda tek assignment kullanın. Mevcut doctor bütün profilleri kontrol ettiği için kullanılmayan provider'ı eksik gösterebilir.

## Claude binary missing

Confirm the verified artifact:

    test -x /opt/universal-claude-runtime/claude-code/active/claude
    /opt/universal-claude-runtime/claude-code/active/claude --version

For a scoped test:

    export UCR_CLAUDE_BINARY=/opt/universal-claude-runtime/claude-code/active/claude
    claude-deepseek-flash --version

Do not point UCR_CLAUDE_BINARY to an unverified download. Kalıcı override öncesi binary kaynağını ve checksum doğrulamasını teyit edin.

## tmux missing or session problem

    command -v tmux
    tmux list-sessions
    tmux kill-session -t ucr-muse

Kill only the exact session you intend to discard. A tmux session may retain the environment from its creation; after rotating credentials, close the old profile session and start a new one.

Sadece hedef oturumu kapatın. tmux oturumu oluşturulduğu andaki environment'ı taşıyabilir; key rotation sonrası eski profile oturumunu kapatıp yenisini açın.

To bypass tmux for diagnosis:

    export UCR_TMUX_ENABLED=false
    claude-muse

## doctor passes but inference fails

doctor does not call the provider. Check:

- provider account/model access;
- current endpoint and provider status;
- region or organization restrictions;
- quota, balance, or rate limits;
- Claude Code/provider compatibility changes;
- system clock and outbound HTTPS/DNS.

doctor provider'a HTTP isteği göndermez. Local PASS gerçek inference garantisi değildir. Provider dashboard/status bilgilerini ve redact edilmiş runtime hatasını birlikte inceleyin.

## Wrong provider or model

    claude-runtime --profile muse
    claude-runtime --profile deepseek-flash
    claude-runtime --profile deepseek-pro

Use the explicit launcher; do not reuse a tmux session created for another profile. The runtime sets UCR_ACTIVE_PROVIDER and UCR_ACTIVE_MODEL for the child process, but these values are diagnostic metadata, not credentials.

## Upgrade failure

A failed manifest download, size check, checksum, or version check should stop activation. Preserve the error, repository commit, OS, architecture, and target paths. Do not disable checksum checks.

Manifest, size, checksum veya version doğrulamasını bypass etmeyin. Son bilinen iyi revision ile [Operations](OPERATIONS.md) içindeki rollback yaklaşımını uygulayın.

## Safe support bundle / Güvenli destek paketi

Share only:

    uname -a
    id
    command -v jq tmux claude-runtime
    claude-runtime --help
    git rev-parse HEAD

If a command might print environment variables or config, inspect and redact it first. Never send secrets.env, env output, shell history, SSH private keys, passwords, or provider tokens.

Support: info@gaiai.ai — https://gaiai.ai
