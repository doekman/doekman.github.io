---
layout: post
title:  "To vowel case"
date:   2018-07-08
changed: 2020-04-08
tags:   [one-liner]
---

There already was _Sentence case_, _lower case_, _UPPER CASE_, _Capitalized Case_, _AlTeRnAtInG CaSe_ and _Title Case_.

__And nOw YOU cAn dO vOwEr cAsE tOO__!

	function toVowelCase(text) {
	  return text.toLowerCase().replace(/[aeiouy]+/g, match => match.toUpperCase());
	}

**Updated**: _a correct implementation of `toVowelCase` is locale-dependend. In English, the letter `y` is sometimes a vowel, and at other times a consonant.  The above works for the Dutch language and some other languages. Your mileage may vary._

**Updated**: bookmarking <https://headlinecapitalization.com> and <https://titlecaseconverter.com>.
