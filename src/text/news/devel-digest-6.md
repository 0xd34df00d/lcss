---
title: Development digest &num;6
tags: digest
published: 2011-06-25T22:47:37

---

Last 10 days we mostly focused on Azoth and, in particular, on
implementing various handy and fancy XEPs in the XMPP implementation.
Plugins for embedding media elements into Azoth chats, antispam and
ignore plugin have also been added. So, the features list follows:\
\

-   Support IM protocols in [Azoth](/plugins-azoth) supporting user
    mood, user activity and user tune, with the ability to change them
    as well.
-   PubSub/PEP support in [Azoth Xoox](/plugins-azoth-xoox), in
    particular:
    -   [XEP-0163: PEP](http://xmpp.org/extensions/xep-0163.html)
    -   [XEP-0107: User Mood](http://xmpp.org/extensions/xep-0107.html)
    -   [XEP-0108: User
        Activity](http://xmpp.org/extensions/xep-0108.html)
    -   [XEP-0118: User Tune](http://xmpp.org/extensions/xep-0118.html)
-   Added Azoth Xtazy, plugin for publishing current user tune. Supports
    MPRIS-compatible players and file data source.
-   Support for in-band registration
    ([XEP-0077](http://xmpp.org/extensions/xep-0077.html)) in [Azoth
    Xoox](/plugins-azoth-xoox).
-   Privacy lists support in [Azoth Xoox](/plugins-azoth-xoox)
    ([XEP-0016](http://xmpp.org/extensions/xep-0016.html)).
-   Introduced a new plugin for embedding media objects like YouTube
    videos into chat windows *(thanks Nobodyzzz)*.
-   Added Azoth Autopaste plugin for automatically sending long messages
    to pastebins and sending the link to the paste instead of the
    text itself.
-   Azoth Depester, plugin for ignoring specific participants in
    multiuser chatrooms.
-   Azoth Herbicide, a basic antispam plugin.
-   Reworked handling of contacts that have just requested authorization
    or that aren't present in our contact list at all. In particular,
    messages from unauthorized contacts or from contacts that haven't
    been added are handled now.
-   Support for legacy Entity Time XEP
    ([XEP-0090](http://xmpp.org/extensions/xep-0090.html)) in [Azoth
    Xoox](/plugins-azoth-xoox) with a small easter egg.
-   [Azoth](/plugins-azoth): implemented protocol console, in
    particular, XML console for the [XMPP protocol
    plugin](/plugins-azoth-xoox).
-   [Azoth Xoox](/plugins-azoth-xoox) now supports legacy forms when
    registering on gateways and on XMPP servers.
-   Fixed regexp for detecting links in Azoth chats, so that, for
    example, magnet or git links are also detected now
    *(thanks Akon32)*.
-   [Azoth p100q](/plugins-azoth-p100q) plugin now allows to unsubscribe
    from psto directly from comments or posts *(thanks Ignotus)*.
-   Improved insertion of nicks in message line edit in Azoth
    *(thanks Akon32)*.
-   Fixed some segfaults and UI bugs in Azoth: it doesn't segfault now
    on empty contact addition.