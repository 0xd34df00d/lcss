---
title: Changelog for 0.3.60
tags: 0.4, changelog
published: 2010-12-05T13:39:49

---

New features
------------

### Overall

-   Allow to clear cache and cookies.
-   Show settings dialog as a tree instead of combobox + list.
-   Reworked the task handler selector:
    -   Show more user-friendly and sensible name for a binary entity.
    -   Don't suggest the task generator.
    -   Smarter selector, only suggests handlers or
        downloaders sometimes.
    -   Support multiple search tabs, the name of the tab is the
        category (ies).
-   Support for startup wizards from plugins.
-   Allow to filter out tracking cookies.
-   Detect PQSQL availability at runtime and disallow selecting
    PostgreSQL storage backends if it's unavailable.
-   Added the `-type` command-line switch.
-   Application-wide context-dependent action to open new tab.
-   Allow to select multiple items in Summary and perform something on
    all of the selected ones.
-   Show context menus in the Summary tab.
-   Toolbars now have names.
-   Enhanced Plugins Manager.
-   Added (hideable) menu.
-   Added some menus to the tray.
-   Made the tabbar much more slim.
-   Set the application version.
-   "About" and "About Qt" dialogs.

### Aggregator

-   Startup wizard which allows to configure storage parameters, backend
    and add some predefined feeds.
-   Moved some actions for items to the context menu, like "Subscribe
    to comments".
-   Category selector on the right part of the screen for feeds that
    have categories.
-   Support iTunes podcasts RSS extensions.
-   Allow to automatically download enclosures.
-   Smoother switching of items.
-   Show some actions in the context menu for the feeds.
-   Allow out-of-order items in Atom feeds.

### BitTorrent

-   Allow to add peers.
-   Allow to add and remove HTTP/web seeds.
-   Checkboxes on folders when adding a torrent.
-   Reworked the tab widget — nicer everything.
-   Configurable fast speed controller.
-   Peers banlist.
-   Better files view, allowing to set priorities for multiple files at
    once and much more.
-   Startup wizard which allows to configure some basic settings.
-   Allow to create magnet URIs.
-   Show some actions in the context menu for the tasks.

### Chatter

-   The simple IRC client.

### CSTP

-   Store tags for the task.

### HistoryHolder

-   Support removing multiple elements.

### LCFTP

-   The FTP plugin.

### LMP

-   Allow to play (stream) from remote URLs as well.

### NetworkMonitor

-   Filter.

### Poshuku

-   Allow to search from the page via LeechCraft's search architecture.
-   Allow to notify about page loads.
-   Reload timer.
-   Allow to disable tracking link-history (though tracking
    usual history).
-   Editing bookmarks, including title, URL and tags, via right-click.
-   Much more actions are available via the right mouse button.
-   Smarter find (if the text was selected).
-   Nicer progressbar, more slim and shows percentage and loaded/total
    size of the page.
-   Use own user-agent.

### Remoter

-   Basically works with QWebClient.

### SeekThru

-   Use common tags database instead of own categories.
-   Startup wizard which allows to add some predefined channels.

Fixes
-----

### Overall

-   Optimized MergeModel.
-   Fixed Plugin Manager on some amd64 systems.
-   Fixed selecting Russian and Arabic translations.
-   Ask to restart only if language has really changed.
-   Allow to add URLs.

### Aggregator

-   2x performance boost on channels switch.
-   Really update items when channel is marked (un)read so that they
    trigger their state just right after that.
-   Still load if storage backend fails. Allow to set storage backend
    settings after that.
-   Got rid of some warnings from the PostgreSQL backend type.

### BitTorrent

-   Fixed segfaults on peers tab.
-   Selection follows the torrent when it's moved in the queue.
-   Correcly select files to download on addition.
-   Don't try to rename a file if its name hasn't changed.
-   Torrent creation segfaults.

### CSTP

-   Fixed parsing URLs in redirects.

### Poshuku

-   Move focus to the tab contents after load only if the tab
    is visible.
-   Try to handle ftp: and mailto: links before opening them externally.
-   Don't restore empty pages.
-   Fixed percent-encoding of items in autodiscovery.
-   Still load if storage backend fails. Allow to set storage backend
    settings after that.
-   Fixed completion of URLs with empty history.
-   Slight optimization of load event.

#### CleanWeb

-   Save approx. 9 kb per filter entry. Saves \~45 MiB on Morpeh
    filter list.

### SeekThru

-   Actually install the translator.
-   More usable error messages.
-   Fixed segfault when tagging with no selection.