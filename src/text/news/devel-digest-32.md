---
title: Development digest #32
tags: digest, 0.6.x
published: 2012-10-04T13:05:08

---

A month has passed since previous development digest, and LeechCraft got
some huge improvements.

First of all, the [NetStoreManager](/plugins-netstoremanager) module now
supports synchronization, watching the file system for changes to
automatically upload new or changed files in watched directories. For
now the file system watcher is inotify-only, so this won't work on
platforms other than Linux. And, of course, this is quite an
experimental feature for now — use at your own risk.

Then, [Poshuku CleanWeb](/plugins-poshuku-cleanweb) module was optimized
and improved a lot. Particularly, its performance was increased by an
order of magnitude, and it now supports using PCRE as regexp matching
engine, since QRegExps are quite slow. CleanWeb now supports a much
wider subset of AdBlock+ rules, including separator-based rules and
selector-based element hiding.

[Azoth](/plugins-azoth) and [Azoth Xoox](/plugins-azoth-xoox)'s file
transfer capabilities were also improved. Azoth now supports sending
files both by protocol means and via modules like NetStoreManager, all
from a single handy dialog. Also, drag'n'drop support for file sending
was improved significantly. Azoth Xoox now supports setting a SOCKS5
file transfer proxy, and by default it autodetects the one offered by
the Jabber server.

LeechCraft now also supports searching the settings: the pages and
sections containing the search terms are left enabled while the rest is
disabled when searching.

Also, LeechCraft now builds and runs successfully on Mac with clang, and
a new plugin has been added, Pierre, which provides some basic
integration with Mac OS X.

Other changes:

- Core: use system style by default instead of Plastique.
- Core: workaround for
  [QTBUG-13175](https://bugreports.qt-project.org/browse/QTBUG-13175).
- [AdvancedNotifications](/plugins-advancednotifications): proper
  notifications view height.
- [Azoth](/plugins-azoth): user-visible strings are properly escaped
  in contact tooltips.
- Azoth: fixed Ctrl+1 handling.
- [Azoth ChatHistory](/plugins-azoth-chathistory): fixed links not
  being clickable sometimes.
- [Azoth Metacontacts](/plugins-azoth-metacontacts): show dummy
  account only if there are metacontacts.
- [HotStreams](/plugins-hotstreams): fetch radio list
  from dir.xiph.org.
- [LastFMScrobble](/plugins-lastfmscrobble): fixed tags ordering in
  biography info.
- LastFMScrobble: fixed build with Debian liblastfm snapshot.
- [LMP](/plugins-lmp): playlist loading is now asynchronous.
- LMP: autodetect and rescan changed files.
- LMP: remember last used events/biography/etc providers.
- LMP: clickable artist names in biography/similar/etc view.
- LMP: choosing next track now respects play mode.
- LMP: fixed Repeat Album play mode.
- LMP: improved transcoding options selection: now more formats are
  supported and their list is dynamically obtained from FFmpeg.
- LMP: added track move up/down buttons.
- LMP: rescan fixes.
- LMP DumbSync: upload album covers as well.
- [Monocle](/plugins-monocle): fixed fitting ratio calculation.
- [Poshuku](/plugins-poshuku): menus for back/forward
  history navigation.
- Poshuku: reworked bookmarks management UI.
- TabsList: handle Enter, Return, Home and End buttons.
- [TabSessManager](/plugins-tabsessmanager): tabs order is now saved
  as well.
