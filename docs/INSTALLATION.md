# Installation / Kurulum

## Türkçe

Kurulum VPS üzerinde kullanıcı tarafından çalıştırılır; proje uzak VPS'e bağlanmaz.

1. Repository'yi VPS'e alın.
2. `sudo ./install.sh` çalıştırın.
3. Config secret dosyasını açın: `~/.config/universal-claude-runtime/secrets.env`.
4. Yalnızca gerekli provider anahtarını ekleyin ve dosyayı `chmod 600` yapın.
5. `claude-doctor` çalıştırın.
6. `claude-muse`, `claude-deepseek-flash` veya `claude-deepseek-pro` kullanın.

Claude binary kurulumu, resmi release manifesti ve SHA-256 doğrulaması tamamlanmadan etkinleştirilmeyecektir.

## English

Installation is run by the user on their VPS; this project does not connect to a remote VPS.

1. Clone the repository on the VPS.
2. Run `sudo ./install.sh`.
3. Edit `~/.config/universal-claude-runtime/secrets.env`.
4. Add only the required provider key and keep mode `600`.
5. Run `claude-doctor`.
6. Use `claude-muse`, `claude-deepseek-flash`, or `claude-deepseek-pro`.

The Claude binary will not be activated until the official release manifest and SHA-256 verification pass.

Contact: info@gaiai.ai — https://gaiai.ai
