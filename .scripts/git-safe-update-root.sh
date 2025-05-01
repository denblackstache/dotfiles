#!/usr/bin/env bash
set -euo pipefail

safe-update-root() {
  local branch
  branch=$(git for-each-ref --format="%(refname:short)" refs/heads/{main,master} | head -n1)

  if [[ -z "$branch" ]]; then
    echo "❌ No local 'main' or 'master' branch found."
    return 1
  fi

  echo "Fetching updates for $branch from origin..."
  git fetch origin "$branch"

  if ! git merge-base --is-ancestor "$branch" "origin/$branch"; then
    echo "⚠️ $branch has diverged from origin/$branch. Manual resolution needed."
    return 1
  fi

  echo "Updating local $branch to match origin/$branch..."
  git update-ref "refs/heads/$branch" "origin/$branch"

  echo "$branch has been successfully updated to match origin/$branch."
}

safe-update-root
