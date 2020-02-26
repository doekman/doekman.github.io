---
layout: post
title:  "Bash and osascript (AppleScript)"
---

Reason
------
When working on my open-source project [osagitfilter][], I needed to access some Obj-C API's, and thought it would be nice and handy if this could be done via AppleScript (OK, you got me. I just didn't want to start binary XCode project).

However, I could not find some coherent documentation about the topic, so I'm trying to provide that here. This is all the result from trial and error, so if you find omissions or errors, please let me know.

Why
---
- handy GUI commands
- script applications
- easy access to Obj-C API's

Topics
------
Input: stdin, arguments, environment  
Output: stdout, stderr, environment


[osagitfilter]: https://github.com/doekman/osagitfilter/
[objc2as]: https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/AppendixA-AppleScriptObjCQuickTranslationGuide.html
[doshellcmd]: https://developer.apple.com/library/archive/technotes/tn2065/_index.html

bash-function: get_folder
-------------------------

	function get_folder {
		osascript <<END_OF_APPLESCRIPT
		try
			set def_loc to POSIX file "/Users/doeke/Nextcloud-Archipunt/"
			set res to choose folder with prompt "Kies de basis-map waarin alle lege mappen gemarkeerd moeten worden" default location def_loc
			get POSIX path of res
		on error number -128
			get "A"
		end
	END_OF_APPLESCRIPT
	}


get_env.sh
----------

	#!/usr/bin/env osascript
	use framework "Foundation"
	property NSProcessInfo : a reference to current application's NSProcessInfo
	set env to NSProcessInfo's processInfo()'s environment()
	get (env's objectForKey:"SHELL") as text
