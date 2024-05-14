---
layout: post
title: Google OAuth "Invalid-Grant" Nightmare — and How I Fixed It
date: 2024-05-14
author: Doeke Zanstra
category: ICT
---

I'm maintaining a couple of web applications, which use _login-with-google_ for authentication. It also uses _OAuth_ to access some of Google API's. They are private applications, with less than 100 users.

A while ago, one user reported an error with an application. Said user could log in, but when accessing a Google API, it would return the error "invalid-grant".

I tried a lot of things, but [this blog article][issue] was most helpful (see also this [Stack Overflow][so_issue] entry). But solving the problem was not possible at the time. Nothing from the article worked. The user didn't need to call the Google API since there was a workaround, so I left it at that.

Months later, one direct collegue reported the same thing. Again, nothing I could think of or found on the internet seemed to work. This was more of a problem, since the collegue actually needed the functionality. And also, this not understood behaviour of OAuth was a ticking time bomb. And then, without an plain reason, I had an epiphany. Why not generate new credentials within the same project?

It was worth a try. So I generated a [new "OAuth 2.0 Client IDs" entry][setup_oauth] within the Google Cloud console. In the database, I emptied the oauth-session table. I made a backup, so I could revert the change if necessary. I also emptied the web application's session table in the database. Via this way, all users are forced to re-authenticate. The web session table doesn't have important data in it, so in my case this was possible.

And the fix worked well. Users did need to re-authenticate, but they didn't need to grant permissions to use the app. I guess permissions are stored on project level, so this was not neccssary. It still is a bit unsatisfactory the underlying problem isn't known, but I'm pretty happy the error is gone now.


[issue]: https://blog.timekit.io/google-oauth-invalid-grant-nightmare-and-how-to-fix-it-9f4efaf1da35
[so_issue]: https://stackoverflow.com/a/38433986/56
[setup_oauth]: https://support.google.com/cloud/answer/6158849?hl=en-GB
