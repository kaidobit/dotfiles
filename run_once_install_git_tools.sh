#!/usr/bin/env bash
# 🛠 Install Git helper tools: meld and colordiff (cross-platform).

set -euo pipefail

install_pkg() {
    local pkg="$1"
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update -y && sudo apt-get install -y "$pkg"
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y "$pkg"
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm "$pkg"
    elif command -v brew >/dev/null 2>&1; then
        brew install "$pkg"
    else
        echo "❌ No supported package manager found — please install $pkg manually."
        exit 1
    fi
}

install_if_missing() {
    local cmd="$1"
    local pkg="$2"
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "🛠 Installing $pkg..."
        install_pkg "$pkg"
    else
        echo "✅ $pkg already installed."
    fi
}

# Install colordiff
install_if_missing "colordiff" "colordiff"

# Install meld
install_if_missing "meld" "meld"
