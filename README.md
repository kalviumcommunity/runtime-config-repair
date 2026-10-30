# runtime-config-repair

Intentionally broken DevOps Foundation Module 4 starter. Only documented faults and incomplete review lines require repair. Read assessment before editing.

## Preparation

Fork https://github.com/kalviumcommunity/runtime-config-repair, clone YOUR fork and create fix/module4 branch. Free local Docker Engine/Compose, Git, terminal and PDF export only. Docker Desktop subject to its license; free Docker Engine on Linux is sufficient. No cloud account, billing, registry login, tokens, paid tools or Kubernetes cluster. Pull python:3.12-slim  before assessment. Host ports 18081-18084 and 19082 must be free. POSIX shell (Linux/macOS or prepared WSL); preparation and image downloads outside timer.

## Allowed edits

runtime.env.example, Dockerfile (dummy ENV line only), run.sh (runtime token injection only), cloud-run.md; local ignored .env. Keep routes, ports, application behaviour, fixtures and baseline unchanged except explicitly permitted temporary cache comment. Capture original failure before each repair. No bypasses or fabricated evidence.

## Required behaviour and commands

Copy runtime.env.example to ignored .env. APP_MODE must be production (staging is also supported for second validation); LOG_LEVEL must be INFO. App reports mode via /config; LOG_LEVEL is configuration inspection only. Task1 corrects these two values in .env and runtime.env.example, recreates same image, verifies logs and printenv APP_MODE LOG_LEVEL. Do not display whole printenv or credential values.

Task2 remove dummy ENV API_TOKEN from Dockerfile, rebuild, inject API_TOKEN from shell via -e API_TOKEN in run.sh. Use export API_TOKEN=DEMO_RUNTIME_ONLY (dummy, not real credential). Verify presence only with docker exec m4-q3 python -c "import os; print('TOKEN_PRESENT='+str(bool(os.getenv('API_TOKEN'))))". Verify image config has no API_TOKEN key without printing any values. Existing .gitignore already excludes .env; keep it. Do not weaken REQUIRE_TOKEN.

Task3 run production then staging with same image ID and show /config changes, /health stays 200. Complete four cloud-run.md lines mapping --set-env-vars, --set-secrets, revision/log/URL checks and honest local-only scope. No Secret Manager or cloud calls. No real secrets.

## Evidence and submission

One PDF, three labelled task sections, fork/branch URL and final commit hash. Show initial failures, actual diagnosis commands, complete corrected diff, successful checks and requested written lines. At least one real screenshot per task. Commit/push fixes to fork. No PR/video/ZIP. Written answers human-graded; static configuration alone is not runtime proof. Keep .env untracked. Wait for startup log/health state, not arbitrary immediate curl. Do not remove unrelated containers. Cleanup exercise containers only.
