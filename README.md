# worktree-upstream

A herdr plugin that links a new worktree to its remote branch.

herdr creates worktree branches from your current commit, so a branch that already exists on `origin` ends up as an unrelated local branch with no upstream. Git then reports it as unpublished.

## Install

```
herdr plugin install DaveBird99/herdr-worktree-upstream
```

Requires herdr 0.7.5+, `git`, and `jq`.

## What it does

On `worktree.created`, if `origin` has a branch with the same name, the plugin switches the worktree to it and sets the upstream. It does nothing when any of these hold:

- `origin` has no branch with that name
- the worktree has uncommitted changes
- the local branch has commits that are not in `origin/main`
