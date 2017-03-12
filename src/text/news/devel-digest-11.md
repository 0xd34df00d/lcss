---
title: Development digest #11
tags: digest
published: 2011-09-02T10:47:02

---

We haven't published development digests for almost a month, since we
mostly did administrative issues, like getting into Gentoo repos, and
such. Nevertheless, there is a bunch of changes:

-   [Acetamide](/plugins-azoth-acetamide) now supports configuring
    channels, including chanmods, banlist, except list and invite list.
-   Added support for `/say`{type="bash"} command in
    [Acetamide](/plugins-azoth-acetamide).
-   Support the "Important" tags for items in
    [Aggregator](/plugins-aggregator).
-   Frames with ads are also hidden now in [Poshuku
    CleanWeb](/plugins-poshuku-cleanweb).
-   Added support for running external commands in
    [AdvancedNotifications](/plugins-advancednotifications).
-   Speed up [Aggregator BodyFetch](/plugins-aggregator-bodyfetch) by
    orders of magnitude by caching scripts.
-   Disable unneeded things like JavaScript or images in [Aggregator
    BodyFetch](/plugins-aggregator-bodyfetch) when parsing downloaded
    web pages.
-   Added `KeepAllTags()`{type="javascript"} getter in [Aggregator
    BodyFetch](/plugins-aggregator-bodyfetch) supported scripting API.
-   [Poshuku CleanWeb](/plugins-poshuku-cleanweb) now supports the
    `third-party`{type="bash"} attribute in filter lists.
-   Optimized [Poshuku CleanWeb](/plugins-poshuku-cleanweb) a bit: plain
    strings are matched using plain string matching algorithms instead
    of wildcard matching.
-   Allow to load default rules set in
    [AdvancedNotifications](/plugins-advancednotifications).
-   Finally [AdvancedNotifications](/plugins-advancednotifications) is
    considered stable enough for the save procedure to be uncommented.
-   Draw own avatar and protocol icon in [Azoth](/plugins-azoth)'s
    contact list.
-   Automatically fix channel names in
    [Acetamide](/plugins-azoth-acetamide) by prepending `#` if it's
    not present.
-   Support `/leave`{type="bash"} command in [Azoth](/plugins-azoth).
-   Added "Quote" action in [Azoth](/plugins-azoth).
-   Show free space in [BitTorrent](/plugins-bittorrent) when
    adding files.
-   Moved data processing back to main thread in [Aggregator
    BodyFetch](/plugins-aggregator-bodyfetch), thus some thread-related
    bugs in QtWebKit don't occur anymore.
-   A whole class of bugs has been fixed, when an object mentioned in a
    notification was already deleted by the time the user activates
    the notificaton.
-   Handle self vcards correctly in [Azoth Xoox](/plugins-azoth-xoox).
-   Correctly handle content resend errors in
    [Poshuku](/plugins-poshuku).
-   Some micro improvements in [Azoth](/plugins-azoth): dynamically
    detect rename ability, respect lack of MUC support in protocols,
    don't suggest registering with "Metacontacts" protocol.
-   Fixed support for notifying about each conference message from
    [Azoth](/plugins-azoth) in
    [AdvancedNotifications](/plugins-advancednotifications).
-   Fixed handling of the Ctrl+C shortcut in [Azoth](/plugins-azoth).
-   Fixed FlashOnClick in [Poshuku CleanWeb](/plugins-poshuku-cleanweb).
-   Fixed ordering of links in [Azoth p100q](/plugins-azoth-p100q).
-   Fixed dependencies calculation in Core.
-   Optimized contact list delegate in [Azoth](/plugins-azoth).
-   Lots of fixes in [Acetamide](/plugins-azoth-acetamide).
-   Show localized plugin descriptions in Core plugin manager.
-   Migrated to new signal/slot-style hooks in Core.
-   Initial support for Qt 4.8.

\
\
Plugins for site mirroring (Otzerkalu) and libvlc-based media player are
also in progress, but they are currently not merged in the master
branch. And maybe the first one, Otzerkalu, would be in the 0.5
release.\
\
We've also begun considering implementing the VFS and dashboard in
LeechCraft. But unfortunately since current support for VFS
implementations in Qt is declared deprecated and nothing has been
proposed instead, the VFS development is currently halted.\
\
While it's all clear what VFS should be, things are a bit more
complicated with the dashboard. The best analogue of it among the
already-existing and stable projects is possibly KDE's Plasma workspace.
What we are currently thinking about is a plugin that allows to open
tabs populated with different widgets written in either QML or
plain-old-good C++ (or, of course, Python and other scripting languages
supported by LC). There will be a whole news item dedicated to dashboard
things soon.