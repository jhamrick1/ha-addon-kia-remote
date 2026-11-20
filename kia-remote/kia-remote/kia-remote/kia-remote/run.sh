#!/usr/bin/env sh
set -e
cd /opt/app
exec /opt/venv/bin/python -m server --demo --data-dir /data
