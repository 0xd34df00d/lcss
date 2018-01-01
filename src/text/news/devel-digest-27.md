---
title: Development digest &num;27
tags: digest, 0.6.x
published: 2012-07-11T06:11:52

---

We have some good news: finally [LMP](/plugins-lmp) is able to upload
tracks from local music collection to portable media players! For now it
supports only basic media players for which no MTP or iPod-related stuff
is required. Support for MTP players and i-devices will be added later.

Of course, transcoding is supported, so that you can automatically
convert big FLAC files in your local collection to a smaller lossy
format like Ogg Vorbis. Anyway, it hardly makes sense to keep these
large FLACs on players with such limited memory and typically crappy
sound.

For this to work, a new plugin has been introduced: meet
[Vrooby](/plugins-vrooby)! It is LeechCraft's removable storage device
manager, allowing the user to mount and unmount devices as well as
aiding other plugins in working with such devices.

Poshuku WYFV plugin has been removed as obsolete and unsupported.

Among other changes:

- Core: tab bar can be moved to the bottom.
- Core: allow to disable resource caching via the new
  `--no-resource-caching` flag.
- Core: lots of optimizations.
- Core: fixed a possible segfault when there are no handlers
  for entity.
- [AdvancedNotifications](/plugins-advancednotifications): fixed QML
  notifier on some multimonitor systems.
- [Azoth](/plugins-azoth): support inserting corresponding nicknames
  via clicking in the roster.
- Azoth Herbicide: block authorization requests as well.
- [Azoth p100q](/plugins-azoth-p100q): fixed recommending comments.
- [Azoth Xoox](/plugins-azoth-xoox): action for modifying self vCard
  in account menu.
- Azoth Xoox: fix for client connection handling, and a
  possible segfault.
- [LastFMScrobble](/plugins-lastfmscrobble): added support
  for liblastfm-1.0.
- [LMP](/plugins-lmp): show full-scale album art when requested.
- LMP: support copying properties from the properties display widget.
- LMP: properly handle collections with unscannable items.
- LMP: fixed a segfault on certain loaded plugins combinations.
