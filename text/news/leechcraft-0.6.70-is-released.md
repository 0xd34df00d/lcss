---
title: LeechCraft 0.6.70 is released!
tags: release, 0.7.x
published: 2014-07-28T19:19:50
---

Today LeechCraft 0.6.70 "Severance" is released!

Three months and almost two thousands of commits have passed since the
previous release, and we are proud to announce some new plugins and
quite a few improvements, optimizations and fixes!

Two thousands of commits brought a lot of new features and changes, so
this announce covers them from a bird's eye. Please refer to the
changelog if you wish more detailed list of changes.

LMP
---

Let's start with the [LMP](/plugins-lmp) audio player.

First, it's worth noting the newly added support for creating
AdvancedNotifications rules directly from the playlist:

\[img\_assist|url=images/lmp\_rules1.png|title=|align=inline|link=1|width=440\]

Choosing the menu item automatically opens AdvancedNotifications
settings tab with all fields filled according to the track selected, so
all that's left is to configure the notification methods:

\[img\_assist|url=images/lmp\_rules2.png|title=|align=inline|link=1|width=440\]

The tracks with the associated rules are marked by a flag colored
according to the rule color (that can be set in the [Advanced
Notifications](/plugins-advancednotifications) settings), filled if the
rule is enabled and hollow if it is disabled. It is also possible to
directly open the rules configuration from the track menu:

\[img\_assist|url=images/lmp\_rules4.png|title=|align=inline|link=1|width=440\]

That's what we call "modules integration"!

### Effects

LMP also got support for various filters and effects in the 0.6.65
version, and, as promised, some new effects were added in this release,
like [FrAdj](/plugins-lmp-fradj),a 10-band equalizer effect with
presets:

\[img\_assist|url=images/lmp\_fradj1.png|title=|align=inline|link=1|width=440\]

Perhaps the most interesting effect is
[HttStream](/plugins-lmp-httstream) — streaming module, allowing one to
stream music playing in LMP to other devices via HTTP. It is possible to
add many copies of this filter, listening on different interfaces/ports
and encoding the stream at different bitrates. This way music can be
streamed with maximum quality on a local area network, and two
instances, with high-quality and medium-quality encoding, can be exposed
to the Internet, for example.

\[img\_assist|url=images/lmp\_httstream1.png|title=|align=inline|link=1|width=440\]

We think of adding a web interface and an RPC API to LMP in nearest
releases, which, combined with HttStream, can turn LMP into a small
media server.

### BrainSlugz

Another new LMP subplugin added in this release is
[BrainSlugz](/plugins-lmp-brainslugz), checking the local user's
discography for new missed releases:
\[img\_assist|url=images/lmp\_brainslugz1.png|title=|align=inline|link=1|width=440\]

BrainSlugz uses other first-level plugins like MusicZombie (for
MusicBrainz) to query the discographies, thus other information sources
can easily be added by merely writing a new module without changing
BrainSlugz.

NetStoreManager
---------------

[NetStoreManager](/plugins-netstoremanager), our cloud storage manager
plugin, has got a submodule for Dropbox support, supporting everything
it should support: file uploads, downloads, file listings and so on.
Dropbox guys haven't issued a fully working key yet, though.

Also, NetStoreManager now supports parallel mass downloading all
selected files from the GUI.

Eleeminator
-----------

Quite a long-awaited plugin, [Eleeminator](/plugins-eleeminator) brings
a terminal emulator to LeechCraft:

\[img\_assist|url=images/eleeminator1.png|title=|align=inline|link=1|width=440\]

It supports everything one would expect from a terminal emulator:
multiple tabs, configurable color schemes, clipboard, links detection
and opening. It integrates well with Advanced Notifications, allowing
creation of the notification rules for bells in terminals.

Eleeminator also keeps track of the programs running in each terminal
tab, updating the title accordingly. It also shows a warning if one
tries to close a tab with something running in either background or
foreground:

\[img\_assist|url=images/eleeminator2.png|title=|align=inline|link=1|width=440\]

Eleeminator is based on the QTermWidget library, and some code has been
contributed back to that project.

Poshuku
-------

[Poshuku](/plugins-poshuku) is our web browser module, and it has got
support for quite a few new plugins and features in this release.

### DC/AC

A simple but useful module, [DC/AC](/plugins-poshuku-dcac) provides a
color invertor working on any site without any custom CSS:

\[img\_assist|url=images/poshuku\_dcac1.png|title=|align=inline|link=1|width=440\]

It also supports a thresholded mode, when colors are inverted only when
the web page in question is brighter that some given threshold.

### SpeedDial

Another long-awaited plugin which, as the name goes, adds Speed Dial
functionality to the Poshuku browser:

\[img\_assist|url=images/poshuku\_speeddial1.png|title=|align=inline|link=1|width=440\]

[SpeedDial](/plugins-poshuku-speeddial) supports automatic mode as well
as a static list of pages. In the former case two lists are shown: one
for most frequently visited pages and another one for most frequently
visited hosts. This way if you visit, say, different Slashdot pages
quite often from your RSS feed reader, each page would have quite low
visits frequency and rating, but Slashdot would still show up in the
list.

### QRd

Allows one to generate a QR code representing the current page. This can
be quite handy to send the URL of a page to a smartphone or a tablet.

### Poshuku itself

The core of the [Poshuku](/plugins-poshuku) module has got an SSL badge
notifying about the security of the current connection, whether the
connection is fully secure, or some elements were loaded via unencrypted
connection, or there were some SSL errors. Teh corresponding dialog
allows viewing the certificates chain:

\[img\_assist|url=images/poshuku\_certs1.png|title=|align=inline|link=1|width=440\]

and the list of elements loaded via insecure connection:

\[img\_assist|url=images/poshuku\_certs2.png|title=|align=inline|link=1|width=440\]

AdvancedNotifications Dolle
---------------------------

The OS X-specific notifications module has been refactored out of the
Pierre plugin into the Dolle submodule. It now supports showing
differently colored badges for different events in the OS X dock, so
counters for, say, chat rooms and private messages are shown separately
now. Combined with the support for colors in the [Advanced
Notifications](/plugins-advancednotifications) rules added in this
release, this can be used to easily distinguish between different event
types:

\[img\_assist|url=images/dolle1\_done.png|title=|align=inline|link=1|width=440\]

Azoth
-----

[Azoth](/plugins-azoth), the IM client, has been migrated to
QtMultimediaKit for the Jingle support. QtMultimediaKit from the
QtMobility package provides more solid, stable and glitchless experience
than plain QtMultimedia in Qt 4, so the Jingle support can now be
considered somewhat completed.

A new module has been added, [Azoth
MuCommands](/plugins-azoth-mucommands), providing support for various
IRC-like commands, like `/whois`, `/ping`, `/last` and so on. This way,
mouseless Azoth became much more feasible and usable. The page dedicated
to this plugin contains an up-to-date list of the commands.

File transfer notifications have been improved. They now contain buttons
for quickly opening the file just transferred, and a persistent
notification has also been added, so that a finished file transfer can
be seen even if the original notification has been missed.

The tooltips for the entries in the contact list are now generated
lazily on hover, saving around 100 KiB of memory per contact. The
tooltips themselves have also become a little bit more neat, showing the
client and status icons, as well as the contact's time (if available):

\[img\_assist|url=images/azoth\_tooltip1\_cut.png|title=|align=inline|link=1|width=660\]

The [OTR support module](/plugins-azoth-otroid) now supports
question-based and shared secred authentication:

\[img\_assist|url=images/azoth\_otroid\_auth1.png|title=|align=inline|link=1|width=440\]

as well as managing fingerprints:

\[img\_assist|url=images/azoth\_otroid\_priv2.png|title=|align=inline|link=1|width=440\]

and accounts keys:

\[img\_assist|url=images/azoth\_otroid\_priv1.png|title=|align=inline|link=1|width=440\]

The [ChatHistory](/plugins-azoth-chathistory) module has got a new
improved search box, along with the forward and case-insensitive search
(the latter is available only if SQLite is built with ICU):

\[img\_assist|url=images/azoth\_ch1\_0.png|title=|align=inline|link=1|width=660\]

Monocle
-------

[Monocle](/plugins-monocle) now supports redirection backend plugins
that merely convert a document from one format to another one, probably
supported by another Monocle plugin.

Annotations' contents can now be copied to clipboard, and the actions
shortcuts are now configurable.

The Postrus PostScript support module has been rewritten to just call a
converter from `.ps`{type="bash"} to `.pdf`{type="bash"}, as previously
calling Ghostscript from the same process Poppler resides in led to
nasty crashes.

Otlozhu
-------

[Otlozhu](/plugins-otlozhu), our todo manager, now supports hierarchical
tasks:

\[img\_assist|url=images/otlozhu\_hier1.png|title=|align=inline|link=1|width=440\]

It has also got a lot of smaller improvements, mostly in GUI. The
calendar pane is now resizable, for example, and the comment editing
dialog now supports multiline comments.

Other
-----

- LeechCraft as a whole now respects XDG standards a little bit more.
  Particularly it now stores its non-important data, like browser
  cache, LMP cache or Azoth avatars, in `$XDG_CACHE_DIR`{type="bash"}.
- The utility library has been split into multiple smaller almost
  independent libraries, allowing the plugins to link to only those
  libraries they use instead of the big single Util blob.
- The Azoth p100q module has been removed since the psto.net
  microblogging service has been closed quite some time ago in favour
  of point.im.
- The [BitTorrent](/plugins-bittorrent) module now supports adding
  magnet links via its UI (instead of delegating it from other
  plugins), and its dialogs became non-modal.
- [CSTP](/plugins-cstp) module now supports UTF8-encoded
  content-disposition header.
- HotSensors module has got OS X support.
- HttHare module now supports FreeBSD.
- [New Life](/plugins-newlife) now supports importing Opera RSS
  database, though only the feed list is imported for now.
- The SysNotify module, providing notifications via a libnotify
  daemon, now supports showing images in the notifications if the used
  daemon supports them.
- The [TabSessManager](/plugins-tabsessmanager) module finally
  supports multiple windows, recovering the tabs in those windows they
  were on close.

Optimizations:

- Azoth LastSeen now loads and saves the statistics asynchronously,
  speeding up load times and avoiding short freezes.
- [Azoth Xoox](/plugins-azoth-xoox) now saves the roster much less
  frequently, ignoring not interesting events like fetching the same
  VCard as the one already stored or fetching information about a MUC
  room participant that is not present in roster anyway.
- Azoth Xoox now also saves avatars asynchronously.
- [BitTorrent](/plugins-bittorrent) module has been optimized,
  notifying the UI only about changes in those torrent whose state has
  been actually changed. This provides quite a big performance and
  energy efficiency improvement for the cases of having a lot of
  torrents added.
- [LMP](/plugins-lmp) now loads album art asynchronously when adding
  tracks to playlist, speeding up reaction to adding the whole
  collection, for example, by an order of magnitude.
- LMP now also queues up the changed paths and removes any paths that
  are children of other already scheduled paths, optimizing a lot for
  the case when a whole directory tree has been changed at once, for
  example, as a result of directory unmounting.
- [SB2](/plugins-sb2) now got a much more optimized Desaturate effect,
  at least on x86 and derivatives.

Among the fixes for the nastiest crashes and bugs:

- NetStoreManager GoogleDrive now correctly handles multipage results,
  showing all available files.
- Fixed a crash in [Azoth Xoox](/plugins-azoth-xoox) when trying to
  delete an entry that never came online but is present in the roster.
- Fixed a crash in Azoth Xoox when a MUC participant gets the nick of
  another participant after a rename.
- Fixed a few other crashes in Azoth Xoox related to
  participant renames.
- Fixed a crash in [DeadLyrics](/plugins-deadlyrics) on receiving an
  erroneous reply.
- Fixed a rare crash in LMP on some systems on switching to
  Devices pane.
- Fixed items filtering in LackMan.
- Fixed validating documents in the [LHTR](/plugins-lhtr) WYSIWYG
  editor, leading to erroneous LHTR state if the document contained
  entities not allowed by the XML specification.
- Fixed synchronization issues in LMP MTPSync module which tried to
  query the device the audiofiles currently being transferred to,
  screwing up the transfers.
- Fixed crashes when opening PDF documents if Monocle Postrus module
  is loaded (yes, that was mentioned earlier, but that's quite an
  important fix worth mentioning here again).
- Fixed a crash in Poshuku when closing a tab with Web
  Inspector opened.
- Dock widgets like Azoth's one now have a corresponding action in
  main menu. Before this reopening them after closing was impossible
  without resorting to SB2.

The source archive is [already
available](http://dist.leechcraft.org/LeechCraft/0.6.70/leechcraft-0.6.70.tar.xz),
so is [OS X
bundle](http://dist.leechcraft.org/LeechCraft/0.6.70/LeechCraft-0.6.70.dmg).
Packages for other OSes are coming soon.

By the way, this is the first release available in the FreeBSD ports
collection. To install, just issue
`portmaster x11/leechcraft`{type="bash"} or
`make -C x11/leechcraft install clean`. Whole LeechCraft is represented
as a single port file for now, please let us know if this seems
inconvenient to you!

Anyway, we will continue to work on FreeBSD support in modules like
[Liznoo](/plugins-liznoo) and [Vrooby](/plugins-vrooby), as well as
provide seamless experience for Linux systems without systemd.
