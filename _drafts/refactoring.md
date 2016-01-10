---
layout: post
title:  "To refactor, or not to refactor"
categories: refactor
---

The code iteration below is a contemporary comment on the use of refactoring.

{% highlight JavaScript %}
// Original
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

// Unit test
function unitTests() {
  describe("leapYear tests", function() {
    expect(isLeapYear(1900)).toBe(false);
    expect(isLeapYear(1971)).toBe(false);
    expect(isLeapYear(1972)).toBe(true);
    expect(isLeapYear(2000)).toBe(true);
    expect(isLeapYear(2003)).toBe(false);
  });
}

 
// Create a Jasmine fake
function describe(testName, tests) {
    console.clear();
    console.info('Name: %s - Start: %s', testName, new Date);
    expect.nr = 0;
    expect.errors = 0;
    tests();
    if (expect.errors == 0) console.info('All %s tests OK', expect.nr);
    else console.error('%s of %s tests failed', expect.errors, expect.nr);
}

function expect(x) {
    return {
        toBe: function(y) {
            if (x === y) console.info("- %s: OK", expect.nr++);
            else console.error("- %s: Error", expect.nr++), expect.errors++;
        }
    };
}
 
// Refactor step 1, removing unnecessary nesting
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

// Refactor step 2, fold down to one if
function isLeapYear(year) {
    if (year % 4 || (!(year % 100) && year % 400)) {
        return false;
    }
    return true;
}
 
// Refactor step 3, removing unnecessary if
function isLeapYear(year) {
    return !(year % 4 || (!(year % 100) && year % 400));
}

// Refactor step 4, move the negation to another function
function isLeapYear(year) {
    return !isCommonYear(year);
}
function isCommonYear(year) {
    return year % 4 || (!(year % 100) && year % 400);
}

// Refactor step 5, add != (and don't rely on javascript's trueyness)
function isLeapYear(year) {
    return !isCommonYear(year);
}
function isCommonYear(year) {
    return year % 4 != 0 || (!(year % 100 != 0) && year % 400 != 0);
}

// Refactor step 6, rewrite the ! and != to ==
function isLeapYear(year) {
    return !isCommonYear(year);
}
function isCommonYear(year) {
    return year % 4 != 0 || (year % 100 == 0 && year % 400 != 0);
}

// Refactor step 7, still don't like it, fuck it, just use native function
function isLeapYear(year) {
    return new Date(year, 2 - 1, 29).getDate() == 29;
}
{% endhighlight %}

The good thing that came out of this?

The idea of using [Jasmine](https://github.com/jasmine/jasmine) on webpage, and when pressing the run-button,
every expect/toBe method will get a thumbs-up 👍🏻 emoji overlay when satisfactory, or a Japanese ogre 👹 when the 
test-case still needs more work. How awesome would that be?