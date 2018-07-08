---
layout: post
title:  "To vowel case"
date:   2018-07-08
tags:   [one-liner]
---

There already was _Sentence case_, _lower case_, _UPPER CASE_, _Capitalized Case_, _AlTeRnAtInG CaSe_ and _Title Case_.

__And nOw YOU cAn dO vOwEr cAsE tOO__!

	function toVowelCase(text) {
	  return text.toLowerCase().replace(/[aeiouy]+/g, match => match.toUpperCase());
	}

