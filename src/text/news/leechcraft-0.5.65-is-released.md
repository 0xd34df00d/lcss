---
title: LeechCraft 0.5.65 is released!
tags: release, 0.6.x
published: 2012-04-21T18:05:19

---

Today LeechCraft 0.5.65 «Dreams Without Courage» is released!\
\
This release features some new plugins:

-   [Dolozhee](/plugins-dolozhee) — bug reporting and feature requesting
    tool for LeechCraft.
-   KBCraft — keyboard layout manager, allowing to keep separate layouts
    for each plugin or even tab.
-   [Otlozhu](/plugins-otlozhu) — a simple GTD-inspired TODO manager.
-   [XProxy](/plugins-xproxy) — an advanced proxy configurator.

\
\
Among significant changes and fixes in already existing plugins:

-   [LackMan](/plugins-lackman), our package manager, got a major UI
    update and general overhaul. It's much faster now, and it also works
    on Windows!
-   Tab unclosing system has been implemented globally in the
    [TabSessManager](/plugins-tabsessmanager) plugin (and
    [Azoth](/plugins-azoth) supports it!).
-   [Azoth Xoox](/plugins-azoth-xoox), the XMPP protocol implementation,
    now properly caches entity capabilities, vCards and other
    similar information. This allows to reduce considerably the amount
    of used bandwidth.
-   As always, there are lots of fixes and improvements in [Azoth
    Acetamide](/plugins-azoth-acetamide), our IRC
    protocol implementation.
-   Choosing chat window style and its variant is much more handy now —
    only variants relevant to the selected theme are shown.
-   Full support for XEP-0232 in Azoth Xoox.
-   Configurable minimal message editor height in Azoth.
-   Improved Auscrie — support for full desktop and overlay screenshots
    as well as fixed dump.bitcheese.net uploader.

\
\
As always, you can read the corresponding development digests:
[\#20](/devel-digest-20), [\#21](/devel-digest-21),
[\#22](/devel-digest-22) if you need more information about changes.\
\
Packages for supported distros and OSes will be available soon. Source
archive is already available [at
SourceForge](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.65/leechcraft-0.5.65.tar.xz/download).\
\
Stay tuned! I hope we'd roll out something interesting for 0.5.70 in a
month or even less!