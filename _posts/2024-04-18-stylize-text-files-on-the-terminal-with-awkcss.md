---
layout: post
title: "Stylize Text Files on the Terminal With awkcss"
date: 2024-04-18
author: Doeke Zanstra
category: ICT
---

Since I've been introduced to UNIX, I've been intrigued by the _awk_ program. Most of the time when I use it, it's to extract a value from a text file. Yet it can do so much more than that: it's a full blown programming language. It's a text processing language, which runs one or more pattern/action combinations:

    pattern { action }
    ...

When the pattern matches a line, the action is executed. But at a certain moment I realized the pattern/action-combo looked a lot like CSS. In CSS you have rules, which are made up by selectors and property assignments. _awk_ also calls them rules. Selectors and properties. Patterns and actions. A light bulb 💡 moment: __awkcss__ was born.

The pattern in awk can be seen as an expression which selects a line or not. In the actions part we can use function calls as property setters. So, what properties would be easy to set? I would like to show the capabilities of awkcss by providing some examples. 

Take for example this `zebra.awkcss` stylesheet:

    NR % 2 == 1 { 
        color(black);
        background_color(gray);
    }
    NR % 2 == 0 { 
        color(white);
        background_color(black);
    }

To show the file `README.md` with zebra stripes, run the following command:

     $ awkcss -f zebra.awkcss README.md

The first pattern/action combo ("rule") selects odd lines (in awk, the `NR` variable contains the 1-based line number). For properties I've created the `color`- and `background_color`-functions. As property values I've used variables, although you can also use strings.

About the naming convention: CSS claimed the _dash-separator_, and JavaScript is doing _camelCasing_. To differentiate awkcss from the CSS and JavaScript, I was forced to use _snake\_casing_ as a naming convention. Having the best readable CSS-dialect is considered a bonus.

To create a simple MarkDown stylizer, checkout this `markdown.awkcss` stylesheet:

    BEGIN {
        width(72);
    }
    /^#+ / {
        color(yellow);
        font_weight(bold);
    }
    /^\t| {4,}/ {
        color("gray");
    }

The `BEGIN`-rule sets the default width. It's like the CSS `*`-selector. The second rule matches any lines starting with a `#`-sign to match MarkDown headings. And the third rule matches code-blocks, starting with a tab character, or 4 spaces. 

Suppose you don't want to render code-blocks, you can use the `display`-property with the `none`-variable:

    /^\t| {4,}/ {
        display(none); 
    }

There is also a box-model:

    /^>/ {
        block_name("block_quote");
        border(ascii);
        border_style_left(none);
    }

This rule matches block quotes, and draws a border around it. Since a block quote already starts with a border-like character, the left border is set to `none`.

An issue with awk is that a pattern selects one line only. For inline-properties like `color` this is not a problem. But we don't want to draw a border around every line. We need a mechanism to draw a border around the whole block quote instead. For this the `block_name` property can be used. All consecutive lines with the same block name are considered to be part of the same block.

There is also support for media-queries:

    /^\t| {4,}/ {
        color("gray");
    }
    /^\t| {4,}/ && LINES <= 25 {
        white_space(pre);
        text_overflow(ellipsis);
    }

This stylesheet renders MarkDown-code gray. For terminals with limited height, lines are not wrapped (default `white_space` is `pre_wrap`). And when the line overflows, it is truncated and an ellipsis (…) is shown at the end. Besides the _number of lines_, there are also variables for _number of columns_ and _colors_.

Finally, you can use some pseudo-elements as well:

    /^#+ / {
        color(bright_blue);
    }
    /^#+ / && select("::after") {
        content("------------------------------------------------");
        select();
    }

This will display a line under every heading. Because of the way `awk` works, the selector will need to be reset at the end of the rule by calling `select` with no arguments. The inserted pseudo-element is block level, meaning it will insert a line below the heading. Of course, the `::before` pseudo-element is also supported.

Although I used MarkDown in this blog as an example, the use cases don't stop there. It can be used to better inspect `/etc/passwd` by hiding system accounts, printing comments gray and high lighting accounts.  

And I didn't even touch everything. Check out the properties `margin` (including margin-collapse), `tab_size`, `text_decoration` (both `underline` and/or `blink`) and `width`: they are all documented in the [AWKCSS Reference][reference].

Getting started: Check out the [repository on GitHub][repo]; the `README.md` contains all information to get you started using awkcss!


How Does This All Work
----------------------

If you want to know exactly how `awk` is called, just add the `--debug` argument, and the command that would have been ran is displayed (`§` is the repository-home):

     $ awkcss --debug -f zebra.awkcss README.md
     awk -v COLS=180 -v LINES=50 -v COLORS=256 -f §/library.awk -f §/awkcss/defaults.awkcss 
         -f §/awkcss/examples/zebra.awkcss -f §/awkcss/render.awk README.md

The [reference][ref_awk] also contains some technical information about this `awk`-implementation. Finally, if you are interested in the source code, I suggest to check out the [version 0.1-branch][v0.1] first. This contains the initial implementation without buffering and other more advanced stuff. 

There is still a lot left to be desired. There are bugs, more test coverage will be very helpful. But the biggest missing feature is table-support. After all, working with columns/cells (like `$3`) is awk's biggest feature. However, to implement support for that, the render engine needs to be re-architected. We'll see what the future holds.

[repo]: https://github.com/doekman/awkcss/tree/main
[reference]: https://github.com/doekman/awkcss/blob/main/reference.md
[ref_awk]: https://github.com/doekman/awkcss/blob/main/reference.md#awk-specific-information
[v0.1]: https://github.com/doekman/awkcss/tree/version-0.1
