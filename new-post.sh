#!/usr/bin/env bash
# Unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# https://bigmachine.io/productions/imposter-video/hands-on-creating-a-useful-shell-script
# a Jekyll post creator, which creates a new file, adds frontmatter,
# and opens the editor and starts Jekyll

if [[ $# -lt 1 ]]; then
	>&2 echo "Usage: $(basename "$0") POST_TITLE"
	exit 1
fi

JEKYLL_ROOT="$(dirname "$0")"
JEKYLL_POSTS="$JEKYLL_ROOT/_posts"
TITLE="$@"
DATE="$(date +%Y-%m-%d)"
NAME="$(id -F)"
SLUGIFIED="$(echo -n "$TITLE" | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr '[:upper:]' '[:lower:]')"
NEW_POST_FILE=$JEKYLL_POSTS/$DATE-$SLUGIFIED.md

cat <<frontmatter > "$NEW_POST_FILE"
---
layout: post
title: "$TITLE"
date: $DATE
author: $NAME
category: ICT
---

frontmatter

echo "New post created, opening in Textmate"
mate --line "8" "$NEW_POST_FILE"
