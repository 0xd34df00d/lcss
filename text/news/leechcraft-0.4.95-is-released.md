---
title: LeechCraft 0.4.95 is released
tags: 0.5.x, release
published: 2011-11-27T21:00:52

---

LeechCraft milestone 0.4.95 "Bet It All on Black" is released.

This is the last milestone before the 0.5.0 containing new features.
Further milestones (0.4.96-0.4.99) would bring only bugfixes, if any.

The development for post-0.5.0 times continues in the *master* branch,
while things for the 0.5.0 release are getting stabilized in the *0.5.0*
branch. Beware when you'd checkout sources next time :)

So, let me list some major features and improvements since the 0.4.90
release:

- Support for [XEP-0055: Jabber Search](http://xmpp.org/extensions/xep-0055.html) in
  [Azoth Xoox](/plugins-azoth-xoox).
- Reworked Poshuku OnlineBookmarks: it's almost rewritten
  from scratch. Particularly, it now supports its own plugins, and
  exact bookmark services are implemented as plugins. Currently
  supported services are Read It Later and Del.icio.us.
- Implemented Azoth OTRoid for supporting
  [Off-The-Record](http://www.cypherpunks.ca/otr/) messaging system in
  [Azoth](/plugins-azoth).
- [Aggregator](/plugins-aggregator) now queues updates of feeds
  instead of updating them all at once: no more lags on update!
- Added KnowHow plugin for displaying tips of the days on startup.
- [AdvancedNotifications](/plugins-advancednotifications) now supports
  enabling/disabling rules and single shot rules.
- [Poshuku](/plugins-popishu) now supports enabling WebGL for
  corresponding QtWebKit versions. And it really works!
- [Poshuku](/plugins-popishu) migrated to QGraphicsView-based web
  view, resulting in a bit increased performance, especially with
  effects-rich CSS3-(ab)using web sites.
- [Azoth](/plugins-azoth) and [Azoth Xoox](/plugins-azoth-xoox) now
  support inviting to MUCs.
- [Azoth](/plugins-azoth) now supports some operations via
  drag-n-drop, like moving contacts between groups, sending files to
  contacts and uniting contacts into metacontacts.
- Considerably improved [Azoth
  AdiumStyles](/plugins-azoth-adiumstyles): added support for style
  variants and lots of compatibility improvements.
- Added the "Group send" feature to [Azoth](/plugins-azoth).
- `{ "name": "icons1.png", "align": "right", "title": "Poshuku hover   box", "thumb": "small" }`{.img}[Poshuku](/plugins-poshuku):
  display links on hover in a nice box on the viewport instead of
  status bar (see the screenshot on the right).
- [Azoth](/plugins-azoth) now has buttons to install more different
  icons/themes in settings.
- Added periodical updates feature to [LackMan](/plugins-lackman).
- Added Poshuku Pogooglue plugin for instantly searching selected text
  in Google.
- Added *Gajim* style to Azoth StandardStyles.
- Added context menu for nicknames in MUCs in [Azoth](/plugins-azoth).
- [Azoth](/plugins-azoth) now can optionally append a message to the
  chat view whenever participant ends the conversation.
- It is possible now to disable sending "conversation ended" chat
  participant state events in [Azoth](/plugins-azoth).
- [Azoth Acetamide](/plugins-azoth-acetamide) now supports
  SSL connections.
- LeechCraft now opens URLs in external applications if those URLs
  couldn't be handled by LeechCraft plugins.
- [Azoth Xoox](/plugins-azoth-xoox) can now handle
  *xmpp:...?message* links.
- Lots of fixes in [Azoth](/plugins-azoth), [Azoth
  Xoox](/plugins-azoth-xoox) and other plugins.
- Lots of fixes for Poshuku OnlineBookmarks.
- Optimized timers in LeechCraft, so that it, for example, on my
  machine it causes CPU wake ups 13-17 times per second instead
  of 50-60.

Moreover, our libvlc-based media player was renamed from Potorchu to
Laure and got a huge portion of code and care, thanks *Ignotus*! Seems
like this media player is already usable a bit, though it didn't get
into this milestone. But it surely will be included in 0.6.0!

And here are all the digests corresponding to this milestone for those
curious ones: [\#13](/devel-digest-13), [\#14](/devel-digest-14),
[\#15](/devel-digest-15), [\#16](/devel-digest-16),
[\#17](/devel-digest-17), [\#18](/devel-digest-18) and
[\#19](/devel-digest-19).

Packages for various Ubuntu versions, for openSUSE, Fedora and ebuilds
for Gentoo would be available soon. Please note that the address of
Ubuntu PPA has changed, so consult the [download
instructions](/download) page to get up-to-date LeechCraft!
