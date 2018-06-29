---
layout: post
title:  "To refactor, or not to refactor"
date:   2018-06-29
tags:   [refactor]
---

The code iteration below is a contemporary comment on the use of refactoring.  
We start with this code:

	function isLeapYear(year) {
	  if (year % 4) {
	    return false;
	  } else {
	    if (year % 100) {
	      return true;
	    } else {
	      if (year % 400)
	        return false;
	      else return true;
	    }
	  }
	}


All code has to be [unit tested][Jasmine], so we write this (_normally I start with this before writing actual code, but you know..._):

	function unitTests() {
	  describe("leapYear tests", function() {
	    expect(isLeapYear(1900)).toBe(false);
	    expect(isLeapYear(1971)).toBe(false);
	    expect(isLeapYear(1972)).toBe(true);
	    expect(isLeapYear(2000)).toBe(true);
	    expect(isLeapYear(2003)).toBe(false);
	  });
	}


And to stay very agile, I wrote some minimal unit testing "library" ([individuals over tools][agile], anyone?):

	function describe(testName, tests) {
	    var groupTitle = 'Name: '+testName+' - Start: '+(new Date).toISOString();
	    console.group(groupTitle);
	    expect.nr = 0;
	    expect.errors = 0;
	    tests();
	    if (expect.errors == 0) console.info('All %s tests OK', expect.nr);
	    else console.error('%s of %s tests failed', expect.errors, expect.nr);
	    console.groupEnd(groupTitle);
	}

	function expect(x) {
	    return {
	        toBe: function(y) {
	            if (x === y) console.info("%s: OK 👍", expect.nr++);
	            else console.error("%s: Error 👹", expect.nr++), expect.errors++;
	        }
	    };
	}


The unit tests all passed. Can't wait to start with refactor step 1: removing unnecessary nesting. One step at a time.

	function isLeapYear(year) {
	    if (year % 4) {
	        return false;
	    }
	    if (year % 100) {
	        return true;
	    }
	    if (year % 400) {
	        return false;
	    }
	    return true;
	}


Yes..., much better! All tests pass. Refactor step 2, fold down into one if:

	function isLeapYear(year) {
	    if (year % 4 || (!(year % 100) && year % 400)) {
	        return false;
	    }
	    return true;
	}


And for the heck of it, remove the unnecessary if as well:

	function isLeapYear(year) {
	    return !(year % 4 || (!(year % 100) && year % 4000));
	}

Oopsy. The fourth test failed. Just a typo, no worries. And since there's already too much negativity around, I'll fix that in the next iteration, and while we are at it, move the negation to another function.

	function isLeapYear(year) {
	    return !isCommonYear(year);
	}
	function isCommonYear(year) {
	    return year % 4 || (!(year % 100) && year % 400);
	}


The committee unanimously decided: don't rely on javascript's truthiness, we want explicit code! So fixing that:

	function isLeapYear(year) {
	    return !isCommonYear(year);
	}
	function isCommonYear(year) {
	    return year % 4 != 0 || (!(year % 100 != 0) && year % 400 != 0);
	}


Refactor step 6, the overload of negativity was back. Fixing:

	function isLeapYear(year) {
	    return !isCommonYear(year);
	}
	function isCommonYear(year) {
	    return year % 4 != 0 || (year % 100 == 0 && year % 400 != 0);
	}


Refactor step 7 should be a charm. I still don't like the code at all, so f$*# it, just use the native function:

	function isLeapYear(year) {
	    return new Date(year, 2 - 1, 29).getDate() == 29;
	}

Done!

Code can also be found [here on GitHub][code].


[agile]: http://agilemanifesto.org
[Jasmine]: https://github.com/jasmine/jasmine
[code]: https://github.com/doekman/to-refactor...
