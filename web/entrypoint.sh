#!/usr/bin/env sh

poetry run uvicorn uwsgi:app --host 0.0.0.0 --port ${API_PORT}
