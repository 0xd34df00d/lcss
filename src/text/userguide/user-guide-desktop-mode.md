---
title: Desktop mode
tags: desktop mode
published: 2013-11-28T20:12:33
parentPage: user-guide
---

This page documents desktop mode available in LeechCraft starting from
somewhere around 0.6.60 version. It is available only on X11.

Plugins
-------

\
\
Desktop mode is activated by adding `--desktop` switch to the LeechCraft
command line. This switch affects both LeechCraft core (how main windows
are created) and several plugins. Particularly, [Fenet](/plugins-fenet),
[KBSwitch](/plugins-kbswitch) and [Mellonetray](/plugins-mellonetray)
aren't activated without `--desktop` even if they are loaded.\
\
[Fenet](/plugins-fenet) plugin is responsible for autostarting window
manager and possibly a compositing manager. It also installs a
`.desktop` file for login managers to use to properly start LC.\
\
[KBSwitch](/plugins-kbswitch) serves as keyboard layout configurator. It
allows configuring the list of keyboard layouts as well as various
options, like the button for groups switching, the compose key, etc.\
\
[Krigstask](/plugins-krigstask) provides a taskbar and pager quark for
[SB2](/plugins-sb2).\
\
[Mellonetray](/plugins-mellonetray) provides a system tray area quark
for [SB2](/plugins-sb2).

Screenshots
-----------

\
\
LeechCraft running in desktop mode:
\[img\_assist|url=images/lcdesktop01.png|title=|align=inline|link=1|width=440\]\
\
[Fenet](/plugins-fenet) settings:
\[img\_assist|url=images/fenet01.png|title=|align=inline|link=1|width=440\]
[KBSwitch](/plugins-kbswitch) settings:
\[img\_assist|url=images/kbswitch01.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/kbswitch02.png|title=|align=inline|link=1|width=440\]