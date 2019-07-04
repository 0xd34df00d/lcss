---
title: Liznoo
tags: plugins, liznoo
published: 2013-12-30T07:55:58
shortdescr: the LeechCraft power manager

---

Liznoo is the LeechCraft power manager.

`{ "name": "835321.png", "align": "inline", "title": "Battery state icon" , "thumb" : "medium" }`{.img}

`{ "name": "liznoo01.png", "align": "inline", "title": "Battery history" , "thumb" : "medium" }`{.img}

Features
--------

- Displays battery status in LeechCraft tray.
- Displays battery charge and power consumption history.
- Notifies other plugins about sleep and resume events. This way
  plugins like [Azoth](/plugins-azoth) can disconnect from servers
  gracefully on hibernation and reconnect properly on startup.
- Allows other plugins like a video player to prohibit screensaver.
- Allows user to put the system to sleep or hibernation.
- Notifications when the computer starts discharging or charging.
- Notifications when the battery charge is low.

Backends
--------

- UPower on Linux.
- WinAPI on WIndows.
- Native API on FreeBSD.
- Native API on Mac OS X.
