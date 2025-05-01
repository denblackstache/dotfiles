#!/usr/bin/env bash
set -euo pipefail

command -v gh >/dev/null 2>&1 || { echo >&2 "GitHub CLI (gh) required. Install: https://cli.github.com"; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "Please authenticate: gh auth login"; exit 1; }
git_branch=$(git branch --show-current)
current_folder=$(basename "$PWD")
osascript -e "display notification \"Starting to watch $git_branch in $current_folder\" with title \"GitHub status watcher spawned\" sound name \"default\""

sleep 60
pr_status=$(gh pr checks)

while true; do
    if ! echo "$pr_status" | grep -qE 'pending|in_progress'; then
        if echo "$pr_status" | grep -q 'fail'; then
            title="PR Checks Failed"
            msg="❌ Some checks failed "
        else
            title="PR Checks Passed"
            msg="✅ All checks passed successfully "
        fi

        osascript -e "display notification \"$msg for $git_branch in $current_folder\" with title \"$title\" sound name \"default\""
        echo "$msg"
        exit 0
    fi

    sleep 30
    pr_status=$(gh pr checks)
done
