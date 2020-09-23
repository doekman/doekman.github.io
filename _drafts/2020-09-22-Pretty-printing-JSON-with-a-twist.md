---
layout: post
title:  "Pretty Print JSON with a Twist"
date:   2020-09-20
is_listed: true
---

**TLDR;** You _can_ pretty print JSON in a different manner. [Try it here][json_pp.js].

My second programming language was Turbo Pascal. And from a BBS-pal I learned a notation in Pascal that has the _semicolon_ (statement separators) at the start of the line! Instead of at the end of the line, as most people did. And now I want to see if I can pretty-print JSON this way using Python and JavaScript. Just for the record: Pascal uses semicolons as statement _separator_, where languages like C use them as statement _terminator_.

To make clear what I want, here's an example JSON file in the desired layout:

	{ "type": "pedant"
	, "enabled": true
	, "tags":
	  [ "nag"
	  , "prick"
	  , "pin"
	  ]
	, "data":
	  { "test": 123
	  , "cooperate": null
	  }
	}

At first it looks pretty weird. However, there is an obvious advantage. You can visually follow the nesting-level of the data-structure in any editor. And you never place comma too many. This works, because comma's in JSON are used as _separators_. In this blog, I want to explore how such formatting can be done in Python and also JavaScript.

But **_WHY_** would one with a sane mind want to do this? Well, for starters because it is interesting. And also fight the orthodoxy and give voice to different opinions. And it's an ideal project to learn something along the way.

Anyways. Python's json module provides a [dump][json_dump]-method to convert a native data-structure to JSON:

	import json
	data = {'type': 'pedant', 'enabled': True, 'tags': ['nag', 'prick', 'pin'], 'data': {'test': 123, 'cooperate': None}}
	json = json.dumps(data, indent=2)
	print(json)

If you run this it will print out the formatted JSON below.

	{
	  "type": "pedant",
	  "enabled": true,
	  "tags": [
	    "nag",
	    "prick",
	    "pin"
	  ],
	  "data": {
	    "test": 123,
	    "cooperate": null
	  }
	}

To better understand what's happening, I visualized what's happening with the pretty printing below with colored borders. 

<span class="indent-color">blue</span> Providing the `indent` argument will kick-off the pretty printing. A positive integer will indent that many spaces per level. If you provide a string, that value is being used per indent-level.

<span class="NL1-color">red</span> If `indent` is specified, a newline will be inserted just before the indentation.

<span class="sep1">green</span> You can also change the separator behavior. From the documentation: _"If specified, separators should be an `(item_separator, key_separator)` tuple"_. So by providing the tuple `(';', ': ')` for `seperators`, one could create _European JSON_. Here I provide a semi-colon instead of a comma, which is obviously not valid JSON. So just be aware, you could produce invalid JSON with this option. However, when `indent` is specified, the tuple `(', ', ': ')` is automatically used, adding spaces after both separators.

<html><style>
	.JSON { font: 15px/1.5 monospace; border:1px solid #e8e8e8; background:#f8f8f8; padding: 8px 12px; margin-bottom:15px; }
	.indent-color { border:1px solid blue;}
	.indent { border:1px solid blue; display:inline-block;width:3ex;height:1em;}
	.sep1 { border:1px solid green; white-space: pre}
	.sep2 { border:1px solid green; white-space: pre}
	.NL1-color { border:1px solid red;}
	.NL1 span:last-of-type { border-right:2px solid red;}
	/*.NL2 { border-left:2px solid orange;}*/
</style><div class="JSON">
	<div class="NL1"><span>{</span></div>
	<div class="NL1"><span class="NL2 indent"> </span>"type"<span class="sep2">: </span>"pedant"<span class="sep1">, </span></div>
	<div class="NL1"><span class="NL2 indent"> </span>"enabled"<span class="sep2">: </span>true<span class="sep1">, </span></div>
	<div class="NL1"><span class="NL2 indent"> </span>"tags"<span class="sep2">: </span><span>[</span></div>
	<div class="NL1"><span class="NL2 indent"> </span><span class="indent"> </span>"nag"<span class="sep1">, </span></div>
	<div class="NL1"><span class="NL2 indent"> </span><span class="indent"> </span>"prick"<span class="sep1">, </span></div>
	<div class="NL1"><span class="NL2 indent"> </span><span class="indent"> </span><span>"pin"</span></div>
	<div class="NL1"><span class="NL2 indent"> </span>]<span class="sep1">, </span></div>
	<div class="NL1"><span class="NL2 indent"> </span>"data"<span class="sep2">: </span><span>{</span></div>
	<div class="NL1"><span class="NL2 indent"> </span><span class="indent"> </span>"test"<span class="sep2">: </span>123<span class="sep1">, </span></div>
	<div class="NL1"><span class="NL2 indent"> </span><span class="indent"> </span>"cooperate"<span class="sep2">: </span><span>null</span></div>
	<div class="NL1"><span class="NL2 indent"> </span><span>}</span></div>
	<div class="NL1"><span>}</span></div>
</div></html>

So, these arguments are a bit of a disappointment. It doesn't seem possible to format the JSON the way I wanted it.

However. We could specify a custom [JSONEncoder][] subclass via the `cls` argument. You can inspect the code I linked to. This class is heavily optimized and caters for all sorts of requirements. I made a copy of the code, and made some modifications. It just seemed like a lot of work. The code is not really designed for reuse (for example: encoding value types like boolean), so I decided to take a different route to a solution at this time.

Look at the color-coded JSON above. What if we replaced <code><span class="sep1">comma</span> <span class="NL1-color">newline</span> <span class="indent-color">indent</span></code> by <code><span class="NL1-color">newline</span> <span class="indent-color">indent</span> <span class="sep1">comma</span></code>? Yes, I'm talking string-replacement. Any newline in JSON can safely be recognized as whitespace, since newlines in strings are always encoded like `\n` (or when reading code, the newline `\n` is encoded as `\\n`). 

The only tweak we need is there should be a little bit indentation _after_ the comma (group `\2` in the code below). The remaining should be _before_ the comma (group `\1`). For now, I assumed the indent to be two spaces. The `((?:  )*)` construct is to see the two spaces as one "thing", so it could be matched multiple times. The `?:` makes sure it is not remembered as a match. I want only to match _multiples_ of two spaces here, hence the double parentheses.

	import re
	def my_json_pretty_print(json):
	    return re.sub(r', *\n((?:  )*)(  )', r'\n\1,\2', json)

As a side-note: since this is a learning exercise, I tried to make the regular expression more readable by using [verbose regular expressions][re_X]. The idea about it whitespace (not used in special ways) is ignored, so you can use multi-line strings. You also can add comments to parts of the regular expression. However, I intend to match whitespace, but I couldn't get it working. And because I also didn't think the regular expression was more readable, I abandoned it.

If we run the json print code through this function we will get the following:

	{
	  "type": "pedant"
	,  "enabled": true
	,  "tags": [
	    "nag"
	  ,  "prick"
	  ,  "pin"
	  ]
	,  "data": {
	    "test": 123
	  ,  "cooperate": null
	  }
	}

Not bad. Not bad at all! If we compare this to the desired layout from above, we can note the following:

* There are two spaces between the comma and the object-properties, instead of one. I think this is not wrong, but one space would be nicer.
* The opening object- and list-characters are followed by a newline. This needs to be addressed.
* The closing characters seem to be at the right place, so we are fine there.

First thing I want to fix is to support all sorts of indentations, and not only hard coded two spaces. I figured it is best to define a new function, which will call `json.dumps`, so there is only need to pass `indent` once. Addressing the issue with the extra space in the indentation: this is caused by the comma that is also functioning as an indentation character. Basically I need to delete the first character of the last indent, marked visually by the `X`: <code><span class="indent-color">&nbsp;&nbsp;</span><span class="indent-color">&nbsp;&nbsp;</span><span class="indent-color">x&nbsp;</span></code>.

I played a bit with parameterizing the indentation into the regular expression. String concatenation looked terrible. Formatting with `{}` and `.format()` wasn't a good match either, because curly braces are also special characters in regular expressions. `printf`-style formatting (`%s`) is a good alternative, while the regular expression stays readable.

When playing with it, I discovered that the handling of the `[`- and `{`-characters are the same the `,`-character, so I generalized the regex by changing `,` to a capturing group that matches all three characters, and add a back-reference to the replacement. The code now looks like this:

	def json_stringify(obj, indent=2):
	    if not isinstance(indent, str): indent = ' ' * indent
	    result = json.dumps(obj, indent=indent)
	    rx_indent = r'([,{[]) *\n((?:%s)*)%s(%s)' % (r_indent, r_indent0, r_indent1N)
	    result = re.sub(rx_indent, r'\n\2\1\3', result)
	    # Special case: remove inserted newline with top-level array or object
	    return result[1:] if result[0]=='\n' else result

So, if we run the code now, we get this:

	{ "type": "pedant"
	, "enabled": true
	, "tags": 
	  [ "nag"
	  , "prick"
	  , "pin"
	  ]
	, "data": 
	  { "test": 123
	  , "cooperate": null
	  }
	}

This is exactly how we want it. As always, there are some things to be desired:

* Indentations with TAB-characters are not handled well. The code should only remove the first character of the last indent when it's not a TAB-character.
* Using regex special characters (like `*`) make the program fail: the indent-string should be converted to a valid regular expression string first.
* The code fails with an `IndexError: string index out of range` on the code `indent[0]`. This is easy fixable by using slices, like `indent[:1]`

So that brings us to the following code:

	def json_stringify(obj, indent=2):
	    if not isinstance(indent, str): indent = ' ' * indent
	    result = json.dumps(obj, indent=indent)
	    r_indent=re.escape(indent)
	    if indent[:1]=='\t':
	        r_indent0  = ''
	        r_indent1N = re.escape(indent)
	    else:
	        r_indent0 = re.escape(indent[:1])
	        r_indent1N = re.escape(indent[1:])
	    result = re.sub(r'([,{[]) *\n((?:' + r_indent + 
	                    r')*)' + r_indent0 + r'(' + r_indent1N + r')', 
	                    r'\n\2\1\3', result)
	    return result[1:] if result[:0]=='\n' else result

So, that's it. I made this code into a [shell script][json_pp.py], so it can be run from the command line (don't forget to `chmod +x` it before you start it). So how does it perform?

	$ ls -lh
	-rw-r--r--   1 doekman  staff   4,9M 22 sep 17:08 big_trello_export.json
	-rwxr-xr-x   1 doekman  staff   705B 22 sep 17:10 json-pp.py
	$ time ./json-pp.py < big_trello_export.json > big_test.json
	real	0m0.849s
	user	0m0.734s
	sys	0m0.069s
	$ ls -lh
	-rw-r--r--  1 doekman  staff   7,3M 22 sep 17:11 big_test.json
	-rw-r--r--  1 doekman  staff   4,9M 22 sep 17:08 big_trello_export.json
	-rwxr-xr-x  1 doekman  staff   705B 22 sep 17:10 json-pp.py
	$ 


Not bad. Five megabytes within the second on my SSD iMac. I expected worse. 

As I mentioned at the start: I couldn't have ended this quest without back-porting this code to the [origins of JSON][toSource]. The advantage of string substitution: it can easily be converted to JavaScript. Also (grandpa speaking), JavaScript now comes with build-in [JSON-methods][js_stringify].

Converting the code to JavaScript was pretty straight-forward. The things worth mentioning:

* I couldn't find a native [re_escape][] for JavaScript, so I used [Dean Edward's rescape][rescape] from the (now ancient) [base2-library][base2]. Substitutions in JavaScript are `$1` instead of `\1` in Python
* To generate 4 spaces, in Python you would write `4*' '`. I couldn't find the JavaScript equivalent first, so I used `new Array(1+4).join(' ')` but then I found out you can use `' '.repeat(4)` in [modern browsers][str_repeat]
* Python slices `[1:2]` are calls to `.substring(1,2)` in JavaScript. Why can't I remember this?

You can try the [JavaScript version here][json_pp.js]. Thanks for reading!

[json_dump]: https://docs.python.org/3.8/library/json.html#json.dump
[JSONEncoder]: https://github.com/python/cpython/blob/3.8/Lib/json/encoder.py
[re_X]: https://docs.python.org/3.8/library/re.html#re.X
[js_stringify]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify
[json_pp.js]: https://zanstra.com/my/Json-pp.html
[json_pp.py]: https://gist.github.com/doekman/e6e942d03f9dee3e98c080b7a47cd04b
[re_escape]: https://docs.python.org/3.8/library/re.html#re.escape
[rescape]: https://github.com/doekman/base2/blob/1e2eb7fb10565db7e71d2b25780783627e0773dd/src/base2/js/String2.js
[base2]:  https://code.google.com/archive/p/base2/
[str_repeat]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat#Browser_compatibility
[toSource]: https://developer.mozilla.org/nl/docs/Web/JavaScript/Reference/Global_Objects/Object/toSource
