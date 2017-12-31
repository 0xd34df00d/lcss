---
title: LeechCraft 0.5.90 is released
tags: release, 0.6.x
published: 2012-12-22T05:55:15

---

LeechCraft 0.5.90 "Architect of The Apocalypse" is released!

This is one more "long" milestone — more than two months have passed
since LeechCraft 0.5.85, but we've done quite enormous amount of work
and we are proud to present this release.

LMP
---

[LeechCraft Music Player](/plugins-lmp) got some new tasty features and
improvements, particularly coupled with our new plugins
[MusicZombie](/plugins-musiczombie) and
[TouchStreams](/plugins-touchstreams), providing access to MusicBrainz
database and VK.com audio collection respectively.

For example, if MusicZombie plugin is present, LMP can show the
discography and tracklist in biography view and in recent releases view:

\[img\_assist|url=images/lmp\_bio\_disco.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/lmp\_releases\_disco.png|title=|align=inline|link=1|width=440\]

Paired with TouchStreams plugin it can also automatically start
streaming tracks from VK.com (but that requires an active VK.com
account, at least for now) from a variety of places, like similar
artists, recommendations, recent releases and hypes. Generally a
loudspeaker icon appears near an item if it can be streamed:

\[img\_assist|url=images/lmp\_hypes.png|title=|align=inline|link=1|width=440\]

By the way, fetching hyped artists and tracks — both most popular and
most growing ones — is another new feature of LMP in this release, so
you can stay tuned to all new trends with LMP!

Thanks to the modular architecture of LeechCraft, adding another music
database (instead of MusicBrainz) or another stream source (instead of
VK.com) is just a matter of writing corresponding MusicZombie- or
TouchStreams-like plugins without ever touching LMP.

LMP was also optimized a lot:

- library loading became about two orders of magnitude faster;
- file modification time is considered now when rescanning, so
  collection rescans on file changes are much, much faster now, as
  well as collection rescans on startup.

SB2
---

Here we come to the greatest part of this release: the new
[SB2](/plugins-sb2) plugin, which is our next-generation sidebar. Its UI
is implemented entirely in QML, which allows one to write nice,
informative and fancy widgets (or, as we call the, *quarks*) with
animation and runtime graphics generation, which was nearly impossible
with the old QAction-based sidebar. Quarks can be written either
entirely in QML or in hybrid approach, where the logic is implemented in
C++ and QML is for presentation only.

SB2 offers plugin launcher (with neat indication of what tabs are
already opened, and a quick switcher between those), tray and quick
launch areas and almost everything that the old sidebar was capable of,
and more:

\[img\_assist|url=images/sb2\_launcher.png|title=|align=inline|link=1|width=440\]

There are already some quarks exclusive to SB2, like the
[TPI](/plugins-tpi) plugin, standing for Task Progress Indicator:

\[img\_assist|url=images/sb2\_tpi.png|title=|align=inline|link=1|width=440\]

or [Lemon](/plugins-lemon), which monitors traffic usage on network
interfaces:

\[img\_assist|url=images/lemon\_full.png|title=|align=inline|link=1|width=440\]

Of course, no such thing goes without analog clock, which will be
available through [LackMan](/plugins-lackman) package manager. Here it
is near Lemon indicators:

\[img\_assist|url=images/lemon\_indicators\_focused.png|title=|align=inline|link=1|width=440\]

TPI and Lemon have parts written in C++, but the analog clock quark is
in pure QML, which allows us to deliver it via LackMan.

SB2's intrinsic vector nature also allows it to be scaled without any
problems:

\[img\_assist|url=images/sb2\_scaled.png|title=|align=inline|link=1|width=440\]

SB2 also lays foundation for things we'd like to implement in next
versions. For example, we have plans for a Dashboard tab which will also
contain quarks ranging from yet one more analog clock to, say, RSS
quark, weather quark or calendar with social networks integration. This
somewhat resembles KDE's Plasma (and, in fact, is partially inspired by
Plasma, hence the name).

Color themes
------------

Due to increasing usage of QML in LeechCraft, support for color themes
has been added. These themes are based off KDE's ones, but also offer
more colors to customize all those QML things, for example, in LMP and
SB2:

\[img\_assist|url=images/color\_zion.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/color\_bluesilence.png|title=|align=inline|link=1|width=440\]

Blogique
--------

Another new plugin in this release is Blogique, a modular blogging
client. For now it only works with LiveJournal via the Metida subplugin,
which already supports all post fields available ranging from the post
body itself to mood, location and avatar. It also supports fetching all
the entries from a blog as well as local drafts and backups:

\[img\_assist|url=images/blogique.png|title=|align=inline|link=1|width=440\]

LHTR module is used for editing (potentially any other editor can be
used, if written), providing WYSIWYG functionality.

Adding other blog engines is fairly easy — it's just a matter of adding
another backend subplugin (much like protocols are added to Azoth or
formats are added to Monocle). No post options are hardcoded into
Blogique core, so the UI displays only what's supported by exact
blogging engine.

BitTorrent
----------

Only five years have passed since the introduction of the [BitTorrent
plugin](/plugins-bittorrent), and as many users asked we've finally
moved it to a separate tab:

\[img\_assist|url=images/torrenttab1.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/torrenttab2.png|title=|align=inline|link=1|width=440\]

Only basic info is left in [Summary](/plugins-summary):

\[img\_assist|url=images/torrent\_summary.png|title=|align=inline|link=1|width=440\]

Also, the code has been migrated to the new libtorrent 0.16 API where
possible, but it's still compatible with libtorrent 0.15.

Data filters architecture
-------------------------

A new concept of data filters have been added.

Basically, a data filter plugin is everything that can eat some text, an
image, or anything, and produce a meaningful result. For example,
Pogooglue plugin, which takes a string and opens a web browser window
for Googling that string, is conceptually a data filter.
[SeekThru](/plugins-seekthru) module, which provides OpenSearch support,
is a data filter as well. In this milestone this concept has been
unified, and SeekThru and Pogooglue implement all the respective
interfaces.

What that means for a user — there is a context menu in
[Azoth](/plugins-azoth) or [Poshuku](/plugins-poshuku) that offers to
handle selected text with text-supporting data filters:

\[img\_assist|url=images/azoth\_datafilters\_search.png|title=|align=inline|link=1|width=440\]

In future more data filters will be added, for example, an image filter
that uploads its input to an imagebin, or another image filter that
applies blur and posts the image to Instagram.

Other plugins
-------------

[Monocle](/plugins-monocle) document reader now supports PostScript
documents, and format backend selection is now content-based, not
extension-based. Monocle now also supports smooth scrolling, and a few
issues have been fixed.

Poshuku browser now properly formats and highlights XML instead of
showing it as-is:

\[img\_assist|url=images/poshuku\_xml.png|title=|align=inline|link=1|width=440\]

Among other significant changes:

- [Azoth](/plugins-azoth), our modular IM client, got a bunch of small
  fixes and improvements, particularly, its load time has been
  optimized a lot.
- [Kinotify](/plugins-kinotify) window styles have been fixed on Mac
  OS X.
- [Liznoo](/plugins-liznoo) power manager now supports Mac OS X.
- Pierre plugin now supports displaying a badge on Mac OS X labels.
- A bunch of .desktop-files have been added, so now you can open
  torrents, PDFs, and XMPP links in LeechCraft from any other
  application that's FreeDesktop-compliant.
- libotr-4 compatibility in Azoth OTRoid.

Packages and builds for supported distros and OSes will be available
soon. Watch your package manager or our [download page](/download)! The
source archive is already
[available](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.90/leechcraft-0.5.90.tar.xz/download).
