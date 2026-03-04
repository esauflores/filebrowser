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

# Initialize database only if it doesn't exist
if [ ! -f "$DB_PATH" ]; then
    echo "Initializing FileBrowser database..."

    filebrowser -d "$DB_PATH" users add \
        "$FB_USERNAME" \
        "$FB_PASSWORD" \
        --perm.admin

    echo "Admin user created:"
    echo "  Username: $FB_USERNAME"
    echo "  Password: $FB_PASSWORD"
fi

# Start FileBrowser
exec filebrowser -d "$DB_PATH" --config "$CONFIG_PATH"
