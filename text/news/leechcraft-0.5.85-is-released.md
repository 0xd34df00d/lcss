---
title: LeechCraft 0.5.85 is released
tags: release, 0.6.x
published: 2012-10-04T20:40:41

---

Today LeechCraft 0.5.85 "Risen Through The Ashes" is released!

We've released LeechCraft 0.5.80 almost two months ago, and we planned
to release 0.5.85 somewhere in mid-September, but the changes are worth
the delay.

First of all, it's worth saying in the very beginning that we've merged
our QXmpp "feature fork" with [upstream
QXmpp](https://code.google.com/p/qxmpp), so upstream version should be
used from now on. In fact, our repo on Github is already deleted to
avoid confusion. QXmpp 0.7.4 (and hopefully upper) will do for
LeechCraft 0.5.85.

Mac OS X
--------

Moreover, LeechCraft can finally be built and run on Mac OS X:

\[img\_assist|url=images/mac.png|title=|align=inline|link=1|width=440\]

The resulting [app
bundle](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.85/leechcraft-0.5.85.dmg/download)
is tested on a couple of Mac OS X 10.7 and 10.8 machines and seems to
work, though the build is very-very experimental (but seems like it's
already much more stable than Windows version). LeechCraft is built
using standard toolchain coming with XCode, with the clang compiler.

A new plugin has also been added, Pierre, which deals with Mac OS X
integration. For now it only adds a Mac-style menu bar and a button for
maximizing LeechCraft into a separate workspace, but more stuff is to
come.

And, regarding new plugins, there is [Launchy](/plugins-launchy), a new
plugin for launching applications and opening LeechCraft tabs. It is
UNIX-only and fetches the list of applications from the freedesktop.org
desktop files. For now it only supports visual fullscreen launcher, some
say it resembles Unity a bit:

\[img\_assist|url=images/screenshot.png|title=|align=inline|link=1|width=440\]

CleanWeb
--------

Our AdBlock+-compatible ad blocker, the [Poshuku
CleanWeb](/plugins-poshuku-cleanweb) module, was optimized and improved
a lot.

First, now CleanWeb supports a much wider subset of AdBlock+ rules,
including separator-based rules and selector-based element hiding for
those elements that can't be blocked during load time, like textual
ads.

Second, CleanWeb performance was increased by an order of magnitude, and
now it optionally supports using PCRE as regexp matching engine, since
QRegExps are quite slow. In fact, separator-based rules are only enabled
when PCRE is used.

Here are some numbers for rutracker.org main page and EasyList +
RuAdList rules, where cummulative time spent matching all rules for all
issued requests is measured:

- Before all optimizations: ≈1500 ms.
- After optimizations with QRegExp engine: ≈700 ms.
- PCRE: ≈280 ms.
- PCRE + JIT (available with PCRE ≥8.20): ≈200 ms.

The numbers are self-explanatory.

Moreover, element hiding performance was also measured on a complex
[Google+
page](https://plus.google.com/115250422803614415116/posts/hMT5kW8LKJk):

- QRegExp engine: ≈5300 ms.
- PCRE: ≈410 ms.
- PCRE + JIT: ≈235 ms.

Here the difference is even more obvious.

LMP
---

The next (and possibly the biggest) part of this release is
[LMP](/plugins-lmp), our audio player module (paired with
[LastFMScrobble](/plugins-lastfmscrobble) module providing Last.FM
integration), which has been improved a lot

LMP now features revamped radio support and a new plugin,
[HotStreams](/plugins-hotstreams), has been added to provide access to
tons of radio streams from radio stations like Digitally Imported,
SomaFM or from huge streams directory at
[dir.xiph.org](http://dir.xiph.org):

\[img\_assist|url=images/lmp\_radio\_120917.png|title=|align=inline|link=1|width=440\]

Moreover, LMP now is even more social: paired with LastFMScrobble, it is
now able to fetch personalized recommended concerts and festivals. Of
course, this is location-aware, so only events near you will be shown.
It's quite easy to add support for other such social events aggregators,
if any.

Playlist loading is now asynchronous, so you may add all your collection
to the playlist and the rest of LeechCraft will be usable while all your
songs are added. To handle such huge playlists a playlist search has
been added. Search is quite intellectual and also counts such fields
like genre or album date. Also, playlist memory usage has been
optimized: all album art pixmaps are scaled down to 48x48 in the
playlist.

Regarding collection, LMP now can remove tracks from collection or erase
them from disk. It also watches files and directories in collection for
changes, and changed items are automatically rescanned in case, for
example, tags have been changed.

Transcoding has been improved. More formats are supported now, like AAC
or WMA, and user is free to choose the desired bitrate type (constant or
variable). Moreover, the list of supported formats is dynamically
fetched from FFmpeg at runtime, so only those formats that will actually
work are displayed:

\[img\_assist|url=images/lmp\_devsync\_transcoding.png|title=|align=inline|link=1|width=440\]

And, speaking of transcoding and device synchronization, LMP DumbSync
subplugin, which is used to upload music to non-MTP and non-iThing
devices, now also supports uploading album art with the music.

Collection statistics dialog is also available:

\[img\_assist|url=images/lmp\_collection\_stats.png|title=|align=inline|link=1|width=440\]

There are also lots of other fixes and improvements, like improved
biography and similar artists templates, with nice effects like
background blurring on photo view:

\[img\_assist|url=images/lmp\_background\_blurring.png|title=|align=inline|link=1|width=440\]

NetStoreManager
---------------

Moving on to other plugins, the
[NetStoreManager](/plugins-netstoremanager) module now supports
synchronization, watching the file system for changes to automatically
upload new or changed files in watched directories. For now the file
system watcher is inotify-only, so this won't work on platforms other
than Linux. And, of course, this is quite an experimental feature for
now — use at your own risk.

Drag'n'drop support was also enhanced. Now files can be moved between
directories using drag'n'drop, for example.

The Yandex.Narod backend module has been removed: NetStoreManager isn't
an "upload-and-forget" kind of thing anymore, and the features of the
Yandex.Narod service don't match NetStoreManager's aim anymore.
Yandex.Narod will be replaced with Yandex.Disk service some time in the
future.

Azoth
-----

[Azoth](/plugins-azoth)'s (our IM client) and [Azoth
Xoox](/plugins-azoth-xoox)'s (XMPP implementation) file transfer
capabilities were also improved. Azoth now supports sending files both
by protocol means and via modules like NetStoreManager, all from a
single handy dialog:

\[img\_assist|url=images/azoth\_filetransfer.png|title=|align=inline|link=1|width=440\]

That's yet one more profit from LeechCraft-style modules integration, by
the way.

Also, drag'n'drop support for file sending was improved significantly.
Azoth Xoox now supports setting a SOCKS5 file transfer proxy, and by
default it autodetects the one offered by the Jabber server.

[Azoth Autopaste](/plugins-azoth-autopaste) module now supports
selecting syntax highlighter and choosing the paste service when
pasting:

\[img\_assist|url=images/azoth\_autopaste.png|title=|align=inline|link=1|width=440\]

[Azoth Metacontacts](/plugins-azoth-metacontacts) module now shows its
pseudo account in the roster only if there are metacontacts.

Other plugins
-------------

[Monocle](/plugins-monocle), our modular document reader, got support
for the DjVu format, though quite basic for now, via the Monocle Seen
plugin. Seen doesn't support things like table of contents yet, but this
will be implemented in next releases.

Among other significant changes:

- The [Liznoo](/plugins-liznoo) power management module now supports
  FreeBSD platform, thanks to the contributions of a guy who chose to
  remain anonymous.
- Settings tab has been cleaned up by moving subplugins' settings into
  their corresponding parent plugins pages. Moreover, it now supports
  searching, so only those pages that match the search query will
  remain enabled.
- Core now supports setting startup password, though this security
  measure isn't recommended because it can be easily circumvented.
- [Poshuku](/plugins-poshuku) now has menus for page history
  navigation under corresponding buttons, and it features a reworked
  bookmarks management UI.

Of course, there was a bunch of other improvements, and curious ones can
see the corresponding development digests: [\#30](/devel-digest-30),
[\#31](/devel-digest-31) and [\#32](/devel-digest-32).

Packages and builds for supported distros and OSes will be available
soon. Watch your package manager or our [download](/plugins) page! The
source archive is already
[available](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.85/leechcraft-0.5.85.tar.xz/download).
