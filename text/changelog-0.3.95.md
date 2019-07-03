---
title: Changelog for 0.3.95
tags: 0.4, changelog
published: 2010-12-05T13:42:24

---

New features
------------

### Aggregator

-   Allow to disable automatic updates at all.
-   Allow to add feed from feeds list context menu.
-   Actions for marking as read and open in new tab.
-   Support selection of multiple items at once.

Fixes
-----

### Overall

-   Always initialize internal browser in `SelectableBrowser` — fixes
    various segfaults when Poshuku is unavailable.
-   Fixed Mac OS paths.

### Aggregator

-   Don't store max IDs, instead, take them from DB on startup.

### Core

-   Fixed occasional segfault on exit.
-   Fixed unclose tab management.

### Kinotify

-   Fixed a memory leak.
-   Fixes for multiscreen configurations.

### LackMan

-   Hide everything additional in the description browser.