#!/usr/bin/env bash
set -euo pipefail

# Hermes Deploy - Automated Production Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/aims1425-lab/hermes-deploy/main/install.sh | bash

REPO="aims1425-lab/hermes-deploy"
BRANCH="main"
HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"

echo "🚀 Hermes Deploy - Production Installer"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
info() { echo -e "${GREEN}✅${NC} $1"; }
warn() { echo -e "${YELLOW}⚠️${NC} $1"; }
err() { echo -e "${RED}❌${NC} $1"; }

# Check OS
OS="$(uname -s)"
case "$OS" in
  Linux) info "OS: Linux $(uname -m)" ;;
  Darwin) info "OS: macOS $(uname -m)" ;;
  *) err "Unsupported OS: $OS"; exit 1 ;;
esac

# Check Python
if ! command -v python3 &>/dev/null; then
  err "Python 3 not found. Install it first."
  exit 1
fi
info "Python $(python3 --version)"

# Install Hermes
if command -v hermes &>/dev/null; then
  info "Hermes already installed ($(hermes --version 2>/dev/null || echo '?')), updating..."
  pip3 install --upgrade hermes-agent --quiet 2>/dev/null || pip3 install hermes-agent --quiet
else
  info "Installing Hermes Agent..."
  pip3 install hermes-agent --quiet
fi

# Verify
if ! command -v hermes &>/dev/null; then
  # Try in PATH
  export PATH="$HOME/.local/bin:$PATH"
  if ! command -v hermes &>/dev/null; then
    err "Hermes install failed. Check pip3 logs."
    exit 1
  fi
fi
info "Hermes $(hermes --version 2>/dev/null || echo 'installed')"

# Create directories
mkdir -p "$HERMES_HOME/config" "$HERMES_HOME/skills" "$HERMES_HOME/cron/output"

# Pull production config
CONFIG_URL="https://raw.githubusercontent.com/$REPO/$BRANCH/config.yaml"
if curl -fsSL "$CONFIG_URL" -o /tmp/hermes-config.yaml 2>/dev/null; then
  if [ -f "$HERMES_HOME/config.yaml" ]; then
    cp "$HERMES_HOME/config.yaml" "$HERMES_HOME/config.yaml.bak"
    info "Backed up existing config to config.yaml.bak"
  fi
  cp /tmp/hermes-config.yaml "$HERMES_HOME/config.yaml"
  info "Production config downloaded"
else
  warn "Could not download production config, using defaults"
fi

# Setup systemd service (Linux only)
if [ "$OS" = "Linux" ] && [ -d /etc/systemd/user ]; then
  cat > /tmp/hermes-gateway.service << 'SERVICE'
[Unit]
Description=Hermes Agent Gateway
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=%h/.local/bin/hermes gateway run
Restart=always
RestartSec=10
Environment=HERMES_HOME=%h/.hermes

[Install]
WantedBy=default.target
SERVICE

  mkdir -p "$HOME/.config/systemd/user"
  cp /tmp/hermes-gateway.service "$HOME/.config/systemd/user/hermes-gateway.service"
  systemctl --user daemon-reload 2>/dev/null || true
  info "Systemd service created (enable: systemctl --user enable hermes-gateway)"
fi

# Done
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Hermes Deploy installed!"
echo ""
echo "Next steps:"
echo "  1. Configure provider:  hermes model"
echo "  2. Edit config:         hermes config edit"
echo "  3. Start chatting:      hermes chat"
echo "  4. Production mode:     hermes gateway run"
echo ""
echo "📖 Full guide: https://github.com/$REPO"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
