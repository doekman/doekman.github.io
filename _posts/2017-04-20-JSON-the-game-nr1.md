---
layout: post
title:  "JSON, the game #1: Bootstrapping it"
date:   2017-04-30
---

Around a year ago, I had the idea to create some nerdy JSON-game. I had good fun thinking about some concepts, made some notes, and that was about it. Until now that is. To keep me focussed, I will keep a journal of the creation, and you're reading the first part.

I got the ideas from series like the Brent Simmons's [Vesper Sync Diary][vesper-diary] and Jon Skeet's [Reimplementing Linq to Objects][linq-diary]. I found them enjoyable; a bit of a nerdy soap opera. And now is the time for me to get off my comfy sofa and produce some soap of my own.

The idea of the game: [JSON][json] tokens are coming in, and you need to place them correctly. The initial form of the game will be Tetris-like with your head on your right shoulder: the tokens come in from the right and go to the left (alternative gravity you might think). However, this form might change from level to level (I'm thinking of the partial JSON document as a starship, crashing into JSON stars/tokens as it cruises through the JSON universe).

The first step is to create some user interface mockup. A guy gotta start somewhere. My weapon of choice is HTML/CSS. At the top we have a dashboard providing some game details. Unformatted JSON will do for now. The playing field (where the partial JSON is) will have a fixed width, while the height might grow during gameplay when tokens are inserted between lines. 

<html><center style="margin-bottom:1em"><img src="{{site.baseurl}}/images/json-html-mock.png" alt="HTML/CSS mock" title="HTML/CSS mock: the 'ue' token will go from the right to the left"></center></html>


Positioning is done with the `em` and `ch` CSS units with a position `relative`/`absolute` container-combo. One little problem: `em` is font-height, not line-height. And a line-height of 100% just doesn't look right. And there is no such thing as a line-height unit. ([Or is there?][lh-unit]) However, this is easy fixable with a calculation.

Also some color-coding needs to be added, so we can identify unbalanced grouping tokens, missing seperators, incomplete tokens and downright errors. That's why I'm not using a `pre`-element. I don't have a definite idea about gameplay, but some ideas come to mind. An error could result in a lost "life" and vanish if you have at least one life left. Or an error could be cleared with the incoming JSON token `\b`.

This is not all markup we need (we will need a dialog-box, for the start and end of a level), but it will do for now. I put the source-code on GitHub, and every installment will point to a commit so you can see how this game comes to shape.

I hope to find a good balance between enjoyablillity, a bit of fun and some technical remarks. 
Next installment will be about moving those incoming token.


[vesper-diary]: http://inessential.com/vespersyncdiary
[linq-diary]: https://codeblog.jonskeet.uk/2011/02/23/reimplementing-linq-to-objects-part-45-conclusion-and-list-of-posts/
[json]: http://json.org
[lh-unit]: https://developer.mozilla.org/en-US/docs/Web/CSS/length#Font-relative_lengths "Line-height unit ln; unimplemented with an unknown specification"