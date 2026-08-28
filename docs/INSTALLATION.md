# Installation / Kurulum

## Türkçe

### Desteklenen hedef

Ana production hedefi x86_64 Ubuntu/Debian VPS'tir. Installer tmux için apt-get, dnf veya yum kullanabilir; Ubuntu/Debian dışı yollar best-effort kabul edilir. Claude Code artefaktı Linux x64 olarak sabitlenmiştir.

Gereksinimler: root/sudo, bash, jq, curl, sha256sum, install, stat, internet erişimi ve normal bir runtime kullanıcısı.

### Standart kurulum

    git clone https://github.com/masan3134/universal-claude-runtime.git
    cd universal-claude-runtime
    sudo ./install.sh

Installer sistem dosyalarını varsayılan olarak /opt/universal-claude-runtime altına, launcher'ları /usr/local/bin altına kurar ve kullanıcı config dizininde secrets.env oluşturur.

Credential dosyasını runtime'ı çalıştıracak normal kullanıcıyla düzenleyin:

    mkdir -p ~/.config/universal-claude-runtime
    chmod 700 ~/.config/universal-claude-runtime
    editor ~/.config/universal-claude-runtime/secrets.env
    chmod 600 ~/.config/universal-claude-runtime/secrets.env

İhtiyacınız olan değerleri ekleyin:

    META_MODEL_API_KEY=replace_me
    DEEPSEEK_API_KEY=replace_me

Gerçek anahtarı shell history'ye, issue'ya veya Git'e yazmayın.

### Doğrulama

Root shell'den çıkın ve normal kullanıcıyla çalıştırın:

    claude-doctor

doctor; jq, provider config, tmux, Claude binary, kayıtlı profile credential'ları ve non-root execution kontrolü yapar. Gerçek provider HTTP isteği göndermez. Bütün profilleri kontrol ettiği için yalnızca bir provider kullanıyorsanız eksik diğer credential BLOCKED sonucu verebilir.

Provider bazlı gerçek smoke testi:

    claude-muse --version
    claude-deepseek-flash --version
    claude-deepseek-pro --version

İnference doğrulaması için ilgili launcher'ı interaktif açın ve credential harcamayı kabul ettiğiniz küçük bir prompt çalıştırın.

Launcher binary bulunamadı diyorsa doğrulanmış binary yolunu geçici olarak belirtin:

    export UCR_CLAUDE_BINARY=/opt/universal-claude-runtime/claude-code/active/claude

Ardından launcher'ı tekrar çalıştırın. Bu override'ı kalıcı yapmadan önce yolu doğrulayın.

### tmux

    export UCR_TMUX_ENABLED=true
    claude-muse

Aynı profil tekrar çalıştırıldığında ilgili tmux oturumuna attach/create davranışı uygulanır. tmux'u kapatmak için değişkeni false yapın veya unset edin.

### Özel yollar

Installer şu override'ları destekler:

    sudo UCR_PREFIX=/opt/universal-claude-runtime UCR_BIN_DIR=/usr/local/bin ./install.sh

Custom prefix kullanıyorsanız UCR_ROOT ve UCR_CLAUDE_BINARY değerlerini de gerçek kurulum yollarıyla eşleştirin.

## English

### Supported target

The primary production target is an x86_64 Ubuntu/Debian VPS. The installer can use apt-get, dnf, or yum for tmux; non-Ubuntu/Debian paths are best-effort. The Claude Code artifact is pinned to Linux x64.

Requirements: root/sudo, bash, jq, curl, sha256sum, install, stat, internet access, and a regular runtime user.

### Standard installation

    git clone https://github.com/masan3134/universal-claude-runtime.git
    cd universal-claude-runtime
    sudo ./install.sh

By default, system files go to /opt/universal-claude-runtime, launchers go to /usr/local/bin, and secrets.env is created under the user's config directory.

Edit credentials as the regular user that will run the runtime:

    mkdir -p ~/.config/universal-claude-runtime
    chmod 700 ~/.config/universal-claude-runtime
    editor ~/.config/universal-claude-runtime/secrets.env
    chmod 600 ~/.config/universal-claude-runtime/secrets.env

Add only the values you need:

    META_MODEL_API_KEY=replace_me
    DEEPSEEK_API_KEY=replace_me

Never place a real key in shell history, an issue, or Git.

### Verification

Leave the root shell and run as a regular user:

    claude-doctor

doctor checks jq, provider configuration, tmux, the Claude binary, credentials for registered profiles, and non-root execution. It does not send a real provider HTTP request. Because it checks every profile, a missing unused-provider credential can produce BLOCKED.

Provider-specific smoke commands:

    claude-muse --version
    claude-deepseek-flash --version
    claude-deepseek-pro --version

To verify inference, open the relevant launcher interactively and send a small prompt only if you accept provider usage charges.

If a launcher reports a missing binary, point it at the verified artifact for the current shell:

    export UCR_CLAUDE_BINARY=/opt/universal-claude-runtime/claude-code/active/claude

Verify the path before making this override persistent.

### tmux

    export UCR_TMUX_ENABLED=true
    claude-muse

Running the same profile again attaches to or creates its profile-specific session. Set the variable to false or unset it to disable tmux.

### Custom paths

    sudo UCR_PREFIX=/opt/universal-claude-runtime UCR_BIN_DIR=/usr/local/bin ./install.sh

With a custom prefix, align UCR_ROOT and UCR_CLAUDE_BINARY with the installed paths.

Next: [Operations](OPERATIONS.md) · [Troubleshooting](TROUBLESHOOTING.md) · [Security](../SECURITY.md)

Contact: info@gaiai.ai — https://gaiai.ai
