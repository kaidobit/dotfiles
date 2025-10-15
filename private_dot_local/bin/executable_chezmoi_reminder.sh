#!/usr/bin/env bash
# 🪶 Chezmoi sync reminder
# Warns you if there are unapplied chezmoi changes (once per day, per host)

# Colors
YELLOW="\033[33m"
RESET="\033[0m"

# Interval (1 day = 86400 seconds)
REMINDER_INTERVAL=$((24 * 60 * 60))

# Host identifier (use hostname)
HOSTNAME_SHORT=$(hostname -s 2>/dev/null || echo "unknown")

# Per-host reminder file path
CHEZMOI_REMINDER_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/chezmoi_reminder_${HOSTNAME_SHORT}"

# Only run if chezmoi exists
if command -v chezmoi >/dev/null 2>&1; then
  now=$(date +%s)

  # Determine last reminder time (0 if missing)
  if [ -f "$CHEZMOI_REMINDER_FILE" ]; then
    last_reminder=$(date -r "$CHEZMOI_REMINDER_FILE" +%s 2>/dev/null || echo 0)
  else
    last_reminder=0
  fi

  # Only check once per interval
  if (( now - last_reminder > REMINDER_INTERVAL )); then
    if ! chezmoi diff --quiet 2>/dev/null; then
      echo -e "${YELLOW}⚠️  chezmoi changes detected on ${HOSTNAME_SHORT}!${RESET}"
      echo "Run: chezmoi diff   # to preview changes"
      echo "Run: chezmoi apply  # to sync your system"
      mkdir -p "$(dirname "$CHEZMOI_REMINDER_FILE")"
      touch "$CHEZMOI_REMINDER_FILE"
    fi
  fi
fi
