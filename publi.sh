#!/usr/bin/env bash
# Unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
jekyll_source="$(pwd)"
jekyll_target="../$(basename "$jekyll_source")__web-stek"
jekyll_build="$jekyll_target/docs"
if [[ "${1:-}" == "--dry-run" ]]; then
	dry_run=1
	echo "DRY RUN: script will run without side effects to index or branches"
else
	dry_run=0
fi

# Using worktree, see: https://social.jvns.ca/@b0rk/112610499243294436

# Check publication destination
if [[ ! -d "$jekyll_target" ]]; then
	echo "Checking out 'web-stek' branch as worktree"
	git worktree add "$jekyll_target" "web-stek"
fi

cd "$jekyll_build"
if [[ "$(git status --porcelain=v1)" ]]; then
	echo "The jekyll-build folder is dirty; aborting..."
	exit 1
fi

if [[ "$(git branch --show-current)" != "web-stek" ]]; then
	echo "The jekyll-build folder has checked out the wrong branch..."
	exit 1
fi

# https://stackoverflow.com/a/56069356/56
if [[ "$(git rev-parse --git-dir)" == "$(git rev-parse --git-common-dir)" ]]; then
	echo "The jekyll-build folder doesn't appear to be a valid workingtree"
	exit 1
fi

git pull
if [[ "$(git status --porcelain=v1)" ]]; then
	echo "The jekyll-build folder is dirty after pulling; aborting..."
	exit 1
fi

# Transform
cd "$jekyll_source"
jekyll build --destination "$jekyll_build"

# Now push the publication destination
cd "$jekyll_build"
touch ".nojekyll" #always regenerate

if [[ "$(git status --porcelain=v1)" ]]; then
	if [[ "$dry_run" == "0" ]]; then
		git add *
		# CHECK: some files are not added automatically
		git commit -m "Publi.sh from $(hostname -s)"
		git push
	else
		echo "DRY RUN: git add *"
		echo "DRY RUN: git commit -m \"Publi.sh from $(hostname -s)\""
		echo "DRY RUN: git push"
	fi
	echo "Done publi.shing."
else
	echo "Nothing to publi.sh..."
fi
