---
title: Changelog for 0.3.70
tags: 0.4, changelog
published: 2010-12-05T13:40:49

---

New features
------------

### Core

-   Moved library detection logic into corresponding plugins'
    `CMakeLists.txt`, each plugin can now be built separately and
    third-party plugin development is easier now.
-   Install LeechCraft headers into `include/leechcraft`.
-   Introduced some files for split build.
-   Glance view.
-   New notifications architecture.
-   `FlatToFoldersProxyModel`.
-   Added `ITagsManager::GetAllTags()`.
-   "Select all" and "select none" buttons in `CategorySelector`.
-   Plugin Manager is now in app-wide settings dialog.
-   `gotEntity` and the handler chooser behavior change.
-   `Util::MakeAbsoluteURL`.
-   Removed RPATH tricks.
-   `-no-app-catch` command-line switch that disables exceptions
    handling in `QApplication::notify`.
-   Icons for error, information and warning.
-   `SkinEngine::GetIconPath()`.
-   Register `QIODevice*` so that it can be used in signals/slots.
-   New tab on doubleclick.
-   Added `IWebWidget::SetNavBarVisible()` and support it in
    `Util::SelectableBrowser`.
-   Option for smarter tab width.
-   Better tab menu with support for tab bar actions from plugins.
-   "Actions" submenu in the main menu.
-   Added `IMultiTabsWidget::ParentMultiTabs()`.
-   Option for toolbar icon size.
-   "Apply" button in options.
-   Pop up the New tab menu when current tab doesn't support
    multiple tabs.
-   Allow to get the plugin path having its QObject\*.
-   Removed `LeechCraft::Notification`, use Entities with MIME
    *x-leechcraft/notification* for notifications from now on.
-   Support basic/advanced startup wizard pages and modes.
-   Right mouse click on free space on the tabbar brings new tab menu.
-   Close tab on middle button click.
-   Handle *-type file* option.
-   New tab menu in main menu as well.
-   "Always" option for exit.
-   Show information about new tab options.
-   Tooltip for entity field.

### Aggregator

-   Use `FlatToFoldersProxyModel`.
-   Allow to hide navigation bar for the embedded web widget.
-   Show whole folder's contents when in Folders mode and a folder
    is selected.
-   Show number of news items in settings.
-   Control when to notify the user about new/updated items.
-   Storage settings only in Advanced mode.
-   "Show as tape" button as a button.
-   Added tooltips on channels and items.

### Auscrie

-   New plugin for auto screenshooting.

### BitTorrent

-   Allow to disable Peer ID override.
-   Initial Live Streaming support.
-   Save DHT state on shutdown for faster and better DHT startups.
-   NAT-PMP, LSD & UPnP are optional but enabled by default.
-   Notify about finished torrent generation.
-   Allow to add the newly created torrent.
-   "Destination" field is a link now.
-   Allow to edit trackers by placing a button near label with
    current tracker.
-   Better trackers changer GUI.
-   BitTorrent is an EntityHandler now.
-   Notification about failure to add task due to file size is
    optional now.
-   Extensions are optional now.
-   Ask about removing the files when removing the torrent.
-   Option for full allocation mode.
-   Change trackers on multiple torrents.
-   Detect links in torrent comments.

### Chatter

-   Added tooltips.
-   Embedding in tab bar.
-   General improvements.

### DBusManager

-   Enhanced interface, including `Tasks`.
-   Start DBus daemon on Win32.
-   Compatibility with `org.freedesktop.Notifications`. Breaks KDE
    ≤ 4.3.
-   Support actions in notifications.

### EiskaltDC++

-   Added EiskaltDC++ as a plugin for LeechCraft (damn experimental
    for now).

### Kinotify

-   New plugin for fancy notifications based on Qt Kinetic project.

### LMP

-   Display metadata where possible.
-   Buttons to toggle pause and full screen.
-   Volume up/down in context menu.
-   Implemented `IMediaPlayer` and changed lots of stuff because
    of that.
-   Consider `FromUserInitiated` flag.
-   Hide mouse in fullscreen.
-   Exit fullscreen mode when playback finished.
-   Support `QIODevice*`.

### NetworkMonitor

-   Handle `DELETE` operations.

### Poshuku

-   Show sidebar on each page.
-   Changing encodings.
-   Option to autoclose delegated empty pages.
-   Save/load page history in session.
-   DNS prefetching.
-   Offline web application cache.
-   Font/graphics antialiasing.
-   Support for clearing icons DB and in-memory cache.
-   Support multiple plugins per each MIME.
-   `about:plugins` page.
-   Added `IFlashOverrider` plugin.
-   Use `FlatToFoldersProxyModel`.
-   Try to detect links to Atom/RSS feeds and allow to subscribe to them
    in context menu.
-   Show error code in error page.
-   Allow to build with Webkit from trunk.
-   Home page stub.
-   Highlight search results.
-   "Open" action in notifications.
-   F6 to navigate to the URL line edit.
-   Suggestions on some common type of network failures.
-   Added autoscroll feature.
-   Loading information in tab title now.

### Poshuku CleanWeb

-   Manual blocking via right-click on an image.
-   Implement `IFlashOverrider`.
-   Allow to add subscriptions from settings.
-   Suggest some commonly used subscriptions in startup wizard.
-   Hide blocked elements.
-   Allow to hide blocked flash.

### Poshuku WYFV

-   New plugin, allows to use any media player like \[\[LMP\]\] to watch
    video without Flash installed.

### Qrosp

-   New plugin for scripting support, Python and JavaScript currently.

### SeekThru

-   Allow to hide navigation bar for the embedded web widget.

### Summary

-   New plugin, refactored from what was Summary tab in Core. Now uses
    the search MIME: `x-leechcraft/category-search-request`.
-   Moved Search stuff to a separate dock widget.
-   AND/OR searchers, not the results.
-   Context-dependent names for tabs.

### Tab++

-   New plugin for grouping tabs and generally better tabs management.

### Other

-   Added `genplugin.py` script to easily generate plugin stubs.

Fixes
-----

### Overall

-   Renamed `resources.qrc` to avoid clashes on, for example, Gentoo.
-   Parented messageboxes everywhere.
-   Use LC's notifications system to notify about errors
    whenever possible.
-   Optimized code which merges different models. Should sometimes be
    twice as fast.

### Core

-   Actions menu has a name now.
-   Save toolbar positions.
-   Return unique categories from `CoreProxy::GetSearchCategories()`.
-   Respect `lib64` compile-time option when loading plugins.
-   Fixed multiple-instance detection code, now always work correctly.
-   Disable window updates on startup to start faster.
-   More checks for null/destroyed models in `MergeModel`. Fixes a
    couple of crashes.
-   Severely optimized `CategorySelector`.
-   Refactored Notification System.
-   `TagsLineEdit` won't intercept shortcuts anymore.
-   Fixed completion of tags with multiple words.
-   Correctly show toolbar for the very first tab.
-   Emit `tagsChosen` with the tag chosen from completion/selecor.
-   Fixed completing first item in the list.
-   Use correct locale in `XmlSettingsDialog`.
-   Better `Util::GetLocale` behavior.
-   Small Windows-related fixes.
-   Fixed memory leak in translator installation: if translation loading
    failed, delete the object.
-   Support default=true/false attrs for checkable items.
-   Better adaptors support to handle those from
    `IPluginAdaptor` everywhere.
-   Load plugins with `ExportExternalSymbolsHint`.
-   Show plugins description instead of filename and wrap long rows.
-   MergeModel is more failsafe now — detect when underlying source
    models are destroyed.
-   Theme path search fix.
-   Properly parent the TabContainer.
-   Swap tooltip widgets when swapping tabs.
-   Fixed segfault on non-multitabs tabs.
-   Better `Util::TreeItem` interface.
-   Show menu on action trigger as well.
-   Hopefully fixed SSL dialog crashes.
-   Fixed segfaults when there are no tabs.
-   Slightly changed initialization order for plugins with tabs.
-   LANG detection fix.
-   Fixed some tabs not restoring.
-   Refactored XmlSettingsDialogs.
-   Hide window on exit immediately.
-   Fixed multiple Glance instances showing up.
-   Fixed tab names desync when opening tabs next to current is enabled.
-   Full screen Glance view.
-   Some SSL errors dialog fixes.
-   Show only "Entity" fiels for the common job adder.
-   Renamed DownloadEntity to Entity.
-   Better menu in the tab bar.

### Aggregator

-   Fixed channels with empty links.
-   Better error logging.
-   Release/Cleanup fixes.
-   Remember "Hide read" state.
-   Severely optimized feeds with categories.
-   Severely optimized ItemsFilterModel.
-   Extremely optimized feeds updates especially if we already have a
    lot of items locally in that feed. Less disk activity, less DB
    pressure, less comparisons, a whole lot faster and smoother stuff.
-   Style fixes.
-   Fully separated Summary views and Aggregator's own tab views.
-   Fixed segfaults on exit.
-   Correctly handle foreign tasks.
-   Correctly trim by number: remove excessive items only from the
    channel where they are excessive.
-   Correcly handle RSS 2.0 feeds with no dates.
-   Better user notifications.
-   Fixed that after addition feeds are unviewable until restart.
-   </code>SettingsSink</code> has a parent now.
-   Merged Link and Title into one hyperlink in `ItemsWidget`.
-   Fixed out-of-sync selections.
-   Enable/disable mark/add to item bucket actions when no items
    are selected.
-   Generate better fb2 exports.
-   Show RSS icon for iconless channels.
-   Properly filter in merge mode.
-   Better handling of MediaRSS.
-   Consider LinkRel attribute.
-   Moved lots of actions to the menu.
-   Fixed HTML markup in titles.
-   Nicer items rendering.
-   Experimental "Unread items on top" mode.
-   Detect also non-namespaced "author" tags in RSS feeds.
-   Refactored database. Should be better and faster now.
-   Fixed broken items search.
-   Fixed a segfault on task delegation failure.
-   Notify about failed delegations.

### BitTorrent

-   Emit `fileFinished()` with `QUrl` rather than with `QString`.
-   Redesigned a bit the AddTorrent dialog.
-   Some UTF-8-related fixes.
-   Fixed incorrect size of folders in `TorrentFilesModel`.
-   Fast speed control now compatible with Summary.
-   Better handling of the version.
-   Reworked new torrent wizard a bit. Allow to select files now.
-   Don't remove old torrents when saving session.
-   Restructured the settings.
-   Fixed addition of paused torrents.
-   Fixed compilation on gcc 4.5.
-   Fixed segfault on Windows when BitTorrent is run for the first time.

### CSTP

-   Timer-based interface updates instead of event-based. Should be less
    CPU-hungry now.
-   Better error handling & notification about errors.
-   Take into account content-disposition and metadata from the replies.
-   Removed one obsolete now proxy model, should speed things up a
    little bit.
-   Moved some code to `SecondInit()` to avoid segfaults on
    some systems.
-   Long file names & other similar things handling in CSTP.
-   Show errors about failed files to the user.

### DBusManager

-   Check for proper connection in CouldHandle.
-   Fixed a rare segfault on startup.

### LMP

-   Fixed `KeyInterceptor`.
-   Proper initial volume.
-   Properly enqueue tasks.

### NetworkMonitor

-   Fixed a rare segfault when `QNetworkReply` could be deleted without
    emitting `finished()` or `error()` signal.

### Poshuku

-   Renamed to Poshuku Browser.
-   Ask for page restore even if title is empty.
-   Handle well links to RSS/Atom feeds with empty/no titles.
-   Return proper tags for `RoleTags` in `FavoritesModel`.
-   Don't show tags that don't exist.
-   Properly check tags.
-   Add to history on title changes as well.
-   Show correct image in error page.
-   Check if passed plugin is a good one.
-   Fixed a possible segfault on misinitialization.
-   Save page position in session.
-   Fixed wrong init.
-   Better session saving.
-   Fixed random jumps.
-   Show More and External menus on action trigger as well.
-   Moved some actions to the Tools menu.
-   Autodiscovery has been rewritten with QWebElement API. Should detect
    external resources on more sites.
-   Moved Import/Export XBel actions to menu.
-   Correctly handle theme updates for Reload/Stop button.
-   Primitives antialiasing off by default now (extremely slow).
-   Correctly handle IP urls like `::1`.
-   Fixed some bugs in Favorites with Flat to Folders proxy model.
    Should get rid of wrong tags after addition and such things.
-   Finally fixed Ctrl+C.
-   Error handling working on Qt ≥4.6.
-   Fixed handling of unknown schemes.
-   Propertly handle names/icons for first tab.
-   Saner size calculation for tab previews/thumbnails.
-   Correctly handle percent-encoded URLs.
-   Fixed handling of non-UTF URLs.
-   Working GMail (though not working password manager for now).
-   Migrated to hook-based slots.
-   Don't add items to history on title change.
-   Handle non-UTF8 symbols correctly in history.
-   Fixes for dark palettes.
-   Fixed a deadlock.
-   Fixes for database migration.
-   Fixed Qt 4.6 compatibility.

### Poshuku CleanWeb

-   Correctly reject the filtered connection and return a valid reply.
-   Slight optimization: don't check against the filters if
    `originatingObject()` is null.
-   Optimization: don't check data: uris.
-   Fixed segfaults when clicking on the "Load flash" button.
-   Notifications about successful addition of a new subscription.

### SeekThru

-   Fixed segfaults on errors.
-   Fixed rare segfault in StartupFirstPage by initializing header only
    after model has been populated.

### vGrabber

-   Fixed/updated vkontakte's audio regexps.
-   Removed some old and outdated stuff.
-   Correctly work with cp1251 encoding and cyrillic names.
-   Context menu and action to copy URL to clipboard.