#!/usr/bin/env sh
set -e
printf '{"region": "usa"}\n' > /data/settings.json
cd /opt/app
exec /opt/venv/bin/python -m server --data-dir /data
