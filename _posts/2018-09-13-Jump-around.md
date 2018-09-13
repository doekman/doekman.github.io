---
layout: post
title:  Jump around
date:   2018-09-13
tags:   [cli]
---

<style>code {white-space:nowrap;}</style>

There are more ways [to navigate the file system][nav] in _bash_ than I imagined when I still was using _cmd.exe_. Let me name some:

* `cd` navigates to the home folder. Like `cd /users/$(whoami)` or `cd "$HOME"` but shorter.
* `cd -` navigates to the previous directory. It's like the _zap-button_ on your television remote control!
* <code>cd ~/Doc<span title="HORIZONTAL TABULATION">␉</span></code> _tab-completion_ works like Visual Studio's intelli-sense, but without the dropdown and it's case sensitive. If there is one choice, it will complete it. If there is more, you need to press <abbr title="␉ or Horizontal Tab">tab</abbr> twice, and it will show a list.
* `pushd`/`popd`/`dirs` save/load/show a directory to/from the stack. Especially handy in complex scripts.


However, I noticed I was always navigating to not that many different number of folders. I thought, wouldn't it be handy if one could save/load folders to some kind of [dictionary][]. I did extensive research and couldn't find anything, so I created [go][]. It was great. Typing `go gh` performed `cd ~/prj/GitHub`. To save the current folder under the name _"here"_ would be performed by `go here .`. And `go` would show all the current stored definitions.

As I mentioned before, I performed thorough extensive research. I didn't take it lightly. However. Apperently, the subject sometimes needs time to sink in. As today I learned from [a guy I have known some time][gtd], that he created a tool called [markjump][]. This is basically what I made, only for _powershell_. But his work was inspired by [Jeroen Janssens'][jjanssen] _shell script_, from five years ago. And he's a Dutchie too! How could I have missed that? And his code is 1500% better!

To complete my story line: Half a year ago I ran into the [z-utility][z] (can't remember how), which has the description [jump][jump-wiki] [around][jump-song]. I was intrigued! I learnt descriptions of utilities are pretty important. And it turns out to be a pretty clever and helpful utility. It automatically remembers where you navigate to; no need to keep a list manually. And it will also keep _statistics_. 

It uses _regular expressions_ to find which folder you want to navigate to. And it's case-insensitive, so `z dow` will navigate to `~/Downloads`. No need to type a capital-D. When the regular expression matches multiple folders, it uses the statistics (how recent and how frequent) to decide where to navigate to.

I must say I was a bit hesitant to use it, because it seemed so... technical. In the beginning of the man-page it says something like _"Tracks your most used directories, based on 'frecency'.."_ But the _"jump around"_ reeled me in. I never used my own `go`-utility, and only just now looked back. Thanks [rupa][]!



[nav]: https://scriptingosx.com/2017/08/navigating-the-file-system/
[dictionary]: https://en.wikipedia.org/wiki/Associative_array "In computer science, an associative array, map, symbol table, or dictionary is an abstract data type composed of a collection of (key, value) pairs, such that each possible key appears at most once in the collection"
[go]: https://github.com/doekman/go
[gtd]: http://www.secretgeek.net/pp2018
[markjump]: https://github.com/secretGeek/markjump
[jjanssen]: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
[z]: https://github.com/rupa/z/
[jump-wiki]: https://en.wikipedia.org/wiki/Jump_Around
[jump-song]: https://www.youtube.com/watch?v=XhzpxjuwZy0
[rupa]: https://github.com/rupa

