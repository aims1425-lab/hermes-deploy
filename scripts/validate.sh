#!/usr/bin/env bash
set -euo pipefail

status=0

pass() { printf "\033[0;32mPASS\033[0m %s\n" "$1"; }
warn() { printf "\033[0;33mWARN\033[0m %s\n" "$1"; }
fail() { printf "\033[0;31mFAIL\033[0m %s\n" "$1"; status=1; }

printf "Running repository validation...\n\n"

if bash -n install.sh; then
  pass "install.sh syntax"
else
  fail "install.sh syntax check failed"
fi

if bash -n scripts/validate.sh; then
  pass "scripts/validate.sh syntax"
else
  fail "scripts/validate.sh syntax check failed"
fi

if command -v shellcheck >/dev/null 2>&1; then
  if shellcheck install.sh scripts/validate.sh; then
    pass "shellcheck"
  else
    fail "shellcheck found issues"
  fi
else
  warn "shellcheck not installed; skipped"
fi

if command -v yq >/dev/null 2>&1; then
  if yq eval '.' config.yaml >/dev/null && yq eval '.' docker-compose.yml >/dev/null; then
    pass "yq parse for config.yaml and docker-compose.yml"
  else
    fail "yq validation failed for config.yaml or docker-compose.yml"
  fi
else
  warn "yq not installed; skipped YAML parse checks"
fi

if command -v docker >/dev/null 2>&1; then
  if docker compose version >/dev/null 2>&1; then
    if docker compose -f docker-compose.yml config >/dev/null; then
      pass "docker compose config"
    else
      fail "docker compose config check failed"
    fi
  else
    warn "docker compose not available; skipped compose config check"
  fi
else
  warn "docker not installed; skipped compose check"
fi

if [ "$status" -ne 0 ]; then
  printf "\nValidation failed. Please fix the issues above.\n"
  exit 1
fi

printf "\nValidation complete.\n"
