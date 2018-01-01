---
title: Development digest &num;21
tags: digest, 0.6.x
published: 2012-04-17T11:04:24

---

Since previous development digest we've introduced 4 new plugins, and we
feel like it's just the time to make another one digest.

\[img\_assist|url=images/otlozhu-1.png|title=Otlozhu|align=left|link=1|width=220\]

One of the new plugins is [Otlozhu](/plugins-otlozhu) — a GTD-inspired
TODO manager. It won't be an all-in-one PIM/organizer, so don't expect
schedules, events, meetings, address books and stuff like that in it.
It's point is to be a simple a clean way of keeping tracks of things
you've got to do. Like GTD suggests, the less time you spend organizing
your organizer, the better. For now it supports tagging items,
(optional!) due dates, notifications, percentage of completeness,
sorting and filtering by tags.

\[img\_assist|url=images/xproxy-1.png|title=XProxy|align=left|link=1|width=220\]

Other plugin is [XProxy](/plugins-xproxy) which is an advanced proxy
configurator, allowing to configure proxies on a per-host and per-port
basis.

Two other plugins are rather hidden most of the time. First is
[Dolozhee](/plugins-dolozhee) which is a bug reporting and feature
requesting tool — basically, a client for our issue tracker. The other
one is KBCraft which supports keeping track of what keyboard layout is
active for which tab, so that different tabs can have different keyboard
layouts.

Among other changes:

- Core: filtering modules in plugin manager widget.
- [Advanced Notifications](/plugins-advancednotifications): support
  for Organizer event type.
- Advanced Notifications: possibly fixed fonts generation (once more).
- [Aggregator](/plugins-aggregator): added Mark All As Read action.
- Aggregator: proper indexes are expanded on feed addition, fixes
  [\#211](http://dev.leechcraft.org/issues/211).
- [Auscrie](/plugins-auscrie): support for making overlay and whole
  desktop screenshots.
- Auscrie: fixed dump.bitcheese.net uploader.
- Auscrie: support hiding the dialog.
- [Azoth](/plugins-azoth): plugins now support split build.
- Azoth: hardlimit for 4 variant icons, fixes
  [\#440](http://dev.leechcraft.org/issues/440).
- Azoth: client icons are properly sorted by priority.
- [Azoth Acetamide](/plugins-azoth-acetamide): commands 323 and 338
  are now supported.
- [Azoth ChatHistory](/plugins-azoth-chathistory): more clear search
  match highlights.
- [Azoth Xoox](/plugins-azoth-xoox): support for
  XEP-0232 parsing/generation.
- Azoth Xoox: handling/displaying XEP-0232 info in Service Discovery.
- Azoth Xoox: text from muc\#roominfo\_description is used in SD now.
- Azoth Xoox: even more efficient vCard requests.
- Azoth Xoox: remember entered JID/password on in-band account reg.
- Azoth Xoox: fixed several segfaults.
- Azoth Xoox: configurable minimum height of message edit field.
- [BitTorrent](/plugins-aggregator): torrent icon for items
  in Summary.
