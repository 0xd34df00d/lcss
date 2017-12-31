---
title: Development digest #23
tags: digest, 0.6.x
published: 2012-05-25T13:53:24

---

We have a new major plugin since the 0.5.65 release: the all-new
rewritten [LMP](/plugins-lmp)! It's now a music-only player, still
Phonon-based though. It is inspired by players like Amarok and
Clementine, and is built around collections. For now, it has only basic
functionality like playback, playlists, collection, basic scrobbling to
services like Last.FM and a couple of others.

Directory and clipboard watching was moved out of the Core to a separate
new plugin, Nacheku, so make sure to install it if you feel like missing
this functionality.

But there are some other changes as well, for example:

- Core: handle back/forward mouse buttons on tabs and scroll the
  tabs accordingly.
- Core: always bring to front the main window on tray icon click.
- [AdvancedNotifications](/plugins-advancednotifications): fixed QML
  file for the notification.
- AdvancedNotifications: fixed leaking of some objects and views.
- [Azoth](/plugins-azoth): don't suggest already existing items
  in RIEX.
- Azoth: handle /kick and /ban commands.
- Azoth: fixed avatars cropping.
- Azoth: fixed a rare segfault in search.
- Azoth Autopaste: migrate to [codepad.org](http://codepad.org) since
  paste.pocoo.org is dead.
- [Azoth p100q](/plugins-azoth-p100q): working addition and
  configuration buttons.
- Azoth p100q: fixed compatibility with some Adium themes.
- [Azoth Xoox](/plugins-azoth-xoox): stubs for microblogging support
  according to XEP-0277.
- Azoth Xoox: proper conferences rejoining.
- Azoth Xoox: rejoin to conferences on disconnect.
- Azoth Xoox: updated VK icon.
- [LastFMScrobble](/plugins-lastfmscrobble): scrobbler now obeys
  official guidelines.
- LastFMScrobble: save scrobbling queue between runs.
- LastFMScrobble: support requesting similar artists.
- LastFMScrobble: support searching for album arts.
- LastFMScrobble: support marking tracks as loved.
- LastFMScrobble: handle auth errors.
- [Poshuku](/plugins-poshuku): handle back/forward mouse buttons.
