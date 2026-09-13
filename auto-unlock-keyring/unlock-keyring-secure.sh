#!/bin/bash

# Define your user and UID (1000 is the most common)
TARGET_USER="adityaranjansamal"
USER_UID=1000
SECRET_FILE="/etc/keyring_secret"

# 1. Read the password from the locked-down file
# Only root can run this script, and only root can read that file.
if [ -f "$SECRET_FILE" ]; then
    PASS=$(cat "$SECRET_FILE")
else
    echo "Keyring secret file not found!"
    exit 1
fi

# 2. Inject into the user's keyring daemon
if [ -n "$PASS" ]; then
    runuser -u "$TARGET_USER" -- env XDG_RUNTIME_DIR="/run/user/$USER_UID" \
    sh -c "echo -n '$PASS' | gnome-keyring-daemon --unlock"
fi
