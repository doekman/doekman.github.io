---
layout: post
title:  "Only my warnings"
categories: tools
---

Don't you hate to be put in a situation like the following?

> You are assigned by your company to add some functionality to some software at
> some client. The client has standards and practices in place stating you can't checkin code that produces warnings, only to find
> out that a clean checkout produces loads of warnings when building!
> 
> But you can't fix <span style="font-style:normal">😢</span> those warnings. You, the super star programmer™ (whose boss is getting
> paid big dollars for high quality, virtually bug-free software), cannot get rid of those pesky lines of inability…
>
> For starters, why judge those warnings in the first place. You're just the new guy, you don't want to get into any trouble. Also, 
> by solving warnings, you may introduce new bugs (even though you're super competent, after all creating bugs is just a matter of probability). 
> Nobody wants that! And finally, you're a professional. The client is only paying for the new functionality, not for you to clean
> up the place. And about your collegues, you don't want to hurt anyones feelings. 
> So in short: the man says no. No way fixing those warnings, José!

Situations like these inspired us to envision a new kind of solution to those issues at hand. Let me introduce to you, without further ado, the Visual Studio extension **Only My Warnings**. 

When your solution is under source control a new list button is added to the Error List pane, with the options *All*, *Only Mine* and *Local Only*. 
With the option *Local Only* selected, the pane will only show errors, warnings and messages caused by local changes, i.e. by you!
All other messages are hidden, so you don't have to deal with them. Victory!

![screen shot]({{site.baseurl}}/images/Only-my-warnings_error-list.png "Error List window from Visual Studio 2015 Community Edition")

The extension doesn't get in the way; it only adds this one list button.
When selecting *Only Mine*-option, the tool will gather all messages from your checkins, and show only the messages caused by you. 
And it follows branches, so you can focus at the feature that is imporant at any given moment.

Now you can be productive, and still have a chat with your collegues without having an argument! While using this extension, you
will contribute to your team's productivity. You will be a team productivity enabler! That's how 10× developers are bred!
In a way, *only my warnings* contributes to world peace.

For now, the extension is still in its early alpha phase. If you want to participate in the beta-program, or want to get notified
when the extention will be released to the Visual Studio Gallery, please 
[fill out this form](https://docs.google.com/forms/d/e/1FAIpQLScMYh6JqrQn-dEA8hzIGJdJsV5-9ufCuTkfczPeXlBjNoB7KA/viewform).

(this is a blog post in the series: I'm perfect, communicate better with tools)
