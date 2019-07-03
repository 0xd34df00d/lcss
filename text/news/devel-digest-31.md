---
title: Development digest &num;31
tags: digest, 0.6.x
published: 2012-09-06T14:30:00

---

This time we are here with a couple of new plugins as well as a usual
bunch of fixes and improvements in already existing modules.

One of the two new plugins is Monocle Seen, DjVu backend plugin for our
[document reader](/plugins-monocle). For now it's quite basic and only
supports, well, rendering the documents. Support for TOCs and similar
stuff will come later.

Then there is [Launchy](/plugins-launchy), a new plugin for launching
applications and open LeechCraft tabs. It is UNIX-only and fetches the
list of applications from the freedesktop.org desktop files. For now it
only supports visual fullscreen launcher, some say it resembles Unity a
bit:

\[img\_assist|url=images/screenshot.png|title=Launchy|align=inline|link=1|width=440\]

Another improvement worth noting separately is that Azoth Autopaste
module has been upgraded a lot, so now it supports choosing syntax
highlighting of the text that's pasted to pastebins, and the pastebin
service itself can be chosen. Though, for now only
[codepad.org](http://codepad.org) is available.

The [LMP](/plugins-lmp) audioplayer paired with
[LastFMScrobble](/plugins-lastfmscrobble) is now able to fetch
personalized recommended events. Of course, this is location-aware, so
only events near you will be shown. It's quite easy to add support for
other such social events aggregators, if any.

And finally we synced our QXmpp fork with the upstream, pushing all the
required patches! So now the following should be used to checkout
sources:

```bash
git clone https://code.google.com/p/qxmpp
```

Among other changes:

- Core: support restaring LeechCraft from LeechCraft.
- Core: support setting startup password.
- Azoth: fixed a rare segfault where nick hash was negative.
- Azoth: leave chat view enabled when the other contact is deleted.
- Azoth: added "clear line edit" to roster filter.
- Azoth Vader: online/offline status handling fixes.
- Azoth Xoox: properly reconnect after account changes.
- Azoth Xoox: logging all data to file is now optional and is disabled by default.
- DBusManager: expose plugins like NetStoreManager via D-Bus.
- LMP: detect deleted files.
- LMP: tracks can now be removed from collection or even from disk via UI.
- LMP: properly re-add root paths on rescan.
- LMP: directory iterator now asynchronous in FS watcher.
- LMP: scale pixmaps to 48x48 in playlist, conserves memory a lot.
- LMP: play on Enter/Space/Return.
- LMP: support playlist searching.
- LMP: handle links in biography and similar views.
- LMP: fetch artist image for radio tracks.
- LMP: support banning current track.
- LMP: support deleting static playlists.
- LMP: support Phonon in non-KDE installations.
- LMP: "clear line edit" in collection and playlist filters.
- LMP: background blurring in QML templates.
- LMP: lots of small QML template fixes and improvements.
