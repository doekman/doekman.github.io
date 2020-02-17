---
layout: post
title:  "ok-bash and Python on macOS"
date:   2020-02-17
---

Development on [Python 2 has been stopped][sunset], and the default availability of Python on macOS [will be deprecated][noscript] anywhere in the nearby future. Last week, [Scripting OS X][wp] wrote about how to deal with this from an admin-perspective.

Here I would like to explain how we deal with this from the perspective of a small but very handy tool called [ok-bash][]. This nifty tool helps you free brainspace by creating `.ok`-folder profiles for bash. You should check it out: it really makes you smarter and more efficient.

Since the default availability of Python on macOS is threatened, this article is written from a macOS point of view. But the tool itself works on all systems that run _bash_. 

The tool is exposed via a bash-function, with a Python-backend helping with more complex tasks like syntax highlighting and other formatting. We need a bash-frontend, so the tool can work in the current shell environment. 

We want to keep installation of _ok-bash_ simple, so users can just clone the git-repository and initialize it via the shell startup file.

Since there are so many ways to manage Python, we decided to resolve the used python-binary that's within the current `PATH`. This is termined via the command `which python3 || which python`, so Python 3 is used when available (the Python-backend works both in versions 2 and 3). Also, when only Python 2 is available (or if Python 3 is symlinked to `python`), ok-bash still works.

It's also possible to manually override the path to Python, by setting an environment variable.

In the future, ensuring Python's availability can be done via a [homebrew recipe][py_brew]. An extra advantage of homebrew is it supports the use of virtual environments.


[sunset]: https://www.python.org/doc/sunset-python-2/
[noscript]: https://developer.apple.com/documentation/macos_release_notes/macos_catalina_10_15_release_notes#3318257
[wp]: https://scriptingosx.com/2020/02/wrangling-pythons/
[ok-bash]: https://github.com/secretGeek/ok-bash
[brew]: https://brew.sh
[py3]: https://www.python.org/downloads/
[py_brew]: https://docs.brew.sh/Homebrew-and-Python
[acceptable]: https://docs.brew.sh/Acceptable-Formulae#niche-or-self-submitted-stuff
