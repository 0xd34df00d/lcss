---
title: Development digest &num;28
tags: digest, 0.6.x
published: 2012-07-24T21:20:35

---

Once again, last couple of weeks we mostly worked on
[LMP](/plugins-lmp), or nice media player. What's also important, we've
added some compatibility fixes, so [BitTorrent](/plugins-bittorrent) can
be built with Boost 1.50 now, and
[LastFMScrobble](/plugins-lastfmscrobble) can be built with fresh
liblastfm-1.0.

Adding support for liblastfm-1.0 revealed that a bunch of changes in it
were like renaming a function here or a function there, and it's not
clear why upstream did this in the first place: these changes bring no
fixes, no new features, no improvements.

Also, small, but nice news is that [Azoth](/plugins-azoth) now supports
displaying avatars in tooltips, like this:

`{ "name": "azoth_tooltip_01.png", "align": "inline", "title": "", "thumb": "medium" }`{.img}

And here's the list of other important changes:

- [Aggregator](/plugins-aggregator): support exporting feeds to PDF.
- Azoth: fixed a segfault when Ctrl+Clicking.
- [Dolozhee](/plugins-dolozhee): fetch the list of issue categories
  and assign issues to them.
- [LastFMScrobble](/plugins-lastfmscrobble): expose some predefined
  radio stations like neighbour radio or loved tracks.
- [LMP](/plugins-lmp): support adding artists to wishlists to plugins
  like [Otlozhu](/plugins-otlozhu).
- LMP: support predefined radio stations from radio plugins.
- LMP: playlist stats below the playlist.
- LMP: configurable shortcuts.
- LMP: close the Album Art display on Esc or mouse click.
- LMP: added an option to ignore "The " when sorting artists (this way
  *The Autumn Offering* will be between *August Burns Red* and
  *Behold... The Arctopus*).
- LMP: URLs are displayed in playlist instead of just the
  string "URL".
- LMP: fixed background in QMLs.
- LMP: more file types are now supported.
- [Otlozhu](/plugins-otlozhu): support adding tasks from
  other plugins.
- [Vrooby](/plugins-vrooby): fixed a segfault on startup on
  some systems.
