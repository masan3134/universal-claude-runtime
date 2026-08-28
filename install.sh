#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PREFIX="${UCR_PREFIX:-/opt/universal-claude-runtime}"
BIN_DIR="${UCR_BIN_DIR:-/usr/local/bin}"
CONFIG_DIR="${UCR_CONFIG_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/universal-claude-runtime}"

say(){ printf '[UCR][INSTALL] %s\n' "$1"; }
fail(){ printf '[UCR][BLOCKED] %s\n' "$1" >&2; exit 78; }
[[ "$(id -u)" -eq 0 ]] || fail 'run installer as root / installer root olarak çalıştırılmalı'
command -v install >/dev/null 2>&1 || fail 'install command missing'
command -v jq >/dev/null 2>&1 || fail 'jq is required; install jq first / jq gerekli'

install -d -m 0755 "$PREFIX" "$PREFIX/bin" "$BIN_DIR"
cp -R "$ROOT/config" "$ROOT/providers" "$ROOT/runtime" "$ROOT/bin" "$PREFIX/"
cp "$ROOT/doctor.sh" "$PREFIX/doctor.sh"
chmod 0755 "$PREFIX/doctor.sh" "$PREFIX/bin/claude-runtime" "$PREFIX/runtime"/*.sh "$PREFIX/providers"/*/*.sh

install -d -m 0700 "$CONFIG_DIR"
if [[ ! -e "$CONFIG_DIR/secrets.env" ]]; then
  install -m 0600 /dev/null "$CONFIG_DIR/secrets.env"
fi

cat > "$BIN_DIR/claude-runtime" <<EOF
#!/usr/bin/env bash
exec "$PREFIX/bin/claude-runtime" "\$@"
EOF
cat > "$BIN_DIR/claude-muse" <<EOF
#!/usr/bin/env bash
export UCR_PROFILE=muse
exec "$PREFIX/bin/claude-runtime" "\$@"
EOF
cat > "$BIN_DIR/claude-deepseek-flash" <<EOF
#!/usr/bin/env bash
export UCR_PROFILE=deepseek-flash
exec "$PREFIX/bin/claude-runtime" "\$@"
EOF
cat > "$BIN_DIR/claude-deepseek-pro" <<EOF
#!/usr/bin/env bash
export UCR_PROFILE=deepseek-pro
exec "$PREFIX/bin/claude-runtime" "\$@"
EOF
cat > "$BIN_DIR/claude-doctor" <<EOF
#!/usr/bin/env bash
exec "$PREFIX/doctor.sh" "\$@"
EOF
chmod 0755 "$BIN_DIR"/claude-{runtime,muse,deepseek-flash,deepseek-pro,doctor}

say 'runtime files installed / runtime dosyaları kuruldu'
say 'configure secrets.env mode 600 / secrets.env dosyasını 600 izinle yapılandırın'
say 'Claude CLI binary installation is a separate verified gate / Claude CLI binary kurulumu ayrı doğrulama kapısıdır'
printf 'UCR_INSTALL_FOUNDATION_PASS / UCR_INSTALL_FOUNDATION_PASS\n'
