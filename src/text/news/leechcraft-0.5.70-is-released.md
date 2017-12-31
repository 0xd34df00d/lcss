---
title: LeechCraft 0.5.70 is released
tags: release, 0.6.x
published: 2012-05-27T12:27:10

---

Today LeechCraft 0.5.70 «Hessian Blade» is released!

The most significant change since the previous release is the all-new
rewritten [LMP](/plugins-lmp) media player, which specializes on audio
and is collection-oriented. For now quite basic functions are
implemented, present in most other players, like, well, local
collection, static and dynamic playlists (like "50 random tracks"),
support for external playlists in pls, xspf and m3u8 formats, and
different playback modes, like sequential, shuffled and
track/album/playlist repeat. With modules like LastFMScrobble LMP
supports scrobbling listened tracks to Last.FM (and possibly other
similar services), fetching missing album covers and requests for
similar artists. It also can use search modules to automatically fetch
lyrics for currently playing song.

Some screenshots of LMP:

\[img\_assist|url=images/lmp\_collection\_120916.png|title=Collection|align=inline|link=1|width=440\]
\[img\_assist|url=images/lmp\_similar\_120916.png|title=Similar artists|align=inline|link=1|width=440\]
\[img\_assist|url=images/lmp\_lyrics\_120917.png|title=Lyrics|align=inline|link=1|width=440\]
\[img\_assist|url=images/lmp\_4.png|title=Tray icon|align=inline|link=1|width=440\]

The following is planned in the nearest future:

- Support for hardware (USB-pluggable) players and synchronization
  with them.
- Support for audio streams and things like Last.FM radio.
- Integration with our RSS feed reader, Aggregator, for full support
  for podcasts.
- Fetching of personalized recommendations from Last.FM and
  similar services.
- Automatic fetching of tabulatures.
- Tags editor.

Some help would be needed for implementing support for hardware players,
from platform-dependend things to testing different devices.

Among other changes the following can be noted:

- Core: "back"/"forward" mouse buttons make tabs switching.
- In the [AdvancedNotifications](/plugins-advancednotifications)
  module, responsible for rule-based advanced notifications, QML
  template and a couple of memory leaks were fixed.
- In our modular IM client [Azoth](/plugins-azoth):
  - added support for /kick and /ban commands,
  - smiles aren't replaced anymore in the middle of the words;
  - added support for hiding and disabling accounts.
- Azoth Autopaste module which automatically pastes long texts to
  pastebins was migrated to the [codepad.org](http://codepad.org)
  service due to paste.pocoo.org's death.
- [Azoth p100q](/plugins-azoth-p100q) which adds support for the
  [psto.net](http://psto.net) microblogging service is now more
  compatible with Adium themes.
- [Azoth Xoox](/plugins-azoth-xoox), our XMPP protocol implementation,
  now supports adding, editing and removing phones and emails, and
  some MUC reconnection issues were fixed.
- [Azoth Vader](/plugins-azoth-vader) module, the Mail.Ru Agent
  protocol implementation, now supports assigning phone numbers to
  contacts, and some problems with authorization handling were fixed.
- Visual notifications provider [Kinotify](/plugins-kinotify) now
  doesn't show notifications if a fullscreen application is active.
  This helps to distract the user less if he's playing a game or
  watching a movie. For now it works only on Win32, and Xlib
  contributions are welcome!

More information about other changes is available in corresponding
development digests: [\#23](/devel-digest-23) and
[\#24](/devel-digest-24).

Packages and builds for supported distros and OSes will be available
soon. Watch your package manager or our [download page](/download)!

As always, feature requests and bug reports are welcome, and we will be
happy to get any help — from code (like hardware players support) to
translations and artwork!
