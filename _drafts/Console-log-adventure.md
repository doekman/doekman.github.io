---
layout: post
title:  "A console.log() adventure; pimped"
date:   2016-01-16 20:00
categories: refactor,game
---

Over a year ago, my interwebfriend [secretGeek][] created a thing. I created a fork, and pimped it [into this thing][play-it] (*and copied some of his blog lines too*). 

I urge you to go and try it out before you read on. Unfortunately you'll need to be on a desktop computer, not a mobile phone.

<a href="https://rawgit.com/doekman/console-adventure/master/console.html"><img src="/images/console_best.png" style="border:8px solid #333;box-shadow:3px 3px 7px #888" title="a console.log() adventure."></a>

[Go there now][play-it].

In case you don't have a desktop computer anymore (woah, futuristic!), or have already tried it out, I'll give some spoilers and discussion now.

# Spoilers

Actually, I'll give some space before the spoilers. Scroll now for spoilers.

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

↓ spoilers ahead ↓

Here is [secretGeek's blog-entry][console-log]. When playing the game I had heaps of fun. 
Keeping a map on graph paper. Looking at all places. After some more playing, I started looking at the 
code, and wanted to tinker with it. So I forked it. At first, I was overthinking it.

Nothing happened. 

A year later, I remembered one time at work while being bored, I created the so called [mini-webventure][].
I didn't think too much back then, so why do it now?

So I just started. After running around in the forest, I got sick of entering parenthesis. And with 
[properties][] around in all browsers nowadays, there's no need for it.

Also, in a JavaScript game, I don't consider inspecting and modifying variables with JavaScript cheating.
So I prevented that with an [iife][] and some help of [strict mode][] (to eliminate global variables).

Multiple lines are now returned after entering a command, so they are formatted the same. And deaths are
a bit more dramatic now.

While having fun, I also implemented loading/saving. First I just saved the game state, but then I realized
this was another way to cheat, so now only the entered commands are saved. Then I realized, a demo-mode
is very easy to implement. Couldn't resist it, but enabling it is a secret.

I didn't want to change the map or story. Just wanted to share the fun I had, both playing and pimping the game.


[secretGeek]: https://twitter.com/secretGeek
[console-log]: http://www.secretgeek.net/console_log
[play-it]: https://rawgit.com/doekman/console-adventure/master/console.html
[mini-webventure]: http://zanstra.home.xs4all.nl/dds.arc/miniwebventure/index.htm 
                   "Originally hosted at http://www.worldaccess.nl/~mobitdz around 1997 I think"
[properties]: http://ejohn.org/blog/ecmascript-5-objects-and-properties/
[iife]: http://benalman.com/news/2010/11/immediately-invoked-function-expression/
[strict mode]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode
[dungeon]: http://www.secretgeek.net/dungeon_css

[dracula]: http://www.cosninix.com/dracula/ 
[space quest]: https://en.wikipedia.org/wiki/Space_Quest_I
[Map]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map