---
title: LeechCraft 0.4.85 is released
tags: 0.5.x, release
published: 2011-07-22T08:45:57

---

LeechCraft milestone 0.4.85 "Co-tick" is just released!

This milestone is quite raw since it incorporates lots of changes and
new features, but we couldn't help being in hurry to deliver all the new
tasties, so some subtle bugs may manifest themselves suddenly, but don't
hesitate reporting them to us!

The hottest news is that tabs have finally moved to the top of the
window, so that the plugins toolbar is now under them, which is a bit
more intuitive. Tabbar has been merged with main menu and quick launch
area, so about 30 pixels of vertical space has been freed as well, and
the interface now looks cleaner and more mature.

Here's the screenshot of the new interface:

`{ "name": "tabs01.png", "align": "inline", "title": "New tabs", "thumb": "medium" }`{.img}

Eagle-eyed one could notice three little title-less tabs in the left.
Yes, the new tabs interface also supports pinning tabs, but the pinning
state currently isn't saved between LeechCraft launches.

Unfortunately, Tab++ still doesn't work with the new tabs, but hopefully
that would be fixed soon.

We've fixed two bugs in XMPP implementation, so XMPP protocol should be
much more robust now, and things like PEP should really work everywhere,
especially on ejabberd servers. Another important fix is for tooltips:
we don't leak them anymore, so memory consumption growth should be much
slower now.

We've added a bunch of new plugins, most of them for
[Azoth](/plugins-azoth). Here's the list:

- [Aggregator BodyFetch](/plugins-aggregator-bodyfetch) plugin for
  automatic fetching of full news bodies instead of short teasers.
  Segfaults sometimes, but is already usable.
- [Azoth AdiumStyles](/plugins-azoth-adiumstyles) for, well, support
  for Adium styles. It is still experimental and quite basic, but,
  nevertheless, already usable.
- Azoth Autoidler for automatic change of status due to
  inactivity period.
- Azoth LastSeen for client-side recording of contacts' last online
  and availability time. It doesn't depend on the concrete
  protocol implementation.
- [Azoth Modnok](/plugins-azoth-modnok) for inline in-chat LaTeX
  rendering and display. It doesn't depend on the underlying protocol,
  and if the protocol supports rich text formatting in outgoing
  messages, it is able to replace the formulas with corresponding
  images in outgoing messages as well, so your buddies would see nice
  rendered formulas instead of raw LaTeX code, even if their client
  doesn't have a LaTeX formatter.
- Glance feature moved from the Core to a separate plugin.
- SecMan SecureStorage has been merged into *master* branch. This
  plugin provides an AES256-secured storage area for passwords and
  personal data.
- TabsList for showing the list of currently opened tabs and quickly
  selecting one of them.

Among changes in already existing plugins:

- Added full support for CAPTCHA-protected rooms in [Azoth
  Xoox](/plugins-azoth-xoox): no links should be clicked now to
  enter CAPTCHA.
- Implemented rich text formatting support in [Azoth](/plugins-azoth)
  with the ability to format outgoing messages as well.
- Added support for
  [XHTML-IM](http://xmpp.org/extensions/xep-0071.html) to [Azoth
  Xoox](/plugins-azoth-xoox).
- Added support for publishing geolocation information to Azoth.
- Azoth Xoox now also supports
  [Geolocation](http://xmpp.org/extensions/xep-0080.html).
- Azoth now exposes options to add MUC participants to the contact
  list if their ID is known. Quite a small and easy change, but
  quite handy.
- Improved rendering of history in Azoth ChatHistory, with saner
  nicks, for example.
- fb2 export dialog in [Aggregator](/plugins-aggregator) now allows to
  set custom book name and genres.
- [Azoth](/plugins-azoth) now loads last few messages (amount
  is configurable) from the history when opening new chat.
- Enriched chat tabs with actions like the ones for viewing VCard and
  history in chat tab toolbar and emoticons chooser in message
  formatter bar.
- Added buttons for recommending and adding to bookmarks for posts and
  comments in [Azoth p100q](/plugins-azoth-p100q).
- ShellOpen now offers to open things by notification instead of a
  modal dialog. Less annoying.

Lots of bugs have been fixed, among them:

- A huge fix for entity caps in [Azoth Xoox](/plugins-azoth-xoox): now
  they are calculated correctly.
- Fixed spaces after some commands in [Azoth
  p100q](/plugins-azoth-p100q).
- Fixed status changes and status handling in [Azoth](/plugins-azoth).
- Fixes and kludges in fb2 export feature in
  [Aggregator](/plugins-aggregator).
- Fixed quite a big memory leak in tabs tooltip handling.
- Fixed leaking toolbars in Azoth.
- Lots of bugfixes in [Azoth Acetamide](/plugins-azoth-acetamide).
- Azoth HiLi doesn't check big message bodies for highlights now,
  otherwise Qt's regexp engine hang.

We've also begun working on features for next milestones, for example:

- Nice QML-based popup for tray notifications in the Advanced
  Notifications module.
- Metacontacts support.
- Foundation for PGP support in [Azoth](/plugins-azoth) and [Azoth
  Xoox](/plugins-azoth-xoox).

More changes are covered in details in the corresponding development
digests: [\#8](/devel-digest-8) and [\#9](/devel-digest-9).

And now some screenshots:

`{ "name": "tabslist01.png", "align": "inline", "title": "TabsList module", "thumb": "medium" }`{.img}
`{ "name": "modnok01.png", "align": "inline", "title": "LaTeX formula with Modnok", "thumb": "medium" }`{.img}
`{ "name": "azoth_muc_as1_120916.png", "align": "inline", "title": "An Adium style", "thumb": "medium" }`{.img}
`{ "name": "azoth_muc_as4_120917.png", "align": "inline", "title": "Another Adium style", "thumb": "medium" }`{.img}

Packages for Ubuntu are in Launchpad queue to be compiled, Gentoo
ebuilds are already available in the rion overlay, openSUSE, Fedora and
Windows builds are coming.

There are still lots of interesting and tasty things to do, but this
milestone gives a basic impression of what LeechCraft 0.5 would look
like. Please, leave your ideas, reports, questions and any other
feedback.
