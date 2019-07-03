---
title: Changelog for 0.4.60
tags: changelog, 0.5
published: 2011-01-18T00:14:17

---

New features
------------

### Overall

-   Build with `-Wl,--as-needed` on UNIXes.

### Core

-   Added `ResourceLoader` class.
-   Removed menu bar at all in favor of menu button.

### Aggregator

-   Notify on FB2 export finish.

### Azoth

-   Introduced Azoth, the plugin for IM, despite it was in source
    archives for 0.4 series, so I won't write about every commit related
    to Azoth here..

### Poshuku

-   "Reload all" action.
-   Search by categories (by prepending ! to the search string)
    with suggestions.
-   Actions with hotkeys for History and Bookmarks (Ctrl+H and
    Ctrl+B respectively).
-   Save sidebar position.

Fixes
-----

### Overall

-   Removed Nufella, PoC, Remoter and YASD from the source tree. If
    somebody needs them, just
    revert c5922ca607858fc11d6171f1af4e3971f3c2169b.
-   Removed LCNP (c387a7927f723bdda4c26eaeee626e8a59a1b762).

### Core

-   Fixed some segfaults on exit.
-   Plugin manager dependency calculation fixes.

### Aggregator

-   [\#210](http://dev.leechcraft.org/issues/210): fixed default color
    for unread items in settings.
-   [\#219](http://dev.leechcraft.org/issues/219): add feed to the
    database only after first successful parse.
-   Fixed some rare segfaults.
-   Removed useless dependency on boost.date\_time.

### AnHero

-   Explicitly enable DrKonqi on KDE 4.5 and higher.

### Kinotify

-   Fixed widgets leak.
-   Fixed animation points.

### LackMan

-   Fixed ugly selections.
-   Fixed tests not compiling without fixing them by hand.

### Poshuku

-   Changed User-Agent string format to something like
    `Mozilla/5.0 (X11; U; Linux x86_64; ru-RU) AppleWebKit/533.3 (KHTML, like Gecko) Leechcraft/0.4.60-4-geaa173c Safari/533.3`,
    gmail and other similar sites recognize LeechCraft now.
-   Fixed labels in the form data storage remember dialog.
-   Remember last used forms data, not first used.

### Qrosp

-   Wrapper objects depend on the main Qrosp plugin now.