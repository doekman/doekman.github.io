---
layout: post
title:  A third way of putting AppleScript into git
date:   2019-04-25
---

There are currently two ways of putting AppleScript into git. AppleScript-files (with the extension `.scpt`) are not text-files. So if you just add them  to git, you standard don't get nice visual diff's. And on GitHub.com or BitBucket.org you don't get a view of nicely highlighted source-code. And finally, sometimes AppleScript files get corrupted.

That get's me to the _second way_ of putting AppleScript into git: you can save AppleScript-files as text with the `.applescript` extension. With this option you can use git in the usual way. However, when you open the file, you need to hit the compile button to get syntax high lighting. And when you want to create an application or script bundle, you need some kind of build-script. Also: when you use commands like `path to resource`, you'll might need to distinguish between the code running as a package or not.


Introducing osagitfilter
------------------------
I've created a utility [called osagitfilter][osagitfilter] that addresses these issues. Technically, it's a [git filter][] that translates AppleScript's binary format into the text-representation which then will be used within git's internal workings.

To use it, you'll need to install the tool, and register it with git ([detailed instructions][ogf-readme]). After that, you can put compiled script files, applications and script bundles in git via the regular add/commit commands. When you clone said repository in another location, the files are put back together as they where when you put them into git. With the added benefit of plain text source files!

The program is called _**osa**gitfilter_, because it can put any [OSA][]-language with it into git. Since the minimum requirement of osagitfilter is macOS 10.10 Yosemite, this means you can choose between AppleScript and JavaScript. There is also a feature that prevents you from accidently adding AppleScript-debugger (a special file format used by the indispensible [Script Debugger](scriptdebugger)) files to git.

For me the creation of this too was a learning experience about AppleScript, shell-scripting and creating an open-source project. I hope osagitfilter will be useful tool for at least some. If you have any questions or remarks: _find me on this topic_ (yet to be created) at Late Night Software's forum.


  [git filter]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#filters_a
  [osagitfilter]: https://github.com/doekman/osagitfilter/
  [ogf-readme]: https://github.com/doekman/osagitfilter/blob/master/README.md
  [OSA]: https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptX/Concepts/osa.html
  [scriptdebugger]: https://latenightsw.com
