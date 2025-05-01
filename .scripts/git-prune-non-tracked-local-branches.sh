#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=false

if [[ $# -eq 1 && $1 == "--dry-run" ]]; then
  DRY_RUN=true
elif [[ $# -gt 0 ]]; then
  echo "Unknown option: $1"
  exit 1
fi

git fetch --prune

branches_to_delete=$(git branch -vv | grep ': gone]' | grep -v "\*" | awk '{ print $1; }')

if [ -n "$branches_to_delete" ]; then
  if [ "$DRY_RUN" = true ]; then
    echo "Branches to delete (dry run):"
    echo "$branches_to_delete"
  else
    echo "$branches_to_delete" | xargs --no-run-if-empty git branch -d
  fi
else
  echo "No non-tracked local branches to prune."
fi