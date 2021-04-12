---
layout: post
title: "One Closure Explanation"
date: 2021-04-12
author: Doeke Zanstra
category: ICT
---

Closures in programming languages are pretty intuitive to use. Understand what they are is actually a bit more difficult.

A closure is a function, but not a regular function. And to better understand closures, it helps me to understand regular functions. So first I explain how regular functions work. After that I'll make the connection to functional closures.


Regular functions
-----------------

When you call a regular function, a lot of things are going on. Under the hood a stack-structure is used.
Things the function needs, like arguments and the return address, get pushed up this stack. This is a bit of a simplification. There are optimising compilers, but I want explain the principle here. If you want to delve into the nitty-gritty details, please checkout [calling conventions][calling_convention] on Wikipedia.

So how does this work, what gets pushed up our stack-for-algorithmic-purposes? Let's explain this with a JavaScript example.

	1: function test(a, b) {
	2: 	var c = a + b;
	3: 	console.info('The sum of %s + %s is %s', a, b, c);
	4: }
	5: test(1, 2);

The program runs the following steps.

* Before calling `test`, the return address is pushed onto the stack. With this info, the function knows where to "return" to. So let's push the address of `line 5` onto the stack.
* After that, the arguments `1` and `2` are pushed onto the stack. Now there are 3 items on the stack.
* Now we actually can start running the function. This is done via a jump to the entry point of the function, like `goto line 1`. I will indent steps that are within the function call:
	- At line 1 there is nothing to do.
	- At line 2, there is some arithmetic, and the result is stored in the _local variable_ `c`. Locals are stored on the stack too, so `3` will get pushed onto the stack, and we have 4 items on the stack.
	- Line 3 will print a line to the console, while referencing three items on the stack.
	- At line 4, the function returns. All local variables, arguments and return address are popped from the stack. The return address is used to jump back to (the end of) line 5.
* And at that point there is no more code to execute, and our program has finished running.

At first glance this may seem a bit tedious and boring. Yet, some smart stuff is going on. When the function returned at line 4, all local variables, arguments and return address have been cleaned up. No need for _garbage collection_ or _reference counting_. Very efficient.

And it works pretty well when calling other functions or even with recursive calls. The stack-size is the limit! Only a stack-overflow comes after that, but that is about it.

And yes, I left out handling return values, stack pointers and reference types. We do not need to worry about those for this explanation.

To summarise: arguments and local variables live on the stack. They only exist between function entry and exit. In regular functions, that is.


First class functions
---------------------

Before we go to closures, it is important to know what _first class functions_ are. JavaScript has them, but what defines them? At first you might think _nesting functions_ is a property of first class functions, but it is not. Turbo Pascal [supports inner functions][inner_function], yet it doesn't have support for first class functions.

When you can assign a function to a variable, the language supports functions as a first class citizen. It should be no different as assigning an integer or a string to a variable. 

And when you can assign a function to a variable, you also can pass them around to other functions. Or let functions _return_ functions or assign functions to data structures. This also seems reasonable, but Turbo Pascal can't do this. For that one needs something extra.


Functional closures
-------------------

So let us explore functional closures. By the way: _closure_, _lexical closure_ or _function closure_; all the same thing. Take the following example:

	function test_two(a, b) {
		var c = a + b;
		return function inner() {
			console.info('The sum of %s + %s is %s', a, b, c);
		}
	}
	var result = test_two(1, 2);

The function `test_two` returns a nested function, which is assigned to the variable `result`. So you would expect to execute the inner function by running `result()`. And this indeed works in JavaScript.

But, when you think of the stack-based system of regular functions, as described above, something is off. The stack-algorithm says when the function `test_two` returns, the arguments `a` and `b` and variable `c` are popped from the stack, and would not be accessible anymore. A call to the inner function would refer to variables that don't exist anymore!

Functional closures solve this. I like to think of a closure as function with a shopping bag that contains all the variables (state) which are necessary to perform its function. So the variable `result` contains a reference to the function `test_two` together with a bag with values for `a`, `b` and `c`.

When you would run `var result2 = test_two(3, 4)`, the variable `result2` will not contain the same thing as `result`. The reference to the function is the same, but this closure has its own bag of state.

How exactly this is implemented is not important for my explanation. Different languages do implement this behaviour differently, but the principle is the same. I found some more [technical info about JavaScript closures on MDN][js_closure], and also a blog about [C# closures][cs_closure].

The Wikipedia article [on closures][closure] has the line _"Operationally, a closure is a record storing a function together with an environment."_ in the introduction. That summarises the point of my explanation pretty well. I hope you now have a better understanding of closures. Let me know what you think.


[calling_convention]: https://en.wikipedia.org/wiki/Calling_convention
[inner_function]: https://twitter.com/doekezanstra/status/1380426215757070336
[closure]: https://en.wikipedia.org/wiki/Closure_(computer_programming)
[js_closure]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures#closure_scope_chain
[cs_closure]: https://vkontech.com/the-intuitive-guide-to-understanding-closures-in-c/


