---
title: Changelog for 0.3.80
tags: 0.4, changelog
published: 2010-12-05T13:42:14

---

Features
--------

### Core

-   Shortcut keys for glance and navigation to tab number 1-10.
-   Added system default Qt style to the options.
-   Added keyboard accelerators for new tab menu.

### Kinotify

-   Completely rewritten notifications plugin.

### LackMan

-   Actions for upgrading and updating everything.
-   Added `data` package type.

### New Life

-   Import Manager for Firefox importer.

### Poshuku

-   Embed the menu into the main menu.
-   Added Paste action to all text fields.

#### Poshuku CleanWeb

-   Support for `subscriptionslist.xml`{type="bash"} stuff.

Fixes
-----

### Core

-   Removed some stuff previously marked as obsolete, regarding `log()`
    and `notifyFinished()` signals.
-   Moved to datasource concept everywhere.
-   Fix layouting in settings dialog.

### LackMan

-   Fixed a segfault on action finish.
-   Fixed untoggable buttons.
-   Fixed scrolling without selected items.
-   Use `7za`{type="bash"} on Windows instead of `tar`{type="bash"}.

### Poshuku

-   Check if the new forms data is equal to old.
-   Escape '+' in search queries.
-   Compatibility with Google improved on non-UTF8 systems.

### Tab++

-   Add to the right and be not floating by default now. Fixes rendering
    errors sometimes.