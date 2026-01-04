---
layout: post
title: "Installing Bash via Brew on MacOS"
date: 2026-01-04
author: Doeke Zanstra
category: ICT
---

MacOS comes with an ancient version of bash, due to licensing issues. You can install a modern version of bash with brew, but I broke my shell after updating bash.

What happened? I changed my default shell via de GUI (`System Settings > Users & Groups > Advanced options... (ctrl+option-click on your own name or avatar) > Login shell > Choose`).

If you do that, the path to specific version of bash will be stored. It even does that if you choose the path `/opt/homebrew/bin/bash` (which is a symbolic link to the latest version). So when you update, and start a new shell, you get the old version of the shell. And when brew cleaned it's cellar, the old version would have been deleted. This is when I noticed my shell was broken.

You can solve this problem in two ways. What I did: I added the path to the symbolic link to the approved list of shells. First I ran `sudo mate /etc/shells` (I still use `mate`, but you can use your favorite editor). After taht I added the line `/opt/homebrew/bin/bash` to the end of the file. And finally I saved it.

The new entry didn't show in System Settings, so I restarted it. After that, it showed up, so I could choose the symbolic linked version of bash from homebrew.

Another way might be `sudo chsh -s /opt/homebrew/bin/bash`, but I didn't try this one.
