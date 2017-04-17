---
title: LMP
tags: plugins, lmp
published: 2014-04-02T19:52:01
shortdescr: LeechCraft Music Player is a collection-oriented music player based on GStreamer<sup>1</sup>
keyplugin: 1

---

LeechCraft Music Player is a collection-oriented music player based on
GStreamer^1^.

Features
--------

\
\

-   Collection-oriented music player with playback statistics.
-   Collection synchronization with portable media players,
    with transcoding.
-   Support for scrobbling played tracks to services like Last.FM.
-   Automatic fetching of album art if it's not present.
-   Support for requesting a bunch of information from services like
    Last.FM, including:
    -   artist biography;
    -   similar artists;
    -   personalized recommendations;
    -   recent releases by the artists in user's library;
    -   events nearby;
    -   hyped tracks and artists.
-   Fetching artists' discographies from MusicBrainz.
-   Previewing artsits, tracks and albums from VKontakte.
-   Support for fetching lyrics.
-   Gapless playback.
-   ReplayGain support.
-   Support for automatic calculation of ReplayGain metadata for audio
    tracks in collection, with support for album mode. The calculated
    data is stored in the collection database, leaving audio
    files intact.
-   Support for radio streams (of course, including Last.FM radio).
-   Play queue with different play modes like sequential, shuffle,
    repeating track/album/whole playlist.
-   MPRIS support.
-   Undo/redo for play queue.
-   Dynamic playlists like "50 Random Tracks".
-   Static playlists.
-   Support for M3U8, PLS and XSPF playlist formats.
-   Fast threaded collection scanner.

\
\
Some features in the above list rely on other plugins like
[LastFMScrobble](/plugins-lastfmscrobble).

Screenshots
-----------

\
\
\[img\_assist|url=images/lmp00.png|title=Biography|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp01.png|title=Collection|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp02.png|title=Similar
artists|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp07.png|title=Artists
browser|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp08.png|title=Lyrics|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp03.png|title=Recommendations|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp04.png|title=Recommended events
nearby|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp09.png|title=Recent releases with
discography|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp06.png|title=Hypes|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp05.png|title=Transcoding parameters on
sync|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/lmp\_4.png|title=Tray
icon|align=inline|link=1|width=440\]

Subplugins
----------

### MTPSync

\
\
Allows LMP to synchronize and upload music collection to MTP-enabled
portable devices.

Notes
-----

^1^ LMP uses Phonon instead of GStreamer in versions before and
including 0.6.0.