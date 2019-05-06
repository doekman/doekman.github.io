---
layout: post
title:  A third way of putting AppleScript into git
date:   2019-05-06
---

There are currently two ways of putting AppleScript into git. First is just by adding the binary `.scpt`-files. You don't get much benefit from using git, but it works.

The _second way_ is to save your AppleScript source as text-files, and put these into git. You get advantages from git, but it is not as seamless as the first way.


Introducing osagitfilter
========================
Now you can combine those two ways by using the [osagitfilter utility][osagitfilter]. Technically, it's a [git filter][] that translates AppleScript's binary format into the text-representation which then will be used by git's internal workings.

See the [repository's readme][ogf-readme] for installation instructions. After that, you can put compiled script files, AppleScript applications and script bundles in git as if they where regular text-files. When you then clone this repository, the files are re-assembled bit-perfect.

Let me demonstrate this by an example. First create a git-repository:

	git init osagitfilter-demo
	cd osagitfilter-demo

Now create the AppleScript-file `my_script.scpt` in this folder with the following contents:

	display dialog "What's your name" default answer ""
	say "Hi there, " & text returned of result

Since we don't want to add a binary file to git, we first need to associate the `.scpt`-extension with the osagitfilter (you need to explicitly _opt-in_ every repository). This can be done by adding a line to the `.gitattributes`-file, connecting the `.scpt`-extension to the `osa` filter:

	echo "*.scpt filter=osa" >> .gitattributes

Now the files can be added to git:

	git add .gitattributes my_script.scpt
	git commit -m Initial

Now let's change the script by appending `& ", I like your name"` to the say command in the `my-script.scpt` file. Don't forget to save.

Now when you run `git diff`, you can see the changes you made as you would with text-files. You don't need to stick with the command-line: I can confirm it works with GitHub Desktop. It should also work with other GUI's, but I haven't tested this. 


Not only AppleScript
====================
The program is called [osa][]gitfilter, so you can also add JavaScript `.scpt`-files. There is also a feature that prevents you from accidently adding AppleScript-debugger files to git (a special file format used by the indispensible [Script Debugger](scriptdebugger)).

I hope osagitfilter will be useful tool. It will not completely replace the first two methods, but it's nice to have an alternative to them.

Let me know what you think [at this thread][as-forum-thread] on Late Night Software's AppleScript forum.


[git filter]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#filters_a
[osagitfilter]: https://github.com/doekman/osagitfilter/
[ogf-readme]: https://github.com/doekman/osagitfilter/blob/master/README.md
[osa]: https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptX/Concepts/osa.html "The Open Scripting Architecture (OSA) provides a standard and extensible mechanism for interapplication communication in OS X."
[scriptdebugger]: https://latenightsw.com
[as-forum-thread]: https://forum.latenightsw.com
