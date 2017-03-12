---
title: FAQ
tags: 
published: 2011-07-12T01:39:09

---

I want to help, what do you have for me?
----------------------------------------

\
\
Lots of stuff to do.

### Core

\
\

-   Tabs in header.
-   KDE-style dockwidgets (represented by a button and completely
    hideable by clicking on it).

### New plugins

\
\

-   libvlc-based media player with support for collections,
    playlists, etc.
-   GUI for mpd.
-   Recursive HTTP sites downloader (like `wget -m`{type="bash"} or
    Teleport Pro).
-   Window Manager for sure.
-   Tree-like tabs display, like Tab++ but sanely working.

### Azoth

\
\

-   Make history plugin more user-friendly: search, date filter, etc.
-   Implement XEPs of your like in QXmpp, for examples, some of the red
    ones in the XEP matrix on [Azoth Xoox](/plugins-azoth-xoox)'s page.
-   MSN, ICQ, Gadu-gadu or any other protocol you want.
-   Vkontakte/Facebook plugins with friends' list, photos and comments.

### Poshuku

\
\

-   Support for bookmarks/etc exchange with your favorite social
    bookmarking service like Read It Later (Poshuku OnlineBookmarks is
    to be extended for that).
-   Shortcuts for clickable elements on a web page, like those that
    appear when pressing Ctrl in Arora.
-   Speed dial.
-   Opera-like on/off for pictures.

\
\
Anyway, think about [contacting us](/contact-us).

### But I'm not a programmer!

\
\
That's OK. If you are into drawing stuff, you could design an icon set,
emoticons set, or such. If you know some languages but English or
Russian, you could help with translations. In either case, please just
use LeechCraft, report your ideas, suggestions, tell us about your
experience and feelings.\
\
And, of course, help us to build a community, stay around in our XMPP
conference,
[leechcraft@conference.jabber.ru](xmpp:leechcraft@conference.jabber.ru),
chat around, answer newbies' questions and such. You can't imagine how
it helps when there is at least a person or two that can help you with
all that support-related stuff so that you can free a bit of time and
context switches to write a bit more code.

Project
-------

### Why do you write another browser (torrent client, RSS reader, etc), there is Chrome/Firefox/Opera/whatever?

\
\
Firstly, it's not a browser (or a torrent client, or whatever) with just
some additional plugins. The project has quite another goal (see the
next question).\
\
Of course, we could use some external browser like Firefox or Chrome,
but in order to achieve the goal of the project, we should have a
browser plugin we can fully control and adapt to LeechCraft concepts.
The same applies to every other plugin we have, basically.

### OK, so what's the goal of the project?

\
\
Our goal is to bring a usable and handy all-in-one (but modular)
application that would cover most Internet and common desktop tasks,
like browsing, IM, news or media playback.\
\
Implementing a whole Desktop Environment is also in the roadmap. For
that, just some plugins like window manager and support for running
external applications inside LeechCraft should be added. Unfortunately,
that would be a \*NIX-only thing.

### Aha! All-in-one application, that's not Unix-way!

\
\
By saying "all-in-one" we mean end-user experience.\
\
Architecturally, it's modular and split into different parts, where each
module does one thing, and tries to do it well. These modules
communicate via a global LeechCraft-wide message bus. Of course, the
modules don't use UNIX pipes for communication: in the era of GUI
applications using UNIX pipes with text-only data transfers is either
extremely inefficient or not usable at all if one makes an application
like LeechCraft, with modules abstracted from each other and from the
core. One would need to define a quite low-level and abstract protocol
for communication, based on something like JSON or XML. This text-based
protocol would be used for defining GUI and transferring info about GUI
events, and there is no need to say how that would slow things down.\
\
To sum up, LeechCraft is split into different modules, communicating
with each other via a standard message bus.

### Why do you invent a bicycle and then try to turn it into a robotized swiss knife?

\
\
Just for fun. We have a chance to plan, build and implement some things
right from scratch, experimenting with different ideas and playing with
various concepts. And, well, we hope that these experiments would
produce some interesting and usable results.

### I think feature X is top priority and you should do it ASAP instead of all your crap

\
\
Seems like you think that opensource is like commercial development, but
with free resulting product. Well, you are wrong. We write what you get
as a hobby, and we do implement what we feel like is interesting and
fun. There is no fixed, approved and unchangeable roadmap, and, of
course, there are no deadlines: we have enough pressures in the real
life. So, if a feature is heavily worked on, that's because the one who
develops it found it to be useful for him, or just decided that it'd be
fun to implement it, but not because somebody ordered him to do that.\
\
So, as soon as someone with required skills is found who is interested
in implementing the feature, it'd be worked on.\
\
Nevertheless, please suggest your ideas. If you request something that
one of us finds interesting to implement, we will surely do it.

### But feature X would bring you lots of users!

\
\
To be honest, we don't care. We code for fun and self-development, not
for popularity, fame or such.

### Everybody wants fame, don't lie

\
\
You are bad at psychology.

### Regarding deadlines... When feature X would be implemented and version Y released?

\
\
When it's ready.\
\
We have the ability to focus on quality, not on fixed release dates, so
we won't release unpolished things just because of some special date.\
\
Moreover, we should eat, so we go to work, and some of us study, so we
can't predict when we'd have enough time, energy and will to fire up
text editor and write some lines of code.

### Why can't I use standalone application for each task?

\
\
You can, nobody's forcing you to use LeechCraft. Nevertheless, we
encourage you to try LeechCraft out to see whether it would be more
handy for you then a set of poorly integrated standalone applications.
Also, please report features that you miss in LeechCraft for us to make
it even better, so that you won't ask questions like this.

### Why did you chose such names for plugins? Please change them to something sane.

\
\
The names are no more cryptic then ones like Firefox, Chrome, Deluge,
Liferea or whatever. It's just a matter of habit.

### I've downloaded Windows version, and it's total crap

\
\
Well, Windows version isn't the thing that we are focused on due to the
lack of Windows developers. Thus, Windows version will most likely have
more bugs and lack some features present in builds for other OSes.

### OK, I want integration with Firefox

\
\
Whatever you mean by these words, we will do it when we have all other
tasks completed and goals achieved.

### I want some feature implemented

\
\
Please [contact us](/contact-us).

Code & technical issues
-----------------------

### Why you've chosen C++?

\
\
Well, there are several reasons behind this decision.

-   It's better than C for anything but low-level system development.
-   It's better than Python, Ruby or other similar interpreted languages
    for such complex applications that should run as long as the user is
    logged on (provided you are good enough C++ programmer to write a
    stable code with little to no memory leaks).
-   *Lead developer:* I was unaware about Haskell or OCaml at the moment
    of starting the project, and if I started LeechCraft now, I would
    definitely chose one of those.

### Why you've chosen Qt?

\
\
Since we've already chosen the primary language, the question is what's
the most suitable framework for C++. We rejected Gtk, wxWidgets and
other libraries in favour of Qt since Qt provides not only a widget set,
but a lot more: from metaobjects and reflection to XML parsers, SQL
helpers, networking, and such. It's a solid foundation for such
application as LeechCraft.

### Will you ever implement running LeechCraft plugins as standalone applications?

\
\
Short answer: no.\
\
Long answer: it's already possible in some sense: you can use LeechCraft
core to run any single plugin (or any set of plugins) you want. Use
`leechcraft -P path/to/plugin.so`{type="bash"} for that. Please note
that this way LeechCraft won't load plugin's dependencies, you need to
specify them manually. Please also note that LeechCraft won't check
whether it's already running, and it would always start a new instance
being invoked this way. Thus, you may end up running several instances
of one plugin, and, for example, you may get the corresponding settings
files corrupt. And when we give the short answer mentioned previously,
we mean that we will never implement the corresponding checks, for
example, and we won't "fix" the problems mentioned here, since they are
not actually problems.

Plugins
-------

### Azoth can't connect to my GoogleTalk account

\
\
Use port 5222 instead of 5223.

### Azoth doesn't store passwords

\
\
Install the SecMan plugin.