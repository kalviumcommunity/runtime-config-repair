# runtime-config-repair

Intentionally broken DevOps Foundation Module 4 starter. No solved implementation or completed review answers are supplied. Diagnose and repair only the assessment tasks.

## Preparation

Fork or clone https://github.com/kalviumcommunity/runtime-config-repair before assessment. Fork ownership is not graded. Use free local Docker Engine/Compose, Git and POSIX shell (Linux/macOS or prepared WSL). Docker Desktop subject to its license; Linux Docker Engine is sufficient. Pull python:3.12-slim before assessment. Reserve exercise ports only. Preparation/download delays excluded. No cloud account, billing, registry login, real credentials, paid tools or Kubernetes needed.

## Allowed edits

runtime.env.example; Dockerfile (dummy ENV instruction only); run.sh (runtime token forwarding only); cloud-run.md; local ignored .env. Preserve all other source, routes, ports, fixtures and checks. No failure suppression or fabricated output. Existing run.sh tolerates absence of its old exercise container only; that cleanup is not an application-validation bypass.

## Required behaviour and commands

Copy runtime.env.example to ignored .env. The required initial runtime values are APP_MODE=production and LOG_LEVEL=INFO. Staging is supported for the second-environment test. APP_MODE is enforced by the app; LOG_LEVEL is checked by configuration inspection, not logging implementation. Correct both .env and the committed example; retain .env exclusion.

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

## Evidence and submission

Follow assessment's three tasks. One PDF, three labelled task sections, at least one real terminal screenshot per task, requested findings and cause/fix/result captions. Include complete corrected diff of permitted files once. Show original failures and final checks only as requested by each task. Grade only those tasks and evidence (6 + 7 + 7 = 20). Repository/fork URLs, fork ownership, branch names and submission commit hashes are not required or graded. Technical image IDs remain required where tasks ask for them. Standalone instructor evidence is valid under the same technical criteria. Written findings are manually assessed; local evidence does not prove Cloud Run deployment. No PR, video or ZIP. Cleanup only exercise containers; never expose real credentials.
