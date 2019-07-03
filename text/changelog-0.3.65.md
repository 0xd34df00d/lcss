---
title: Changelog for 0.3.65
tags: 0.4, changelog
published: 2010-12-05T13:40:22

---

New features
------------

### Overall

-   Handler choice dialog with path history and auto-suggestion.
-   Redesigned interface a bit.
-   Redesigned the Summary tab.
-   Embedding actions and menus from the plugins into Tools menu.
-   Moved Plugin Manager to the Settings Dialog.
-   Cleared away almost all the buttons from the main toolbar.
-   Persistent tabs are moveable as well.
-   Option to automatically accept tasks with only one handler and
    no downloaders.
-   Show plugins' icons in handler choice dialog.
-   Application-wide close button.
-   "Close all but current" action.
-   Added shortcuts to Quit (F10) and Preferences (Ctrl+P).
-   Added `IDownload::KillTask()` to the Interfaces.

### Aggregator

-   Full MediaRSS support (except restrictions).
-   GeoRSS support with a link to Google Maps.
-   Support adding OPML feeds and settings from an importer plugin.
-   Support for common OPML-based feed options like update interval etc.
-   Fetching OPML feeds from remote web servers.
-   Export to FB2 format.
-   Support feed: scheme.
-   Changeable color and font of unread items and channels.
-   Open links via internal browser if no browser plugin is present.
-   Regulatable (and rememberable) width of the Category Selector.
-   Kill stalled task instead of updating further.

### AnHero

-   **New plugin:** KDE-based UNIX-only crash handler.

### DeadLyrics

-   Rebirth of the plugin, fixed searching.
-   Use a browser plugin if it's present to show lyrics (optional).

### New Life

-   **New plugin:** Import settings from various programs.
-   Support Akregator feeds and settings.
-   Support Liferea feeds.

### LMP

-   Added flv to the list of default extensions.

### Poshuku

-   Favorites checker.
-   Restore zoom factor, reload interval and load notification status on
    session restore.
-   Show favicons in favorites list.
-   Unified Reload/Stop button.

#### Poshuku CleanWeb

-   FlashOnClick: blocks unwanted flash.
-   Whitelist for FlashOnClick.
-   Neat menu for FlashOnClick.

### vGrabber

-   **New plugin:** vkontakte.ru audio/video client.
-   Support for downloading and/or streaming audio.
-   Support for downloading and/or streaming video.
-   Configurable search categories for both audio and video.
-   Filter out same audios.
-   Good error reporting.

Fixes
-----

### Overall

-   Fixed out-of-sync selection and current index in the Summary.
-   Startup wizards use Modern style now.
-   Better error handling in handler choice dialog.
-   Correctly handle spaces in categories.
-   Support .svg icons without the .mapping file.
-   Clean duplicate cookies.
-   Unify search categories in the summary.
-   Apply new iconset only if it's different from previous.
-   Apply new app style only if it's different from pervious.
-   Apply new app style on startup only if it's different from
    default style.
-   Be more conservative on icon search. Saves \~1 MB RAM on
    Oxygen theme.
-   Fixed icon & translation loading on Windows.
-   More initialization moved to run-time. Saves startup time.

### Aggregator

-   Fixed channel titles surrounded by \\r\\n.
-   Fixed segfault on last item removal.
-   Fixed double initialization in OPML importing.
-   Toggling channel read/unread is much much faster now.
-   General performance improvements.
-   Don't add items which would be truncated anyway.
-   Use correct URL after feed addition from another plugin and
    URL alteration.
-   Correctly set tags in exproted OPMLs.
-   Suggest right output dir in OPML export.
-   Fixed compatibility with Qt 4.6.
-   Always use external browser by default now.

### BitTorrent

-   Fixed segfault when trying to remove an item not belonging
    to BitTorrent.
-   Fixed segfault when removing many torrents at once under high load.
-   Fixed negative progress numbers in files tab.

### DBusManager

-   Fixed a very rare segfault with delayed notifications on KDE.
-   Fixed some initialization to the main loop. Speeds up
    application start.

### LCFTP

-   Correcly wait for the watcher thread to finish on Release.

### Poshuku

-   Moved JS objects initialization. Fixes segfaults and the
    password manager.
-   Queued fill of forms. Fixes a rare segfault.
-   Small code fixes.
-   Higher change of tabs being restored.
-   Fixed history truncater by number of items in SQLite.
-   Don't show the animated AJAX-style icon.
-   Removed the text from the progress bar.

#### Poshuku CleanWeb

-   Don't return a blank page, just drop a request. Fixes infinite
    recursion on lists blocking about:blank.