---
title: Development digest #29
tags: digest, 0.6.x
published: 2012-08-11T08:36:52

---

Since the last development digest we've did a bunch of improvements here
or there, and added a couple of new plugins.

The most exciting improvement is that
[NetStoreManager](/plugins-netstoremanager) now supports Google Drive
service, and its core was reworked so that now it can easily support
other similar cloud storage services like Yandex.Disk. For now only
uploading and fetching the list of already uploaded files works. Since
the original Yandex.Narod doesn't fit the new idea of NetStoreManager,
its support will be removed after this milestone.

The other important module adds support for the MP3tunes.com service in
[LMP](/plugins-lmp). Only playlists, transcoding and uploading works,
but this module (and corresponding changes in LMP core) lay foundation
for other services like Google Music.

The third added plugin is not that exciting, but has been requested
quite a lot: it's a birthday notifier module for our
[Azoth](/plugins-azoth) IM client. It takes information about birthdays
from contacts' vCards, and one can also configure the desired days on
which to notify.

Среди прочих изменений:

- Core: fallback to using external apps is now optional.
- Core: fixed showing main window in some WMs.
- [Azoth](/plugins-azoth): autoselect other resources only when a chat
  message is recieved.
- Azoth: tooltip is updated on avatar changes.
- Azoth: added default queries in Service Discovery.
- Azoth: MUC icon is preserved on MUC tabs on account state change.
- Azoth: MUCs with unread highlight messages are marked with "\*" now.
- Azoth: more compatibility with full Unicode JIDs.
- Azoth: fixed a couple of bookmarks-related memory leaks.
- [Azoth ChatHistory](/plugins-azoth-chathistory): dates with logs for
  that day are displayed in bold.
- Azoth ChatHistory: configurable amount of logs to show on one page.
- [Azoth Xoox](/plugins-azoth-xoox): synced QXmpp with upstream.
- Azoth Xoox: added icon for odnoklassniki.
- Azoth Xoox: birthday field is now editable for self vcards.
- Azoth Xtazy: added /np and /sharesong commands.
- [BitTorrent](/plugins-bittorrent): optional flags for
  peers' countries.
- Glance: nice Close button right on thumbnails.
- LMP: support different sorting styles in the playlist.
- LMP: support Drag'n'Drop and actions for reordering items in
  the playlist.
- LMP: all found lyrics can be displayed, not the last found one.
- LMP: faster prescaler for huge album arts in notifications.
- LMP: fixed compatibility with taglib built without ASF or MP4.
- [NetStoreManager](/plugins-netstoremanager): other plugins can
  request uploads now.
