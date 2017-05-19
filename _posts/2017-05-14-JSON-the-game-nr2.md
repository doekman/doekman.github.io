---
layout: post
title:  "JSON, the game #2: The parsings"
date:   2017-05-14
tags: [game]
---

For some reason, I imagined the next step in the development of the game was to make the 'block' move. Like up and down, and sliding to the left. For [agile][agile] reasons, I want to make progress that is reflected and visible in the software. So no spending time at writing libraries first. You probably end up writing stuff you don't even need. But when starting, I realized the partial-JSON part needed to be worked on first.

To display the partial-JSON, I need a _model_ of that JSON. That model should be capable of annotating the partial-JSON with grammar issues (like missing bracket/comma, incomplete strings or just plain errors). Indentation should be addressed too. Also some dimension-data is needed, so we can determine whether the block can move up/down and when it has reached the partial-JSON surface (sorry, I can't stop thinking in planet metaphors).

When pondering on these requirements, I realized a tokenizer/parser was necessary. A library! Not very agile, right? Perhaps skipping the grammar issues first and add it later would have been a wiser choice. We will never know. Writing a parser does takes some time, but it [sure][regexmate] [is][uri] [fun][GWParser].

First I started writing a [tokenizer][tokenizer]. And since it's not your average code, I used the most annoying coding convention I could think of. I learned this style with Turbo Pascal in my BBS days. Years later I discovered you can use it with languages like JavaScript, CSS, C# and even PL/SQL. But it's too annoying for everyday use. Not only do you get _The Eye_ from your colleagues; every editor I've tried actively works against you by messing up the indentation. Again, and again. With. Every. Single. Edit.

The tokenizer splits the JSON into tokens like a string, boolean value or comma. With the parser we then can reason about tokens instead of characters, which makes life much simpler. Because we work with partial JSON, the tokenizer is made to recognizes unfinished strings and other values. Every token has an `is_complete`-attribute, so when rendering we can show if a brace is missing, or a string is unfinished.

<html><center style="margin-bottom:1em"><img src="{{site.baseurl}}/images/json-state-machine.jpg" alt="HTML/CSS mock" title="HTML/CSS mock: the 'ue' token will go from the right to the left"></center></html>

The parser was a dragon to me. I made a lot of diagrams to create a [state machine][fsm], see above, and played with [GraphViz][webgraphviz] (which is pretty cool, and a little weird). Finally I thought the state machine was right, and started coding. After writing some unit tests and identifying some failures, I did realize I went in the wrong direction. A state machine is apparently not the best solution to parse JSON and the answer was right in front of me. While I was focussing on the  nice flow diagram at [json.org][json] (which I coincidently also knew from the Turbo Pascal manual; I know, grandpa speaking), the program I needed to write was listed as an inset on the right of that same web page! `object := {} | { members }`... Elementary, dear Watson...

A well, [adventures in failure][aif]. Start all over, and everything will be fine. At the moment, I have a validating parser ([source here][this-commit]). It says whether the JSON is correct or not. There are still loose ends, which I will fix when needed. For example, I ignored Unicode for a big part and focussed on ASCII for now.

On a side note: I also wanted to check out those new [EcmaScript 2016 features][es6-features], since every browser seems to be [supporting them][es6-compat]. It's nice to see the language is evolving, after multiple timespans of stagnation. The best feature IMHO is string interpolation. 

Next step is adding code to the parser for annotating tokens, and insert `missing`-tokens. And render the thing in HTML naturally.


[agile]: http://agilemanifesto.org
[regexmate]: http://zanstra.com/my/RegexMate.html
[uri]: https://cdn.rawgit.com/doekman/base2/7466e0d79d4f049dfb07e44b78f9e4c23a2ec9f0/src/utils/Parsers/samples/Uri.html
[GWParser]: https://cdn.rawgit.com/doekman/base2/7466e0d79d4f049dfb07e44b78f9e4c23a2ec9f0/src/utils/Parsers/samples/GWParser.html
[tokenizer]: https://github.com/doekman/Json-the-Game/blob/61fcc2afed7bc6647ebd07510dd8af5f59d5960a/json_parser.js "Source-code at GitHub, first version"
[fsm]: https://en.wikipedia.org/wiki/Finite-state_machine
[webgraphviz]: http://webgraphviz.com
[json]: http://json.org
[aif]: https://www.youtube.com/watch?v=AWwQsdHMT7Y "Adventures in Failure, by MC 900ft Jesus"
[es6-features]: http://es6-features.org/
[es6-compat]: http://kangax.github.io/compat-table/es6/
[this-commit]: https://github.com/doekman/Json-the-Game/tree/c6f9cdfd302df48813c9a1f86a85d53b45f68303 "Tokenizer & validating parser"