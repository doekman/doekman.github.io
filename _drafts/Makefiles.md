---
layout: post
title:  In praise for makefiles
date:   2020-04-23
---

Make is perfect as an ad-hoc make system. I like:

* targets: they let you group tasks
* task dependencies: some tasks 
* default task: useful as _usage_ screen 
	- normally it's used as shortcut for the most common build

It enables composability, and specialized tools (UNIX philosophy)

clowncar: monolytic

same, but composed:

* make, targets:
	- markdown: markdown -> html converter in dotnet (or use existing tool)
	- static: copy static files: just use `cp`
	- clean: remove build folder, so the html of deleted markdown also gets deleted
	- all: depends on markdown, static
* no more skipping files (although, this is UNIX philosophy)

So the make system is composed of:

* make for organizing
* optionally (repository contained) tooling
	- if it's really succesful, you can create your own project for this, but now you're working on something else ;-)
* system and standard tooling like `cp` and `markdown`

This is actually an example of Architectual patterns. It's easy to see what goes where.

Consider these future extensions of:

* adding images, and need for generating thumbnails and/or multiple resolutions
* data (csv/json/xml) files, generating multiple files
* publishing the repository as an ebook
* inserting a table of content (TOC)

Easy to extend, especially for perpetual beginners in an ad-hoc system.


links
-----

https://til.secretgeek.net
https://www.phillipsj.net/posts/building-dotnet-core-apps-old-school-with-make/
https://www.phillipsj.net/posts/you-told-me-to-use-make-but-im-on-windows/
https://www.gnu.org/software/make/
https://sigpipe.macromates.com/2018/creating-a-faster-jekyll/

[ok-named]: https://github.com/secretGeek/ok-bash/issues/24


makefile examples
-----------------

https://github.com/doekman/postgres-with-trello/blob/master/makefile
https://github.com/robconery/dox/blob/master/Makefile
https://rob.conery.io/2018/07/18/working-smarter-not-harder-part-1/ "Generate makefile for standard projects"
https://github.com/fengsp/flask-session/blob/master/Makefile
