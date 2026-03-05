# filebrowser

Web-based file browser to access and manage files via browser. Uses [File Browser](https://filebrowser.org).

## Quick start

1. Update the storage mapping in `docker-compose.yml` (bind mount or named volume):

	```yaml
	volumes:
	  # Bind mount (recommended for browsing a host folder)
	  - /absolute/path/to/folder:/srv
	  # OR named volume
	  - my-files:/srv
	```

2. (Optional) Create a `.env` file to override defaults:

	```env
	FB_PORT=8080
	FB_USERNAME=admin
	FB_PASSWORD=admin
	```

3. Start the service:

	```bash
	docker compose up -d --build
	```

4. Open the UI at `http://localhost:${FB_PORT}` (default: `http://localhost:8080`).

## Environment variables

| Variable      | Description                                                           |
| ------------- | --------------------------------------------------------------------- |
| `FB_PORT`     | Filebrowser server port inside the container (default: `8080`)        |
| `FB_USERNAME` | Initial admin username, used only on first database initialization    |
| `FB_PASSWORD` | Initial admin password, used only on first database initialization    |

## Persistence

- Application data is stored in the named volume `filebrowser-data` (`/database`).
- Configuration is stored in the named volume `filebrowser-config` (`/config`).
- Admin user creation is attempted on every startup.

## Notes

- If the configured admin user already exists, startup continues without failing.
- Default credentials are `admin` / `admin` when not overridden.
