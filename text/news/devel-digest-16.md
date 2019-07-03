---
title: Development digest &num;16
tags: digest
published: 2011-10-25T14:42:26

---

The last week or so Laure got the most attention, being constantly
developed by Ignotus. Nevertheless, other plugins got their share of
attention as well, and here is a list of some changes:

- Added new plugin, Azoth Isterique, for removing excessive caps lock
  usage in incoming messages.
- Action for changing bookmarks in [Azoth](/plugins-azoth) right in
  contact list context menu.
- [\#475](http://dev.leechcraft.org/issues/475): Allow one to join
  bookmarked conferences from contact list context menu.
- Added an option to hide conference participants from the whole CL.
- Small refactoring for bookmarks management in
  [Azoth](/plugins-azoth).
- Allow one to save pixmap without redownloading in
  [Poshuku](/plugins-poshuku).
- Added `"WatchActionIconChange"` property to iconable actions.
- More fixes for imports in [Azoth
  AdiumStyles](/plugins-azoth-adiumstyles). Even more themes should
  work now.
- [\#487](http://dev.leechcraft.org/issues/487): Uncheck dependent
  plugins when disabling root plugin.
- [\#467](http://dev.leechcraft.org/issues/467): Don't remove
  conference participants that have left since they written our
  contact, but we haven't read their messages yet.
- Fixed bookmarks manager in [Azoth](/plugins-azoth).
- [\#465](http://dev.leechcraft.org/issues/465): Fixed handling of
  tags with the '/' symbols in [Azoth p100q](/plugins-azoth-p100q).
- [\#466](http://dev.leechcraft.org/issues/466): Fixed cases when post
  IDs weren't detected in [Azoth p100q](/plugins-azoth-p100q).
- [\#480](http://dev.leechcraft.org/issues/480): Removed excessive
  line breaks in [Azoth p100q](/plugins-azoth-p100q).
- Lots of fixes for contact list rendering in [Azoth](/plugins-azoth),
  like configurable inter-contacts spacing, and such.
- Fixed a couple of segfaults in Aggregator on exit.
