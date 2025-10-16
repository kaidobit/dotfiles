#!/usr/bin/env bash
# ⚙️ Install oh-my-zsh, themes, and plugins

set -euo pipefail

OMZ_DIR="$HOME/.oh-my-zsh"
CUSTOM_DIR="$OMZ_DIR/custom"

# --- install oh-my-zsh ---
if [[ ! -d "$OMZ_DIR" ]]; then
  echo "📦 Installing oh-my-zsh..."
  git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$OMZ_DIR"
else
  echo "✅ oh-my-zsh already installed."
fi

# --- install plugins ---
mkdir -p "$CUSTOM_DIR/plugins"

if [[ ! -d "$CUSTOM_DIR/plugins/zsh-autosuggestions" ]]; then
  echo "⚙️ Installing zsh-autosuggestions..."
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git \
    "$CUSTOM_DIR/custom/zsh-autosuggestions"
else
  echo "✅ zsh-autosuggestions already installed."
fi

if [[ ! -d "$CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]]; then
  echo "⚙️ Installing zsh-syntax-highlighting..."
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$CUSTOM_DIR/custom/zsh-syntax-highlighting"
else
  echo "✅ zsh-syntax-highlighting already installed."
fi

if [[ ! -d "$CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]]; then
  echo "⚙️ Installing zsh-bat..."
  git clone https://github.com/fdellwing/zsh-bat.git \
    "$CUSTOM_DIR/custom/zsh-syntax-highlighting"
else
  echo "✅ zsh-syntax-highlighting already installed."
fi