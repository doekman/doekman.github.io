---
layout: post
title: "Transfer git Changes With a Pasteboard-Workflow"
date: 2024-08-01
author: Doeke Zanstra
category: ICT
---

Sometimes you want to transfer changes you made to a source tree from one computer to the other. The source tree on both computers are managed by _git_. One reason to do this, is because you tried something on your laptop. But you changed your mind, and want to work on a desktop computer with a big screen and real keyboard. And you don't want to re-type everything.

Another reason might be, because you debugged a problem on a production machine (I never do this, of course). The production machine only has readonly access to git. You want to secure these changes exactly, because they work.

The commands are pretty simple, but I keep forgetting them. The commands use the diff format. If possible, I try not to create temporary files, because often they leave a mess. If the __source machine__ is on MacOS, I use this command to secure patch:

	$ git --no-pager diff | pbcopy

When on _Linux_ via _ssh_ in a _Terminal.app_ window, I copy by hand:

	$ git --no-pager diff
	# Press cmd+A to select output from last command, and press cmd+C to copy

With help of the universal clipboard, I can paste this on the __target machine__. But before I do that, I first check the status of the target repository:

	# Checking if the index is clean, and we are on the right branch
	$ git status
	# Now we can apply the patch
	$ pbpaste | git apply -

Now I can review and commit the changes, and push the changes to our origin. Normally I would use GitHub Desktop for this, because I like working with GUI's for this kind of work. 

After pushing, we have to cleanup things on the __source machine__. With older git-versions, you didn't need to reset the working folder. But since I don't know when this is necessary:

	# Undo all the changes we secured in previous steps
	$ git reset --hard
	# Now get the changes 
	$ git pull

Finally you might want to restart any processes that need restarting.

You can of course use temporary files. [Files][pb_f1] [are][pb_f2] [more][pb_f3] [reliable][pb_f4] [anyways][pb_f5].

[pb_f1]: https://appleinsider.com/inside/macos/tips/how-to-fix-universal-clipboard-problems-on-macos
[pb_f2]: https://discussions.apple.com/thread/7913125
[pb_f3]: https://beebom.com/fix-universal-clipboard-not-working-iphone-mac/
[pb_f4]: https://www.idownloadblog.com/2022/06/30/how-to-fix-universal-clipboard-not-working-on-iphone-ipad-mac/
[pb_f5]: https://www.igeeksblog.com/universal-clipboard-not-working-between-mac-and-iphone/
