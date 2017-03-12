---
title: LeechCraft 0.4.80 is released
tags: 0.5.x, release
published: 2012-02-09T08:45:46

---

LeechCraft milestone 0.4.80 "Cow Killer" is just released!\
\
This milestone mainly focuses on the [Azoth](/plugins-azoth) IM client
and the XMPP protocol implementation [Azoth Xoox](/plugins-azoth-xoox).\
\
Among the most important changes are:\
\

-   Added support for media calls in Azoth.
-   Added experimental Jingle implementation in Azoth Xoox.
-   Introduced antispam module and module for ignoring multiuser
    conferences' participants.
-   Implemented [PEP](http://xmpp.org/extensions/xep-0163.html) and some
    corresponding XEPs in Azoth Xoox: [User
    activity](http://xmpp.org/extensions/xep-0108.html), [User
    mood](http://xmpp.org/extensions/xep-0107.html), [User
    tune](http://xmpp.org/extensions/xep-0118.html).
-   Added a plugin for publishing currently playing tune. Now only
    MPRIS-compatible players are supported.
-   Implemented [In-Band
    Registration](http://xmpp.org/extensions/xep-0077.html) in Azoth
    Xoox, so it's possible now to register Jabber accounts right from
    the client.
-   [Privacy Lists](http://xmpp.org/extensions/xep-0016.html) are now
    supported in Azoth Xoox.
-   Added support for [Ad-Hoc
    Commands](http://xmpp.org/extensions/xep-0050.html) in Azoth Xoox.
-   Introduced Azoth Rosenthal, a module providing spellchecker for
    Azoth chat windows. Myspell/Hunspell dictionaries are used.
-   Introduced Azoth EmbedMedia for showing media objects like flash
    video or images directly in chat windows.
-   Added Azoth Autopaste for automatically pasting long texts to
    pastebins and replacing them with the corresponding links.
-   Implemented [Message Delivery
    Receipts](http://xmpp.org/extensions/xep-0184.html) and
    [Attention](http://xmpp.org/extensions/xep-0224.html) in Azoth and
    Azoth Xoox.
-   Introduced a new module, Poshuku Keywords, for URL shortcuts.
-   Added XML console in Azoth.
-   LeechCraft settings are now configured via a tab instead of
    a dialog.
-   Lots of small improvements and bugfixes.

\
\
We've also begun working on the new notifications infrastructure, and
that has been described in details in the [corresponding
digest](/devel-digest-5).\
\
Those interested can view all the major changes in the corresponding
digests ([\#4](/devel-digest-4), [\#5](/devel-digest-5),
[\#6](/devel-digest-6), [\#7](/devel-digest-7)), while even more curious
could just do `git log 0.4.75..0.4.80`{type="bash"}.\
\
Packages are already available for Ubuntu Lucid, Maverick and Natty
(and, thus, Debian testing/unstable). Gentoo ebuilds are also available.
Packages for Fedora and openSUSE would be built a bit later.\
\
By the way, since the last milestone about a month ago, LeechCraft was
included into official repositories of openSUSE and RFR.\
\
And now some screenshots:\
\
\[img\_assist|url=images/azoth\_pep1.png|title=PEP in
Azoth|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/adhoc01.png|title=Ad-Hoc
commands|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/adhoc02.png|title=Ad-Hoc
commands|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/azoth\_console1.png|title=XML
console|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/settings1.png|title=Settings, general
view|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/settings2.png|title=Specific
settings|align=inline|link=1|width=440\]