# runtime-config-repair

TicketDesk receives incorrect runtime settings and includes a dummy credential in image configuration. Repair runtime injection and demonstrate one image serving two environments.

## Prerequisites

Git, Docker Engine and POSIX shell (Linux/macOS or WSL with Docker integration). Compose v2 required for Compose commands; curl required for host HTTP checks. Docker must be running; internet access needed to download python:3.12-slim. Reserve documented host ports. Docker Desktop is subject to its license; Linux Docker Engine is sufficient. No cloud account, billing, registry login, real credentials, Kubernetes cluster or paid tools needed. Fork or clone this starter and run commands from repository root.

## Allowed edits

runtime.env.example; Dockerfile (dummy ENV instruction only); run.sh (runtime token forwarding only); cloud-run.md; local ignored .env. Preserve all other source, routes, ports, fixtures and checks. No failure suppression or fabricated output.

## Required behaviour and commands

Run `cp runtime.env.example .env` to create local ignored configuration. The required initial runtime values are APP_MODE=production and LOG_LEVEL=INFO. Staging is supported for the second-environment test. APP_MODE is enforced by the app; LOG_LEVEL is checked by configuration inspection, not logging implementation. Correct both .env and the committed example; retain .env exclusion.

Build tag ticketdesk:lab, then use sh run.sh. Task 1 captures the original startup error, fixes configuration only and recreates without rebuilding. Compare running image IDs before/after; inspect only APP_MODE and LOG_LEVEL, startup log, /health and /config at localhost:18083.

Task 2 removes the dummy credential instruction from Dockerfile and rebuilds. Extend run.sh only to pass API_TOKEN from the calling shell at runtime. Use a dummy value supplied locally; no real credentials. Keep REQUIRE_TOKEN enforced. Verify token presence as a Boolean only, and verify no API_TOKEN key in rebuilt image ENV. Do not print whole container environment or credential values. A removed, clearly labelled dummy placeholder in the Dockerfile diff is allowed; redact any real credential. Do not add dummy values to tracked runtime files.

Task 3 recreates production and staging from the same rebuilt image without a build between them. Compare running image IDs and show /config plus /health HTTP 200 in each mode. Complete four cloud-run.md lines: non-secret --set-env-vars mapping, --set-secrets with authorized identity, revision/readiness/log/service URL checks, and local-only limits. Cloud mapping is written only; execute no cloud commands.
```sh
docker build -t ticketdesk:lab .
sh run.sh
docker logs m4-q3
docker exec m4-q3 printenv APP_MODE LOG_LEVEL
curl -i http://localhost:18083/health
curl -i http://localhost:18083/config
git check-ignore .env
```
Use presence-only Python checks for API_TOKEN. Cleanup: docker rm -f m4-q3.
