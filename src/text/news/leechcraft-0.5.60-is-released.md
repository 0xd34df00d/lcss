---
title: LeechCraft 0.5.60 is released!
tags: release, 0.6.x
published: 2012-03-15T11:40:56

---

We haven't published any development digests since LeechCraft 0.4.95,
and it's time to fill the gap, since the first milestone of the new
0.6.x series, LeechCraft 0.5.60 "Hibernating Reason", is released
today!

So, since 0.4.95 we've introduced a bunch of new plugins. Most
importantly, the following protocol plugins have been added to
[Azoth](/plugins-azoth):

- [Astrality](/plugins-azoth-astrality), our Telepathy
  abstraction layer. Particularly, it allows to use protocols provided
  by *libpurple* via the *telepathy-haze* connection manager, like
  ICQ, AIM, Gadu-gadu, Yahoo and a bunch of others.
- [Vader](/plugins-azoth-vader), an implementation of the Mail.Ru
  Agent protocol. It currently supports extended statuses, sending
  SMS, attention requests, user tune, message delivery receipts,
  mailbox notifications and other features of the protocol.
- [Zheet](/plugins-azoth-zheet), for the MSN protocol. It supports
  pretty much the same features.

The Sidebar plugin has been added. It displays a sidebar with actions
for quickly opening new tabs, and it also displays currently opened tabs
and allows to switch between them. If there are more than three tabs of
some kind (like web browser tabs), they are folded into single action to
avoid cluttering up the sidebar. It also incorporates something like a
tray area, where other plugins may embed their actions or status icons.
It is planned that some day Sidebar would supersede our current tabbar.

One of such plugins that embed actions into Sidebar is our new power
manager plugin, [Liznoo](/plugins-liznoo). It displays battery status in
Sidebar's tray, and it also detects when computer goes to sleep or
resumes and notifies other plugins about these events. This way
[Azoth](/plugins-azoth) can gracefully close connections to servers on
hibernating and resume just as gracefully when returning from sleep.
Liznoo also supports displaying history of battery charge and power
consumption as well as notifications about low battery charge. It also
allows user to make the machine go to sleep mode or hibernation.

Session management is now centralized and performed by the
[TabSessManager](/plugins-tabsessmanager) plugin. This means in near
future even things like Azoth chat tabs will be recovered on LeechCraft
start. Global centralized tab unclose manager is also on its way.
TabSessManager also supports explicitly named sessions, so that one can
save a bunch of interesting tabs in a named session and restore them
later.

\[img\_assist|url=images/nsm01.png|title=NetStoreManager|align=left|link=1|width=220|height=136\]

[NetStoreManager](/plugins-netstoremanager), plugin for management of
remote network data storages like Yandex.Disk, has been added. It is
modular, and for now only Yandex.Disk is supported. NetStoreManager
allows to upload files easily from LeechCraft, it maintains a list of
uploaded files and allows to prolongate them (if the service supports
it).

Some other important changes:

- There is an API level check now when loading plugins, so no more
  segfaults because of plugins for previous LeechCraft versions!
- [Azoth Acetamide](/plugins-azoth-acetamide), our IRC protocol
  plugin, plugin got a lot of improvements. Particularly, it now has a
  menu for CTCP operations, and user info is supported.
- [Azoth Xoox](/plugins-azoth-xoox), the XMPP protocol plugin, now
  allows to add download tasks remotely via the Ad-Hoc Commands XEP.
  It also got support for message forwarding. It also doesn't request
  vCards and versions in MUCs via gateways anymore. Support for emails
  and phones in vCard dialog was also added.
- [Aggregator](/plugins-aggregator) now updates its feeds in a
  separate thread. No more freezes on update! Marking whole channels
  as read or unread is also performed in a separate thread.
- Added importers from Psi+, Vacuum and Kopete to [New
  Life](/plugins-newlife).
- A bunch of fixes in [Azoth AdiumStyles](/plugins-azoth-adiumstyles),
  so the support for themes is almost fully compliant now. Themes like
  Renkoo or Satin look really nice!
- Tabs pinning has been moved to a separate plugin — Pintab.
- Added GActs, a plugin for global shortcut management, so Azoth now
  finally has a global shortcut for viewing next unread message.
- LeechCraft now uses global system iconsets instead of carrying one
  with it. Oxygen or KFaenza are recommended!

Among other changes:

- Added Poshuku Pogooglue plugin for quick googling of selected text.
- Added Azoth Keeso plugin for morphing text InTo soMeTHiNg lIKe ThIS.
- Caching in the Resource Loader framework, which should dramatically
  reduce amount of HDD accesses in plugins like Azoth.
- Azoth now understands protocols where a user may have more than one
  permission of the same role in a MUC at a time.
- [Azoth Xoox](/plugins-azoth-xoox) now requests software versions for
  roster items and MUC participants.
- A bit reworked UI of [Azoth](/plugins-azoth).
- Shortcuts for quoting and clearing chat window are now exposed.
- Azoth now has its own fonts configurator.
- More configurable shortcuts everywhere.
- A bunch of protocol and behavior fixes in [Azoth](/plugins-azoth),
  [Azoth Acetamide](/plugins-azoth-acetamide) and [Azoth
  Xoox](/plugins-azoth-xoox).
- Fixed self-presence and self-PEP-events handling in Azoth Xoox.
- Fixed auto upload/download in Poshuku OnlineBookmarks.
- Moved to C++11, so that LeechCraft can only be built now with gcc
  4.5 or later or MSVS 2010 (though, the latter doesn't support a
  couple of plugins). clang isn't supported yet.

You can also check out the
[roadmap](http://dev.leechcraft.org/versions/17) for this version for
more bug reports and feature requests that were implemented in this
release!

Source tarball is already available on
[SourceForge](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.60/leechcraft-0.5.60.tar.xz/download).
Packages for supported distros will be available soon.
