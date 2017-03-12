---
title: Changelog for 0.4.65
tags: changelog, 0.5
published: 2011-01-18T00:39:46

---

New features
------------

### Core

-   Added `listview` item type to XSD.

### Aggregator

-   [\#260](http://dev.leechcraft.org/issues/260): mark all as read or
    unread by tag category.

### Azoth

This section features both Azoth and its plugins like Azoth Xoox.

-   Added feature to grant or deny authentication.
-   Request authentication when granting it to another contact.
-   Lots of small fixes in UI and representation.
-   Connect to MUCs that were joined while being offline.
-   Support showing VCards.
-   [\#242](http://dev.leechcraft.org/issues/242): support
    `/nick` command.
-   Support `/me` in chats.
-   [\#241](http://dev.leechcraft.org/issues/241): support changing
    roles and affiliations in MUCs.
-   [\#240](http://dev.leechcraft.org/issues/240): support kicking
    and banning.
-   [\#236](http://dev.leechcraft.org/issues/236): show MUC subject in
    tab instead of separate dialog.
-   Allow to change MUC subject.
-   Detect role/affiliation changes and notify about them.
-   [\#185](http://dev.leechcraft.org/issues/185): allow to add
    new contacts.
-   [\#186](http://dev.leechcraft.org/issues/186): support renaming
    items in contact list.
-   [\#239](http://dev.leechcraft.org/issues/239): support manipulation
    authentification from contact's context menu.
-   [\#253](http://dev.leechcraft.org/issues/253): allow to hide
    offline contacts.
-   Draw icon for state of the account.
-   Stubs for client version detection.
-   Nicer delegate, showing client icons.
-   [\#187](http://dev.leechcraft.org/issues/187): allow to remove items
    from contact list.
-   [\#269](http://dev.leechcraft.org/issues/269): support proxies, take
    the settings from the Core.
-   [\#262](http://dev.leechcraft.org/issues/262): nicer Change
    Status menu.

### Poshuku

#### OnlineBookmarks

-   [\#60](http://dev.leechcraft.org/issues/60): added plugin for
    synchronizing bookmarks with various social bookmarks services like
    Read It Later.

### Syncer

-   Use host, port, login and password from syncer settings.

Fixes
-----

### Aggregator

-   Removed dependency on boost.date\_time.
-   [\#261](http://dev.leechcraft.org/issues/261): disable actions that
    are not needed if no item is selected.
-   Reset items model if corresponding channel has been deleted.

### Azoth

-   Store outgoing private messages as well.
-   [\#238](http://dev.leechcraft.org/issues/238): don't allow joining a
    conference if it's already joined.
-   [\#243](http://dev.leechcraft.org/issues/243),
    [\#244](http://dev.leechcraft.org/issues/244),
    [\#245](http://dev.leechcraft.org/issues/245): fixed lots of smaller
    bugs with connections to MUCs.
-   Nicer calculation of message edit height in chat tabs.
-   Show proper self nick in chats.
-   [\#249](http://dev.leechcraft.org/issues/249): update account list
    in preferences when needed.
-   Fixed display of %1 in chats.
-   Smooth avatar scaling in contact list.
-   Cache scaled avatars: eat less CPU (or, at least, perform faster)
    when resizing/scrolling contact list.

### Poshuku

-   Fixed "Remove Bookmarks" action triggered on tag category: remove
    all bookmarks with that tag instead of segfault.