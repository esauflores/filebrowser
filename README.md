# filebrowser

Web-based file browser to access and manage files via browser. Uses [FileBrowser](https://filebrowser.xyz).

## Environment Variables

| Variable    | Description                             |
| ----------- | --------------------------------------- |
| `FILES_DIR` | Host path to expose in the browser      |
| `PORT`      | Port to expose the UI (default: `8080`) |

## Standalone usage

```bash
cp .env.example .env
docker compose up -d
```

Access at `http://localhost:${PORT}`. Default credentials: `admin` / `admin`.
