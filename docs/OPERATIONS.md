# Operations / Operasyonlar

## Türkçe

### Kurulum

Kurulum kullanıcı VPS'inde çalışır:

    sudo ./install.sh

Installer tmux'u kontrol eder, eksikse Ubuntu/Debian apt ile kurar. Claude Code binary'si resmi release manifesti, sürüm, boyut ve SHA-256 ile doğrulanır.

### Provider seçimi

    claude-muse
    claude-deepseek-flash
    claude-deepseek-pro

### Güncelleme

    sudo ./upgrade.sh

Upgrade atomic dosya aktivasyonu kullanır. Başarısız indirme veya checksum durumunda mevcut binary değiştirilmez.

### Kaldırma

    sudo ./uninstall.sh

Runtime dosyaları timestamp'li geri alınabilir bir klasöre taşınır. Secret dosyası silinmez.

## English

### Installation

Run installation on the user's VPS:

    sudo ./install.sh

The installer checks tmux and installs it through apt on Ubuntu/Debian when missing. The Claude Code binary is verified by official release manifest, version, size, and SHA-256 before activation.

### Provider selection

    claude-muse
    claude-deepseek-flash
    claude-deepseek-pro

### Upgrade

    sudo ./upgrade.sh

Upgrade uses atomic activation. A failed download or checksum never replaces the active binary.

### Uninstall

    sudo ./uninstall.sh

Runtime files are moved to a timestamped recoverable directory. Secret files are preserved.

Support: info@gaiai.ai — https://gaiai.ai
