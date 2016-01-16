---
layout: post
title:  "Repeat one-liner"
date:   2016-01-16 20:00
categories: one-liner
---

I still love one-liners (back in the day, an one-liner was one line of BASIC code, doing something magic),
and today I like to continue [this tradition][one-liners]. 
To hell with [polyfills][]!

{% gist doekman/acd0e66415225ef11abb %}

{% comment %}
function repeat(str,num) {
  return new Array(num+1).join(str);
}
{% endcomment %}

[one-liners]: http://zanstra.home.xs4all.nl/logs/oneLiners.htm "Text in Dutch, code in international JavaScript"
[polyfills]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat#Polyfill 
