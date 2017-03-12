---
title: Development digest #15
tags: digest
published: 2011-11-01T22:21:17

---

In the last couple of weeks we mostly fixed bugs, but a few new
interesting features were also introduced. Firstly, a small plugin
called KnowHow was added, which displays tips of the days on startup.
Then, Ignotus made a lot of stuff in Potorchu, our libvlc-based media
player, and it even was renamed to Laure. Finally, Poshuku migrated to
another kind of web view, resultin in a slight performance increase.\
\
But those are not all the changes! So here is the more or less full
list:\
\

-   Added KnowHow plugin for displaying tips of the days on startup.
-   Potorchu, our libvlc-based media player, was renamed to Laure and
    got so many improvements that it's hard to describe them all here.
-   [AdvancedNotifications](/plugins-advancednotifications) now supports
    enabling/disabling rules and single shot rules.
-   [Poshuku](/plugins-popishu) now supports enabling WebGL for
    corresponding QtWebKit versions. And it really works!
-   [Poshuku](/plugins-popishu) migrated to QGraphicsView-based web
    view, resulting in a bit increased performance, especially with
    effects-rich CSS3-(ab)using web sites.
-   [Azoth](/plugins-azoth) and [Azoth Xoox](/plugins-azoth-xoox) now
    support inviting to MUCs.
-   [Azoth](/plugins-azoth) now supports dragging contacts
    between groups.
-   Files could be sent via IM by dropping them on
    corresponding contacts.
-   Metacontacts could be created by dropping contacts on other contacts
    in [Azoth](/plugins-azoth).
-   [Azoth AdiumStyles](/plugins-azoth-adiumstyles) now supports
    variants for styles.
-   [Azoth](/plugins-azoth) now allows one to disable the display of
    contact statuses.
-   Core now supports tooltips for settings items.
-   "Diagnostic info" tab in Core.
-   More agressive caching of resources in core and Kinotify so that
    much less disk access is required now. Improves performance and
    battery life in notebooks a bit, preventing necessary HDD spinups.
-   Lots of small fixes for Otzerkalu.
-   Saner buddy avatar display in chat tab in [Azoth](/plugins-azoth).
-   Lots of other small fixes in [Azoth](/plugins-azoth).
-   Fixed themes that include much external resources from disk in
    [AdiumStyles](/plugins-azoth-adiumstyles).
-   Some fixes for Poshuku OnlineBookmarks.
-   [LackMan](/plugins-lackman) now works with Windows.