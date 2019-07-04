---
title: LeechCraft 0.5.80 is released
tags: release, 0.6.x
published: 2012-08-11T11:35:09

---

In this release we've mostly focused on the [LMP](/plugins-lmp) and
[NetStoreManager](/plugins-netstoremanager) modules, but other modules
also got some interesting improvements. Also, it's time to announce the
[Monocle](/plugins-monocle) reader!

LMP
---

LMP, our music player, now has all proper logic for uploading songs to
cloud services, playing back uploaded songs, as well as, for example,
fetching playlists from such services. Support for exact clouds is added
via modules, in accordance with LeechCraft way, and for now only
MP3tunes.com service is supported. Since the foundation is already laid,
adding other clouds like Google Music would be much easier.

Much like with device synchronization, one can also transcode the songs
before uploading:

`{ "name": "lmp_uploading.png", "align": "inline", "title": "Cloud uploading", "thumb": "medium" }`{.img}

As one may see from this screenshot there is now a nice stats label
below the playlist, so that one can know exactly how much songs he added
and their total play time.

Regarding playlist improvements, there are now different sort modes, so
that one can now sort, for example, by file path or disable sorting at
all. If the sorting is disabled, then it's possible to move and reorder
tracks around with Drag'n'Drop, and the order of tracks addition is
preserved as tracks are added.

Among cosmetic changes are fixed background colors in QML elements and
optional ignoring of "The " when sorting artists in collection. This way
*The Autumn Offering* will be between *August Burns Red* and *Behold...
The Arctopus*. And shortcuts for different actions are configurable now,
too.

The newer LMP also supports recently released liblastfm-1.0 which broke
API compatibility with liblastfm-0.3.

NetStoreManager
---------------

NetStoreManager got initial support for the Google Drive cloud storage
service:

`{ "name": "nsm02.png", "align": "inline", "title": "Google Drive", "thumb": "medium" }`{.img}

Its core has been reworked so now it can easily support other similar
cloud storage services like Yandex.Disk. For now only uploading and
fetching the list of already uploaded files works, but in the next
milestone it'd have the rest of features, as well as automatic folder
synchronization.

Since the original Yandex.Narod doesn't fit the new idea of
NetStoreManager, its support will be removed after this milestone and
replaced with Yandex.Disk.

Monocle
-------

Though being available for some months already, this module only matured
now enough to be announced. So, meet [Monocle](/plugins-monocle): our
document reader. It already has quite enough features to use it on a
daily basis for most tasks. It supports displaying one page or
double-page spread, copying selection to image or text, scaling, width
and height fitting, tables of contents, links, paginated navigation and
printing. Monocle also integrates with the rest of LeechCraft so that it
automatically opens a PDF document after a link to it is clicked, for
example, in a browser or [Azoth](/plugins-azoth), and the document is
downloaded.

`{ "name": "monocle_pdf_01.png", "align": "inline", "title": "PDF document", "thumb": "medium" }`{.img}
`{ "name": "monocle_fb2_01.png", "align": "inline", "title": "FB2 document", "thumb": "medium" }`{.img}

Different formats are supported via different backend moudles, and for
now only PDF and fb2 file formats are supported. There are two backends
for PDF and one hand-written fb2 implementation.

PDF is supported either via Poppler library or through mupdf library.
The later is discouraged, since the mupdf backend supports not all
features that are supported by Poppler backend, but that may be fixed
some time in the future. And it is built as a static library, so some
magic is required to make it work in LeechCraft. For example, see [this
bugreport](https://bugs.gentoo.org/show_bug.cgi?id=407807).

The main reasoning behind adding mupdf backend is that some claim it
renders text much better than Poppler, but that's questionable.

Azoth
-----

[Azoth](/plugins-azoth) IM client also got its fair share of
improvements.

A new plugin has been added, Azoth BirthdayNotifier, which notifies
about birthdays of contacts in user's contact list. The dates are taken
from contacts' vCards, so this feature obviously relies on them being
properly filled out.

Azoth Xtazy now supports /np and /sharesong commands. /np pastes the
name of the currently played song into current chat, while /sharesong
uploads the song via plugins like NetStoreManager and pastes a link to
it. The former works with both LMP and MPRIS players, the latter
requires LMP only. This can be seen as yet one example of profits of
LeechCraft architecture and integration.

Azoth now finally displays user's avatar in tooltips:

`{ "name": "azoth_tooltip_01.png", "align": "inline", "title": "", "thumb": "medium" }`{.img}

Moreover, tabs of conferences with unread highlight messages are now
marked with a star sign ("\*").

QXmpp, the XMPP implementation library forked by us, has been synced
with the upstream. And seems like we're a bit closer to integrating our
custom patches to QXmpp with the upstream version. Integrating means
less mess, more chances to get into Debian repos, and is good and
healthy for the Open Source community — why fork when we can cooperate?
:)

Other modules
-------------

[Aggregator](/plugins-aggregator) now supports exporting feeds to PDF in
addition to previously supported fb2. One can adjust the parameters of
PDF export, like margins, fonts and font sizes, and paper size. The
resulting PDFs are perfect for reading on eBooks like Amazon Kindle.

The issue reporter [Dolozhee](/plugins-dolozhee) now supports fetching
issue categories from our tracker during issue reporting. This way one
can assign a category to the issue being reporterd right from Dolozhee
interface.

Of course, there was a bunch of other improvements, so don't forget to
check out our development digests if you're interested:
[\#28](/devel-digest-28) and [\#29](/devel-digest-29).

Packages and builds for supported distros and OSes will be available
soon. Watch your package manager or our [download page](/plugins)! The
source archive is [already
available](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.80/leechcraft-0.5.80.tar.xz/download).
