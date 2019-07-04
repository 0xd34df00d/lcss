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
`{ "name": "lcdesktop01.png", "align": "inline", "title": "" , "thumb" : "medium" }`{.img}\
\
[Fenet](/plugins-fenet) settings:
`{ "name": "fenet01.png", "align": "inline", "title": "" , "thumb" : "medium" }`{.img}
[KBSwitch](/plugins-kbswitch) settings:
`{ "name": "kbswitch01.png", "align": "inline", "title": "" , "thumb" : "medium" }`{.img}
`{ "name": "kbswitch02.png", "align": "inline", "title": "" , "thumb" : "medium" }`{.img}
