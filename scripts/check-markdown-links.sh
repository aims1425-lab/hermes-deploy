#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
status=0
fail_count=0

fail() {
  printf "\033[0;31mFAIL\033[0m local markdown link check: %s\n" "$1"
  status=1
  ((fail_count += 1))
}

is_external_link() {
  case "$1" in
    http://*|https://*|ftp://*|mailto:*|tel:*|file:*|data:*)
      return 0
      ;;
  esac
  return 1
}

trim() {
  printf '%s' "$1" | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//'
}

extract_links() {
  local file="$1"
  awk '{
    line=$0
    while (match(line, /\[[^]]+\]\(([^)]*)\)/, m)) {
      print NR "|" m[1]
      line = substr(line, RSTART + RLENGTH)
    }
  }' "$file"
}

resolve_target() {
  local source_file="$1"
  local raw_target="$2"
  local source_dir
  local path_only

  source_dir="$(dirname "$source_file")"
  path_only="${raw_target%%\?*}"
  path_only="${path_only%%#*}"

  if [[ "$path_only" == "" ]]; then
    printf "%s" "$source_file"
    return
  fi

  if [[ "$path_only" == /* ]]; then
    printf "%s/%s" "$repo_root" "${path_only#/}"
  else
    printf "%s/%s" "$source_dir" "$path_only"
  fi
}

for_file() {
  local file="$1"

  while IFS='|' read -r line_no raw_url; do
    raw_url="$(trim "$raw_url")"
    [[ -z "$raw_url" ]] && continue

    raw_url="${raw_url%% *}"
    if [[ "$raw_url" == \#* ]]; then
      continue
    fi

    if is_external_link "$raw_url"; then
      continue
    fi

    target="$(resolve_target "$file" "$raw_url")"
    if [[ ! -e "$target" ]]; then
      fail "broken local link in ${file}:${line_no} -> ${raw_url}"
    fi
  done < <(extract_links "$file")
}

while IFS= read -r -d '' markdown_file; do
  for_file "$markdown_file"
done < <(find "$repo_root" -type f -name "*.md" -not -path "*/.git/*" -print0)

if [ "$status" -ne 0 ]; then
  printf "\nLink check found %d broken local Markdown links.\n" "$fail_count"
  exit 1
fi

printf "Local markdown links look good.\n"
