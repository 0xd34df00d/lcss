---
title: Development digest #24
tags: digest, 0.6.x
published: 2012-05-25T14:34:28

---

Last two weeks were mostly dedicated to the [LMP](/plugins-lmp) media
player and everything that's around it. Some other plugins also got
their fair share of improvements, so let's just move to the changes
list:

-   Core: fixed a rare bug preventing to edit shortcuts.
-   Overall: changed tabs system to delegate tabs recovering to modules
    like [TabSessManager](/plugins-tabsessmanager).
-   [Azoth](/plugins-azoth): properly handle removal of styles.
-   Azoth: don't replace smiles in the middle of words.
-   Azoth: support showing/hiding accounts.
-   Azoth Rosenthal: get rid of bundled Hunspell, use system's
    one instead.
-   [Azoth Vader](/plugins-azoth-vader): support assigning phones
    to contacts.
-   Azoth Vader: protocol logging is now optional.
-   Azoth Vader: removed excessive auth requests.
-   Azoth Vader: fixed a rare segfault on giving authentication.
-   Azoth Vader: better buddy handling on authentication operations.
-   [Azoth Xoox](/plugins-azoth-xoox): enable to add/edit/remove phones
    and emails in VCards.
-   [BitTorrent](/plugins-bittorrent): show more information in Summary
    like uploading speed and number of seeders/leechers.
-   DeadLyrics: rewritten to provide texts to LMP using
    Amarok descriptions.
-   [Kinotify](/plugins-kinotify): disable notifications on fullscreen
    apps so that user isn't distracted if he plays a fullscreen game or
    watches a movie (Win32 only yet).
-   [LMP](/plugins-lmp): support requesting lyrics.
-   LMP: manipulate collection via the FS tree.
-   LMP: allow one to stop after a given track.
-   LMP: automatically request album art for collection.
-   LMP: added system tray icon.
-   LMP: save last played song and play mode.
-   LMP: support for Drag-n-Drop here or there.
-   LMP: support for XSPF and PLS playlists.
-   LMP: support rescanning collection.
-   LMP: fixed issues with TagLib reentrancy.