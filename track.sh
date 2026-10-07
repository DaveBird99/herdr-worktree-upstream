#!/usr/bin/env bash
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:$PATH"

path=$(jq -r '.data.worktree.path // empty' <<<"$HERDR_PLUGIN_EVENT_JSON")
branch=$(jq -r '.data.worktree.branch // empty' <<<"$HERDR_PLUGIN_EVENT_JSON")

[ -n "$path" ] && [ -n "$branch" ] || exit 0
cd "$path" || exit 0

git fetch -q origin "$branch" 2>/dev/null || exit 0
git merge-base --is-ancestor HEAD origin/main || exit 0
[ -z "$(git status --porcelain)" ] || exit 0

git switch -q -C "$branch" --track "origin/$branch"
