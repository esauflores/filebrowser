#!/usr/bin/env sh
set -e

DB_PATH="/database/filebrowser.db"
CONFIG_PATH="/config/settings.json"

# Defaults
FB_USERNAME="${FB_USERNAME:-admin}"
FB_PASSWORD="${FB_PASSWORD:-admin}"
FB_PORT="${FB_PORT:-8080}"

# Ensure config exists
if [ ! -f "$CONFIG_PATH" ]; then
    cp -a /defaults/settings.json "$CONFIG_PATH"
fi

# Initialize DB only on first run
if [ ! -f "$DB_PATH" ]; then
    echo "Initializing File Browser database..."

    filebrowser -d "$DB_PATH" config init
    filebrowser -d "$DB_PATH" users add "$FB_USERNAME" "$FB_PASSWORD" --perm.admin

    echo "Admin user created:"
    echo "  Username: $FB_USERNAME"
    echo "  Password: $FB_PASSWORD"
fi

echo "Starting File Browser on port $FB_PORT..."

exec filebrowser \
    -d "$DB_PATH" \
    --config "$CONFIG_PATH" \
    --port "$FB_PORT"
