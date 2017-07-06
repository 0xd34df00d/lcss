---
title: Laughty
tags: laughty
published: 2013-12-13T13:27:52
shortdescr: simple D-Bus user session daemon for desktop notifications

---

Laughty is a simple D-Bus user session daemon for desktop notifications.
It listens for notifications from other applications via the libnotify
D-Bus protocol and uses standard LeechCraft modules like
[AdvancedNotifications](/plugins-advancednotifications) and
[Kinotify](/plugins-kinotify) to display the notifications.

Features
--------

The following features from the D-Bus protocol are supported:

- Actions in notifications.
- HTML markup in notifications text.
- Images in notifications text.
- Persistent notifications (with
  [AdvancedNotifications](/plugins-advancednotifications)).

Additionally, the
[AdvancedNotifications](/plugins-advancednotifications) module can be
used to configure notification parameters for different
notifications depending on their categories, text, etc.
