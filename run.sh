#!/bin/sh
set -eu
docker rm -f m4-q3 >/dev/null 2>&1 || true
docker run -d --name m4-q3 --env-file .env -e REQUIRE_TOKEN=1 -p 18083:8080 ticketdesk:lab
