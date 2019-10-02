---
layout: post
title:  To the Point
date:   2019-10-02
tags:   [cli]
---

Already two internet aeons ago, _secretGeek_ came up with some [handy bash-aliases][up-up-up] to ease navigating the folder hierarchy:

	alias ..='cd ..'
	alias ...='cd ../..'
	#and so on

Two dots plus an enter navigate you one directory down¹, three dots do that twice, and so on. However, a single dot doesn't go anywhere and gives you rudely some error message. No help there:

	$ .
	-bash: .: filename argument required
	.: usage: . filename [arguments]

Turns out the `.` is a [shell buildin command][period] that requires at least a filename as an argument. How rude.

Wouldn't it be handy and appropriate to print the current path when no argument is given? In that case, you could try adding the following to your `.profile` or equivalent startup file:

	function . { if [[ $# -eq 0 ]]; then pwd; else source "$@"; fi }

Now a single dot will be more polite and will show the current path. Used with arguments, it works like before. So you still can use it to source scripts, like [ok-bash][].


[up-up-up]: http://secretgeek.net/up_up_up
[period]: https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Builtins.html#Bourne-Shell-Builtins
[ok-bash]: https://github.com/secretGeek/ok-bash/


<p style="margin-top:4em">
	<small>
		¹) I've been told a hierarchy of folders/directories is a tree structure. When navigating into a folder, like <code>cd some_folder</code>, to my earnest knowledge one moves up. Branches mostly grow to the light where the sun is, which is up in the sky. So if you go back from said folder with <code>cd ..</code> one would move down. So secretGeek's aliases better be called <code>down_down_down</code> but maybe that has a less engaging ring to it.  Also: the base of the hierarchy —one could go there with <code>cd /</code>— is called the root, which is a kind of odd, because the root is as branched as the part of the tree that grows in the air. And at the file system, it's only one place! Anyways, the proposed function neither goes up nor down, so at least we have no confusion there.
	</small>
</p>
