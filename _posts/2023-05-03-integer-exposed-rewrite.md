---
layout: post
title: "Integer Exposed Rewrite"
date: 2023-05-03
changed: 2023-05-12
author: Doeke Zanstra
category: ICT
src_href:	https://github.com/doekman/integer.exposed
---

For a company-internal web application I've used [NoTemplate.js][notemplate] (disclosure: I'm a contributor to the project). It's a minimal library for dynamically generating DOM nodes. And really like it. It hardly introduces abstractions. It wraps the W3C DOM API with a simple interface. And with "simple" I mean more JavaScriptesque, if that's a word.

The biggest reason to use _NoTemplate_ was its simplicity. I probably won't work much on this internal application, but when I do I don't want to spend a lot of time getting up to speed. I won't be working on it within 6 months, but it also can be 2 years. So I was happily surprised I'm not alone in wanting to keep things simple. See for example this piece about [Writing Javascript without a build system][no_build]. So when Julia Evans wrote about her [new playground][int_exposed], I got the idea to rewrite this playground with NoTemplate.

With this blog, I try to show the process of this rewrite. Not sure if this is interesting. I do get technical, but I try only to mention the interesting and relevant bits. Well, let's get on with it.


The Rewrite
===========

In this part I'm going to explain how I approached the rewrite. The code is [published on GitHub][repo], and every step is a commit in the git repository. I primary written this section as a way to prevent myself from writing the code, and end up not blogging about it. So if you don't think this is interesting, you can skip to the next section. And when I say "rewrite", I probably should say "rewire". I reused most of the code from `script.js` and only made minor changes.

First step in the rewrite is to copy the source files and use these as a base for the rewrite. If you want, you can follow these steps on GitHub as I've created a commit for every step `(commit 11c34fa Initial)`.

The first step is to replace the Vue library include with the NoTemplate one. I also emptied the script.js file. Now I look at the Vue template. It's the HTML contained by the `<div id="app">` tag/element. With NoTemplate, we write the view-template with JavaScript. So let's first translate the HTML without the behavior (events).

To keep things simple at this point, the UI will display 16 bit by default. Also, I only show the 16-bit pattern for now. And as I mentioned, the app is not interactive. The `form`-method in `script.js` generates the HTML view `(commit 9551612 Static version)`.

We want to render the view from values. For that, I introduced the `state` property, and some  property getters. One thing to note is how the _bit pattern_-section is generated. With NoTemplate, everything is an expression. So first an array is created for every byte. Then this array is mapped to `span`-elements.

This version of the code doesn't respond to dynamic input. But when you change the state-properties in an editor, the form reflects these new values. I tested some different values, and compared them to the output of the original version. Later I realized there are also `span`-elements with the `doublebyte`-class. I haven't actually observed any different rendering without this class usage. So I skipped implementing them `(commit d12e82f Dynamic state)`.

And now the step to make it all interesting. Attaching event handlers, and all that is necessary. First I added the property setters and operator methods (not-, shift left-operator etcetera). When working on the event handlers for the text-inputs, I discovered an important disadvantage of using NoTemplate. Later in this blog I will elaborate on this. So with all the click, keyup and blur handlers in place, the rewrite is almost complete `(commit 6d8b93f Event handlers)`.

Until so far I didn't notice the original script used an indent of two spaces, while I was using four. Since I copied most code, I now have mixed code. Let's fix that now `(commit fee5e6c Fix leading whitespace)`.

The last part to write is to save the form state into the hash part of the URL. I had a little trouble understanding Vue, and how it handles changes of the hash. My initial code seemed to call the render-method twice. So I added the `settingHash` property to prevent this. And I've used the same code to set the state from the hash before the initial render `(commit b7df8f1 Handling hash)`.

While playing with the playground I missed a button to reset the display to zero. The playground resembles a calculator, so that must have been why I wanted to add it `(commit 49a20c5 Clear operator)`.

[▶️][int_exposed_rewrite] You can [play with the rewrite here][int_exposed_rewrite].

About tooling, and especially the simple kind: I've used [WorldWideWeb][wwwapp] for this project. It's a simple, personal web server for macOS. It's like `python3 -m http.server`, but it has a GUI and it adds niceness. For example, it automatically reloads the webpage if one of the source files have changed. 


Comparison
==========

How do the two implementations compare? For me, two things stand out. First, with Vue the view is rendered before JavaScript has ran because it's HTML. With NoTemplate you can get a render flash, because JavaScript has to run before the form is displayed. But if you watch close, you might see a glimpse of several `{% raw %}{{ bit }}{% endraw %}` items at the bit pattern part in the Vue-app. You can see this better when you turn off JavaScript. With NoTemplate you can overcome this by rendering the form at compile time with some kind of build-system. But yeah, you'll need a build system then...

But there is one problem with NoTemplate I don't directly have a solution for. Let me explain. When a value in the application changes, NoTemplate renders the complete form and replaces the original form with the new one. While this might sound wasteful, in practice with small applications this is not a problem. Until I realized after a blur-event, the focus on the input element was lost (for example changing the signed value of the integer and pressing enter). And that is pretty annoying when you are using the keyboard. 

My first impulse is to solve this problem. I'm a programmer after all. But this is beyond the scope of this project. However, I will explore three solution directions. The first is to store what element has the focus into the application state. Now the focus can be set _after rendering_ with a calls to `setfocus()`. Or _during rendering_ with the  `autofocus`-attribute on the appropriate element.

We can determine the current focussed element by calling `document.activeElement`. But how do you serialize this into some string? Some kind of DOM-index would be problematic. In a templating system, the number of nodes can differ from render to render. When the element has an `id`-attribute, this is not a problem. But this is not always the case. This could be solved by the NoTemplate library by generating `id`-values for the DOM elements that can have the focus.

Another problem to tackle is how to determine which element has the focus in all situations. When pressing tab from an input-element, the active element in the blur-event is `document.body`. The same is true for the change-event. Not 100% sure why this is. It might be set at a later stage in the event pipeline.

The second direction is not to replace the DOM-node, but to apply changes. Make some DOM diff thing. Not sure how this exactly would work, because event-handlers change too (there's probably an NPM module for this). Not too fond of this idea.

I guess the best direction would be just to encode the form in plain HTML, like it was 2002. Only the bit-pattern part is dynamic after all. This part could be generated by NoTemplate.js. And perhaps for attaching the events, I could create something like [Dean Edwards JSB][jsb]. I always liked that idea too.


Conclusion
==========

It has been a fun project. The outcome is not completely what I wanted, but I learned a lot. The goal was not to create a working app, but to explore after all.

I discovered that writing the blog while doing the project has a lot of advantages. It keeps me focussed, and it let me do a bit of work while being on the train. I hope this blog makes sense, and like to hear your thoughts on this topic.


Update
======

Via [Mastodon][mast_thread] I got the tip to defer the blur-event handler, to find out the actual active element. I directly used `setTimeout`, and I got the result I wanted: the `activeElement` was the element I tabbed to.

But since it's not 2002 anymore, and `setTimeout` feels like a hack I looked into promises. So I replaced `setTimeout` with `Promise.resolve(null).then`. But this didn't work. The activeElement was document.body again.... What's going on?

After reading about [the event loop][event_loop] on MDN, I read about using promises, and found [this quote][task_vs_micro]:

> Promise callbacks are handled as a microtask whereas setTimeout() callbacks are handled as task queues.

Long story short: defering code with `setTimeout` works because it's a task, and not a [microtask][microtasks]. My understanding is that a microtask would be ran right after the event-handler, while a task would be scheduled in the next iteration of the event loop. Apparently after the blur-handler, there is a task or microtask setting the activeElement. But now I know setTimeout is not as much as a hack I thought it was. It's just wat I needed.

So now we can make the render-method preserve the activeElement. To do so, I first gave every element that can be active an `id`-attribute. And after that, I altered the render-method to remember and set the active element around the render. The render is wrapped within a setTimeout, so it is executed as a seperate task. I also used the optional chaining operator (`?.`), because the activeElement can be `null` and focusable elements may be disappear between renders.

Also, I changed the `blur`-events to `change`, because we don't need a render when a text-value hasn't been changed. Also, I wanted to make all the controls accessible by the keyboard. So I changed the `span`-items for the bit selector and the bit pattern to `button` elements, and gave them an `id`- and `tabindex`-attribute. To fix their appearance, I only needed to set a couple of CSS properties. As value I used `unset`, and it works like a charm. Now we can tab through all controls, and use the spacebar (or enter) to select or toggle them `(commit e98e782 Retaining active element)`.

On thing that still bugged me a bit were the bit buttons (pun not intended, but still enjoyed). In the user interface, they differ from the other controls (tab-bar, buttons, text inputs). On macOS, when pressing tab links are skipped. Only "proper" controls get the focus. If you want the next link to get the focus, one can press option+tab (also known as alt+tab). So `a`-elements for the bits seemed a better fit.

But how should this work? A click handler would not suffice, I would need a keyboard-handler as well. And also [MDN suggested to use buttons instead][a_onclick]. But then I realized, I just can use a hash-link, like `<a href="#0x01"…`. When I supply the right value for the right bit, no additional scripting is needed. The `hashchange`-handler will handle it all. And tabbing (or option-tabbing) to the elements, and pressing enter toggles the bit `(commit xxx A@href bits)`.

That's it. With this addition I learned even more about JavaScript and the microtasks. Also, the playground is now a bit more accessible, and that's nice. 



[no_build]: https://jvns.ca/blog/2023/02/16/writing-javascript-without-a-build-system/ "Writing Javascript without a build system, by Julia Evans"
[int_exposed]: https://jvns.ca/blog/2023/04/19/new-playground-integer-exposed/ "New playground: integer.exposed, by Julia Evans"
[int_exposed_rewrite]: https://blog.zanstra.com/integer.exposed/ 
[notemplate]: https://github.com/stefanhaustein/notemplate
[repo]: https://github.com/doekman/integer.exposed
[jsb]: http://dean.edwards.name/jsb/ "JavaScript Bindings"
[wwwapp]: https://blog.iconfactory.com/2022/06/worldwideweb-part-2/
[mast_thread]: https://mastodon.nl/@dukoid@mastodon.social/110329152286258188
[event_loop]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Event_loop
[task_vs_micro]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises#task_queues_vs._microtasks
[microtasks]: https://developer.mozilla.org/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide
[a_onclick]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#onclick_events
