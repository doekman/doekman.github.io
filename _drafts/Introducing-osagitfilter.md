---
layout: post
title:  A third way of putting AppleScript into git
date:   2019-04-25
---

There are currently two ways of putting AppleScript into git. First is just putting the binary `.scpt`-files into git. You don't get much advantages of using git, but it works.

The _second way_ is to save your AppleScript source as text-files, and put these into git. You get advantages from git, but you get some extra work.


Introducing osagitfilter
========================
Now you can combine those two ways by using the [osagitfilter utility][osagitfilter]. Technically, it's a [git filter][] that translates AppleScript's binary format into the text-representation which then will be used within git's internal workings.

To use it, you'll need to [install the tool][ogf-readme]. After that, you can put _compiled script files_, _AppleScript applications_ and _script bundles_ in git via the regular add/commit commands. When you clone said repository in another location, the files are put back together as they where when you put them into git. With the added benefit of plain text source files!

Let me demonstrate this by an example. First create a git-repository:

	mkdir -p ~/Downloads/osagitfilter-demo
	cd ~/Downloads/osagitfilter-demo
	git init

Now create the AppleScript-file `my_script.scpt` init with the following contents:

	display dialog "What's your name" default answer ""
	say "Hi there, " & text returned of result

Since we don't want to add a binary file, we first need to associate the `.scpt`-extension with the osagitfilter. We do that, by adding a line to the `.gitattributes`-file, connecting the `.scpt`-extension to the `osa` filter:

	echo "*.scpt filter=osa" >> .gitattributes

Now the files can be added to git:

	git add .gitattributes my_script.scpt
	git commit -m "Initial 📜"

Now let's change the script by appending `& ", I like your name"` to the say command. Don't forget to save.

Now when you run `git diff`, you can see the changes you made as you would with text-files. You don't need to stick with the command-line: I can confirm it works with GitHub Desktop. It should also work with other GUI's, but I haven't tested this. 

The program is called **[osa][]**gitfilter, so you can also add JavaScript `.scpt`-files. There is also a feature that prevents you from accidently adding AppleScript-debugger files to git (a special file format used by the indispensible [Script Debugger](scriptdebugger)).

I hope osagitfilter will be useful tool. Let me know what you think: _find me on this topic_ (yet to be created) at Late Night Software's forum.


  [git filter]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#filters_a
  [osagitfilter]: https://github.com/doekman/osagitfilter/
  [ogf-readme]: https://github.com/doekman/osagitfilter/blob/master/README.md
  [osa]: https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptX/Concepts/osa.html "The Open Scripting Architecture (OSA) provides a standard and extensible mechanism for interapplication communication in OS X."
  [scriptdebugger]: https://latenightsw.com
