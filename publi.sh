#!/usr/bin/env bash
# Unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
jekyll_source="$(pwd)"

# Check publication destination
jekyll_build="${1:-$HOME/prj/Websites/doekman.github.io__web-stek/docs}"
if [[ ! -d "$jekyll_build" ]]; then
	echo "The jekyll-build folder is not found ($jekyll_build)"
	exit 1
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
touch "$jekyll_build/.nojekyll" #always regenerate

if [[ "$(git status --porcelain=v1)" ]]; then
	git add *
	# CHECK: some files are not added automatically
	git commit -m "Publi.sh from $(hostname -s)"
	git push
	echo "Done publi.shing."
else
	echo "Nothing to publi.sh..."
fi
