---
title: FAQ
tags: 
---

I want to help, what do you have for me?
----------------------------------------

Lots of stuff to do. Check out our very special [wanted](/development-roadmap-and-wanted) page.

### But I'm not a programmer!

Still lots of stuff to do! If you are into drawing, you could help us build an icon set,
emoticons set, or something along those lines. If you know some languages other than English or
Russian, you could help with translations. In either case, please just
use LeechCraft, report your ideas, suggestions, tell us about your
experience and feelings!

And, of course, help us build a community, stay around in our XMPP
conference,
[leechcraft@conference.leechcraft.org](xmpp:leechcraft@conference.leechcraft.org),
chat around, answer newbies' questions and such.

Vision
------

### Why do you write another browser (torrent client, RSS reader, etc.), there is Chrome/Firefox/Opera/whatever?

Firstly, it's not just a browser (or just a torrent client, or just an IM)
with just some additional plugins. The project has quite another goal (see the
next question).

### OK, so what's the goal of the project?

It has multiple dimensions to it.

Firstly our goal is to bring a usable and handy all-in-one (but modular)
application covering most Internet and everyday desktop tasks,
like web browsing, messaging, reading news or media playback.

Secondly we believe tight integration between different (and, perhaps,
unrelated at first glance) applications may yield synergetic effect
and improve the quality and usability of every single application. This
project is largely an experiment at what could be the outcome of this vision.

In addition to that, implementing a whole Desktop Environment is also on the roadmap. For
that, just some plugins like window manager and support for running
external applications inside LeechCraft should be added. Unfortunately,
that would be a \*NIX-only thing.

Last but not least, it's incredibly fun!

### Aha! All-in-one application, that's not Unix-way!

By saying "all-in-one" we mean end-user experience.

Architecturally, it's modular and split into different parts, where each
module does one thing and tries to do it well. These modules
communicate via a global LeechCraft-wide message bus. Of course, the
modules don't use UNIX pipes for communication, but pipes might be a bit
inefficient for fusing GUI applications.

### Why can't I use standalone application for each task?

You can if that application fits you better. LeechCraft
cannot and will not cover every possible use case out there.

Nevertheless, please consider giving LeechCraft a try, especially if you
feel like you will be able to spend a few minutes to give us some feedback
on your experience.

### I've downloaded Windows version, and it's total crap

Well, Windows version isn't the thing that we are focused on due to the
lack of Windows developers. Thus, Windows version will most likely have
more bugs and lack some features present in builds for other OSes.

### I want some feature implemented

Please [contact us](/contact-us) or open an issue on our
[issue tracker](https://dev.leechcraft.org/projects/leechcraft).

Code & technical issues
-----------------------

### Why have you chosen C++?

Well, there are several reasons behind this decision.

-   It's better than C for anything but low-level system development.
-   It's better than Python, Ruby or other similar dynamically typed
    applications because types.
-   Because the original author was unaware about Haskell or OCaml at
    the very beginning of the project.

### Why have you chosen Qt?

Since we've already chosen the primary language, the question is what
the most suitable framework for C++ is. We considered Gtk, wxWidgets, and
some other libraries, but Qt wins because of its (mostly) clean API,
quality, and of it providing not just a widget library,
but a lot more: from metaobjects and reflection to XML parsers, SQL
helpers, networking, and all that. It's a rock-solid foundation.

### Will you ever implement running LeechCraft plugins as standalone applications?

Unlikely. It goes against LeechCraft philosophy, and the effort is better
spent at optimizing plugins so that the overhead of having them loaded
is close to zero as long as they are not used.

Plugins
-------

### Azoth can't connect to my Google Talk / Hangouts account

Use port 5222 instead of 5223.

### Azoth doesn't store passwords

Install the SecMan plugin.

### Tabs aren't recovered upon restart

Install the TabSessManager plugin.

### LeechCraft crashes, and I want to be able to make a helpful bug report

Install [AnHero](/plugins-anhero) for recording the crashes (no worries,
no personal info is collected, just the stack trace) and
[Dolozhee](/plugins-dolozhee) for submitting that information to our issue tracker.
