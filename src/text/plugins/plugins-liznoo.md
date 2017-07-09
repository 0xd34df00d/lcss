---
title: Liznoo
tags: plugins, liznoo
published: 2013-12-30T07:55:58
shortdescr: the LeechCraft power manager

---

Liznoo is the LeechCraft power manager.

\[img\_assist|url=images/835321.png|title=Battery state icon|align=inline|link=1|width=440\]

\[img\_assist|url=images/liznoo01.png|title=Battery history|align=inline|link=1|width=440\]

Features
--------

- Displays battery status in LeechCraft tray.
- Displays battery charge and power consumption history.
- Notifies other plugins about sleep and resume events. This way
  plugins like [Azoth](/plugins-azoth) can disconnect from servers
  gracefully on hibernation and reconnect properly on startup.
- Allows other plugins like a video player to prohibit screensaver.
- Allows user to easily sleep/hibernate the system.
- Notifies user when device starts discharging or charging.
- Notifies user on low power level.

Backends
--------

- UPower on Linux.
- WinAPI on WIndows.
- Native ioctl on FreeBSD.
- Native APIs on Mac OS X.
