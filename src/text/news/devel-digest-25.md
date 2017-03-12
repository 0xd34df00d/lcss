---
title: Development digest #25
tags: digest, 0.6.x
published: 2012-07-10T09:18:00

---

Since the 0.5.70 release, we've added the Lads plugin, which provides
some basic integration facilities with Unity, like displaying LeechCraft
menu in Unity's Launcher.\
\
Except that plugin, we mostly worked on [LMP](/plugins-lmp), and had
some fixes in other plugins. So here are some changes:\
\

-   [Azoth](/plugins-azoth): updated contact list delegate.
-   Azoth: highlighting groups is now optional.
-   [Azoth Xoox](/plugins-azoth-xoox): always show JID in the vCard.
-   [GMailNotifier](/plugins-gmailnotifier): if the username isn't set,
    the error is shown only once.
-   [Kinotify](/plugins-kinotify): support for X11 systems
    fullscreen detection.
-   [LastFMScrobble](/plugins-lastfmscrobble): support for requesting
    recommended artists.
-   LastFMScrobble: support for Last.FM radios.
-   LastFMScrobble: support for requesting recent releases in
    user's library.
-   LastFMScrobble: some scrobbling queue fixes.
-   LastFMScrobble: fetch artists biography.
-   [LMP](/plugins-lmp): support radio sources & allow one to play
    radio streams.
-   LMP: display personal recommendations for the user.
-   LMP: display recent releases for user's musical taste.
-   LMP: display biography of the currently playing artist.
-   LMP: configurable transition time between tracks.
-   LMP: current item is saved between playlist modifications.
-   LMP: album art can be viewed in full size in some places.
-   LMP: support undo/redo in playlist.
-   LMP: notify when local collection is updated.
-   LMP: on-start directory iteration is async now.
-   LMP: many library scanning fixes.
-   LMP: album time is properly reduced on items removal.
-   [Poshuku CleanWeb](/plugins-poshuku-cleanweb): fixed a segfault on
    premature frame destruction.
-   Sidebar: LeechCraft menu is shown here now.
-   [TabSessManager](/plugins-tabsessmanager): don't add empty tabs to
    the unclose list.
-   TabSessManager: delayed session saving.