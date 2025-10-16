#!/usr/bin/env bash
# 🌀 Install zsh (cross-platform) and make it the default shell.

set -euo pipefail

install_pkg() {
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update -y && sudo apt-get install -y zsh
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y zsh
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm zsh
  elif command -v brew >/dev/null 2>&1; then
    brew install zsh
  else
    echo "❌ No supported package manager found — please install zsh manually."
    exit 1
  fi
}

if ! command -v zsh >/dev/null 2>&1; then
  echo "🌀 Installing zsh..."
  install_pkg
else
  echo "✅ zsh already installed."
fi

ZSH_PATH="$(command -v zsh)"
CURRENT_SHELL="$(getent passwd "$USER" | cut -d: -f7 || echo "$SHELL")"

if [[ "$CURRENT_SHELL" != "$ZSH_PATH" ]]; then
  echo "⚙️  Changing default shell to: $ZSH_PATH"
  if ! grep -q "$ZSH_PATH" /etc/shells; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
  fi
  chsh -s "$ZSH_PATH"
else
  echo "✅ Default shell already set to zsh."
fi
