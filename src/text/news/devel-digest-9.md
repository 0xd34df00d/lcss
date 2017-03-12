---
title: Development digest #9
tags: digest
published: 2011-07-21T18:16:45

---

On last week a huge and long-awaited change has been incorporated into
LeechCraft main source tree: Chrome-style tabbar. Well, actually it's no
so Chromish, as the title bar is still present and not replaced by tabs.
The new tabbar is placed above the tab toolbar, which is more intuitive,
and it also contains the menu button and quick launch area, so there is
no need for a separate toolbar for that anymore, and that frees space a
lot. The new tabbar system also supports pinning tabs, but currently the
pinning state isn't saved between launches.\
\
\[img\_assist|url=images/tabs01.png|title=New
tabs|align=inline|link=1|width=440\]\
\
Unfortunately, Tab++ still doesn't work with the new tabs, but hopefully
that would be fixed soon.\
\
Thanks to some fixes in [Azoth Xoox](/plugins-azoth-xoox), XMPP protocol
now should be much more robust, and PEP-based features should work with
ejabberd-based servers as well.\
\
There are lots of other changes as well, among them:\
\
\[img\_assist|url=images/tabslist01.png|title=TabsList|align=left|link=1|width=220\]\
\

-   Added Azoth LastSeen for client-side recording of contacts' last
    online and availability time.
-   Added new module, TabsList, that allows one to show the list of
    currently opened tabs and quickly select one of them.
-   Glance feature moved from the Core to a separate plugin
    *(thanks Maledictus)*.
-   Added full support for CAPTCHA-protected rooms in [Azoth
    Xoox](/plugins-azoth-xoox): no links should be clicked now to
    enter CAPTCHA.
-   [Azoth](/plugins-azoth) now loads last few messages (amount
    is configurable) from the history when opening new chat.
-   Begun work on nice QML-based popup for tray notifications in the
    AdvancedNotifications module.
-   Begun work on metacontacts support.
-   Laid foundation for PGP support in [Azoth](/plugins-azoth) and
    [Azoth Xoox](/plugins-azoth-xoox) *(thanks Alex Ermolov)*.
-   Added actions for viewing VCard and history to chat tab toolbar.
-   Added smiles chooser to message formatter bar in chat tabs.
-   Added buttons for recommending and adding to bookmarks for posts and
    comments in [Azoth p100q](/plugins-azoth-p100q).
-   Number of MUC participants is shown now in MUC chat tabs.
-   A huge fix for entity caps in [Azoth Xoox](/plugins-azoth-xoox): now
    they are calculated correctly.
-   Fixed spaces after some commands in [Azoth
    p100q](/plugins-azoth-p100q).
-   Fixed status changes and status handling in [Azoth](/plugins-azoth).
-   ShellOpen now offers to open things by notification instead of a
    modal dialog. Less annoying.
-   Fixes and kludges in FB2 export feature in
    [Aggregator](/plugins-aggregator).
-   Fixed quite a big memory leak in tabs tooltip handling.
-   Fixed leaking toolbars in Azoth.
-   Lots of bugfixes in [Azoth Acetamide](/plugins-azoth-acetamide).
-   Azoth HiLi doesn't check big message bodies for highlights now.

\
\
*This digest was against 0.4.80-539-gb671ae4 as HEAD.*