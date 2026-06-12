#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
status=0
removed_application_doc="$(printf '%s/%s%s%s.md' "docs" "CODEX" "_FOR_OSS" "_APPLICATION")"
removed_copy_phrase="ready""-to-copy OSS maintainer support application draft"

pass() { printf "\033[0;32mPASS\033[0m %s\n" "$1"; }
fail() {
  printf "\033[0;31mFAIL\033[0m %s\n" "$1"
  status=1
}

require_file() {
  local path="$1"
  if [ -s "$repo_root/$path" ]; then
    pass "$path exists"
  else
    fail "$path is missing or empty"
  fi
}

require_absent() {
  local path="$1"
  if [ ! -e "$repo_root/$path" ]; then
    pass "$path is absent"
  else
    fail "$path should not be committed"
  fi
}

require_text() {
  local path="$1"
  local pattern="$2"
  local label="$3"
  if grep -Eq "$pattern" "$repo_root/$path"; then
    pass "$label"
  else
    fail "$label"
  fi
}

require_no_text() {
  local pattern="$1"
  local label="$2"
  if rg -n "$pattern" "$repo_root" \
    --glob '!/.git/**' \
    --glob '!tests/smoke.sh' >/tmp/hermes-deploy-smoke-rg.log; then
    fail "$label"
    sed -n '1,20p' /tmp/hermes-deploy-smoke-rg.log
  else
    pass "$label"
  fi
}

printf "Running smoke tests...\n\n"

require_file "install.sh"
require_file "config.yaml"
require_file "docker-compose.yml"
require_file ".env.example"
require_file "docs/OSS_READINESS.md"
require_file ".github/workflows/ci.yml"
require_absent "$removed_application_doc"

if bash -n "$repo_root/install.sh"; then
  pass "install.sh syntax"
else
  fail "install.sh syntax"
fi

if bash -n "$repo_root/scripts/validate.sh"; then
  pass "scripts/validate.sh syntax"
else
  fail "scripts/validate.sh syntax"
fi

require_text ".env.example" '^OPENAI_API_KEY=sk-\.\.\.$' ".env.example uses placeholder OpenAI key"
require_text ".env.example" '^TELEGRAM_BOT_TOKEN=$' ".env.example keeps Telegram token empty"
require_text ".gitignore" '^\.env$' ".gitignore excludes local .env"
require_text "config.yaml" 'bot_token: "\$\{TELEGRAM_BOT_TOKEN\}"' "config.yaml reads Telegram token from environment"
require_text "docker-compose.yml" 'OPENAI_API_KEY=\$\{OPENAI_API_KEY\}' "docker compose reads OpenAI key from environment"
require_text "Makefile" '^test:' "Makefile exposes test target"
require_text ".github/workflows/ci.yml" 'make test' "CI runs smoke tests"
require_no_text "$removed_copy_phrase" "removed application artifact references are absent"

rm -f /tmp/hermes-deploy-smoke-rg.log

if [ "$status" -ne 0 ]; then
  printf "\nSmoke tests failed.\n"
  exit 1
fi

printf "\nSmoke tests complete.\n"
