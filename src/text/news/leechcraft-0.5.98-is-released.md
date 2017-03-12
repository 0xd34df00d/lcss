---
title: LeechCraft 0.5.98 is released
tags: release, 0.6.x
published: 2013-07-06T17:20:23

---

LeechCraft 0.5.98 "Homecoming" is released today.\
\
Again, it is a purely bugfix release, only incorporating fixes from the
master development branch. The following things were fixed:

-   Core: show unassociated dock widgets before showing dock widgets
    corresponding to the current tab.
-   Core: fixed some segfaults on tab closes.
-   Core: fixed reusing IDs for jobs, fixing a few rare bugs in plugins
    like CSTP.
-   [Aggregator](/plugins-aggregator): always save provider for
    delegated jobs.
-   Aggregator: download the rest of the feeds after killing a stall.
-   [AN](/plugins-advancednotifications): moved "Update" button to a
    saner place.
-   AN: check if current rule is modified & suggest saving.
-   AN: fixed overlay text drawing on notification icons.
-   [Azoth](/plugins-azoth): fixed several rare segfaults.
-   Azoth: don't send "Paused" typing state after sending a message.
-   Azoth: take user-entered groups into account on roster
    item exchange.
-   Azoth: show JIDs in all users list.
-   Azoth: show contact JID in chat tab entry info line.
-   Azoth: activate first item in users list by default.
-   Azoth: don't try sending contact ID to another on Drag-n-Drop.
-   Azoth: change tab name after entry renaming.
-   [Azoth MetaContacts](/plugins-azoth-metacontacts): don't suggest
    unifying with MUC entries.
-   [Azoth Xoox](/plugins-azoth-xoox): properly handle server errors on
    form fetching.
-   Azoth Xoox: fetch versions for variant-less items as well (fixes
    fetching versions of MUC participants).
-   [Kinotify](/plugins-kinotify): fixed leaking state machine on
    each notification.
-   [LMP](/plugins-lmp): fixed broken synchronization symbol fixing.
-   LMP: temporary files are always removed after sync.
-   LMP: metadata is now mapped properly from the source.
-   [Monocle](/plugins-monocle): only render those pages that are
    actually visible.
-   Monocle: don't set negative scales.
-   Monocle: immediate scrolling to current page on load.
-   Monocle: menu is shown only if mouse moved with a button pressed.
-   Monocle Seen: safeguard against rendering a bunch of small images
    leading to memory exhaustion.
-   [TSM](/plugins-tabsessmanager): fixed occasional segfaults on
    tab closes.
-   [Vrooby](/plugins-vrooby): proper partition naming in
    UDisks2 backend.