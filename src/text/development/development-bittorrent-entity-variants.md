---
title: Entity variants handled by BitTorrent
tags: entity handlers, bittorrent, development
published: 2010-11-26T22:19:48
parentPage: development-bittorrent
---

`Entity::Entity_` should be either `QUrl` or `QByteArray`. In all other
cases the entity is rejected.\
\

1.  `Entity::Entity_` is a `QUrl` Next, the URL's scheme is checked:
    1.  *magnet* If the query part contains the *xt=urn:btih:* part, the
        entity is accepted. If it doesn't, the entity is rejected. If
        the query part contains the key-value pair with *kt* pair, the
        corresponding value is split into list of strings by '+' symbol,
        and the resulting strings are interpreted as human-readable tags
        of the torrent.
    2.  *file* The URL is interpreted as a local file URL. If the file
        specified by the URL doesn't exist or isn't readable, the entity
        is rejected. Else, if it exists and is readable, it is checked
        whether it is less than the limit for torrent file size (set by
        user and contained in the *MaxAutoTorrentSize* property), and if
        it isn't, the entity is rejected. If it is less then the limit,
        it is read and checked for being a valid torrent file, and the
        entity is accepted or rejected correspondingly.

2.  `Entity::Entity_` is a `QByteArray` The byte array is checked
    whether it is a valid torrent file data. If it is, the entity is
    accepted and the torrent is added, otherwise the entity is rejected.

\
\
The following keys in the `Entity::Additional_` map are checked:

` Tags`
:   `QStringList` with tag IDs for this item. Please note that the first
    symbol is space.

`TryToStreamLive`
:   If the value is of type `bool` and is `true`, the special mode of
    live streaming will be enabled.
