---
title: BitTorrent
tags: plugins, bittorrent
shortdescr: feature-rich, fast and efficient client for BitTorrent protocol
keyplugin: 1
---

BitTorrent is a feature-rich, fast and efficient client for BitTorrent
protocol.

\[img\_assist|url=images/torrenttab1.png|title=Torrent tab|align=inline|link=1|width=440\]

\[img\_assist|url=images/torrenttab2.png|title=Torrent tab|align=inline|link=1|width=440\]

\[img\_assist|url=images/torrent\_summary.png|title=Torrents in Summary|align=inline|link=1|width=440\]

Features
--------
- Support for **DHT**.
- **Magnet links** support.
- **Sequential download** mode where torrent is download sequentially
instead of typically random behavior.
- Torrents **queue**, limiting number of seeding/leeching torrents and
**smartly rotating** them. Rotation depends on torrent's seed time,
ratio and other parameters.
- Ability to **rename** files and directories in the torrent and to
**change directory layout**.
- **Selective download**: possibility to select specific files from
torrent for download and set per-file priorities.
- Continue downloads left by any other client.
- Support for **sparse files**.
- **Tags** for torrents.
- Global and per-torrent **speed limits**.
- Connection number limits.
- **Fast resume** support to avoid long startup times.
- **IP filter** to block/unblock unwanted peers.
- Support for extension protocol
    - **PeX**
    - lt trackers
    - BEP 17 and BEP 19-compatible web seeds.
- Local peers discovery.
- **Multitracker** torrents support. Tracker requests can be either
sequnetial or parallel (in µTorrent style).
- Scrape support.
- **UDP trackers** support.
- Support for super seeding mode.
- **IPv6**
- Merkle hash tree torrent format.
- **Seed mode**, in which files are checked on first request instead of
full check on startup.
- Support for **HTTP/SOCKS proxy** servers.
- Support for tracker connection compression.
- Support for **automatic port mapping** on routers supporting NAT-PMP and
UPnP.
