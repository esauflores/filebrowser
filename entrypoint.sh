#!/usr/bin/env sh
set -e

DB_PATH="/database/filebrowser.db"
CONFIG_PATH="/config/settings.json"

# Ensure config exists (same logic as upstream)
if [ ! -f "$CONFIG_PATH" ]; then
    cp -a /defaults/settings.json "$CONFIG_PATH"
fi

# Default credentials if not provided
FB_USERNAME="${FB_USERNAME:-admin}"
FB_PASSWORD="${FB_PASSWORD:-admin}"

# Always try to ensure admin user exists
echo "Ensuring admin user exists..."
if filebrowser -d "$DB_PATH" users add \
    "$FB_USERNAME" \
    "$FB_PASSWORD" \
    --perm.admin; then
    echo "Admin user created:"
    echo "  Username: $FB_USERNAME"
    echo "  Password: $FB_PASSWORD"
else
    echo "Admin user already exists or could not be created; continuing startup."
fi

# Start Filebrowser
exec filebrowser -d "$DB_PATH" --config "$CONFIG_PATH"
