---
title: Changelog for 0.3.75
tags: 0.4, changelog
published: 2010-12-05T13:41:31

---

New features
------------

### Core

-   Experimental support for on-the-fly load/unload of plugins.
-   Unified new tab menu.
-   Notify user about plugin loading errors.
-   Nicer, richer startup options.
-   Datasources framework.
-   Detect available languages at runtime rather than have them
    hardcoded in the compile time.
-   Support explicit plugin loading from arbitrary paths.
-   Allow to set default new tab type.
-   Open X selection in new tab on middle click on the new tab button.
-   Hide menu and toolbar in fullscreen.
-   Control from keyboard in Glance.
-   Nicer tab bar menu.
-   Removed the left action bar.

### Aggregator

-   Support `content:encoded`{type="xml"}.
-   Select/deselect all buttons in startup wizard.
-   MySQL backend support.

### Auscrie

-   Savepic.ru poster.

### BitTorrent

-   Allow trackerless torrents.
-   Handle files on double click.
-   Removed spoofind caps.

### CSTP

-   Support for *file://* URLs as well.

### LackMan

-   LeechCraft Package Manager: new plugin.

### New Life

-   Support for importing stuff from Firefox.

### Popishu

-   New plugin for simple plain text editing.

### Poshuku

-   Optional IDN support via libidn.
-   Support for external editors like Popishu.
-   MySQL backend support.
-   Correctly handle forms to load/save passwords.

### SecMan

-   Plugin for storing personal data.
-   Support only basic unencrypted storage for now.

### Qrosp

-   Handle plugin wrapping requests.

### SeekThru

-   Support syncing.

### ShellOpen

-   New plugin for opening things via external apps.

### Syncer

-   Added new plugin for synchronization.

Fixes
-----

### Overall

-   Nicer category selectors.

### Core

-   Great reduce in startup time.
-   Avoid infinite loop and HDD space exhaustion (with logs) when one of
    plugins failed to load. Just skip it.
-   Fixed some bugs in directory watcher.

### Aggregator

-   Fixed channels not being added.
-   Don't notify about null external data.
-   Saner colors by default.
-   Fixed interpreting palette colors.

### BitTorrent

-   Fixed huuuuuge performance penalty.
-   Fixed the "Trackers" action in dashboard.
-   Fixed settings description.
-   Fixed compatibility with the `clang` compiler.
-   Correctly calculate the size of the torrent if a file was chosen.
-   Fixed restoring torrents if DHT is disabled.

### DBusManager

-   Fixed a bug that hasn't appeared yet, though.

### LMP

-   Accept .mp4 as well by default.

### Poshuku

-   Force session info flush to avoid information loss.
-   Styling fixes.
-   Check if protocol can be handled before emitting it.
-   Select all the text in the address bar on focus.
-   Set tab title for new tabs.
-   Correctly handle import data files.

#### Poshuku CleanWeb

-   Fixes for Qt 4.7.

### Qrosp

-   Declare `QNetworkAccessManager*`.
-   Proper convertation for metaobjects.

### SeekThru

-   Fixed segfaults on platforms that don't support hiding
    exported symbols.

### Summary

-   Better search widget interface.
-   Filter Downloads category as it should be filtered.

### Tab++

-   Correctly handle non-existent tabs.

### vGrabber

-   Fixed vkontakte.ru video grabbing.