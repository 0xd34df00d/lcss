---
title: LeechCraft 0.5.95 is released
tags: release, 0.6.x
published: 2013-04-28T18:13:13

---

LeechCraft 0.5.95 "Hate Creation" is finally released!

It took us more than four months and more than 1400 commits to make this
release happen, but it is worth it: we've implemented quite a few new
tasty features, some of them being requested for quite a long time, and
we've also fixed a whole bunch of things, from small annoying artifacts
to nasty crashes. Moreover, this is the first release under the new
Boost Software License.

Global changes
--------------

First of all, we've finally added multiple windows support to
LeechCraft, so now you can have all your IM chats in one window and web
pages in another one. LeechCraft has an option to open each tab class in
its own window automatically, so it will throw private chats in one
window, conferences in another one and, say, documents opened in Monocle
into third one. Moreover, this feature is very useful for those having
multiple monitors: one can put a long article to read or documentation
pages on one monitor and leave primary LeechCraft window on another one:

\[img\_assist|url=images/multimon.png|title=|align=inline|link=1|width=660\]

Plugins also support this new multiple windows feature. For example,
[SB2](/plugins-sb2) will keep different settings like panel placement
and quarks list for each window.

The multiple windows feature is still very experimental and may lead to
segfaults. Please report any problems with it!

Dock widgets management was improved considerably. Now only one dock can
be visible at a time on each side of each LeechCraft window, and the
dock windows are toggled via the corresponding toolbars or SB2 if it is
available.

Plugins with the most improvements are, as always,
[Azoth](/plugins-azoth), the IM client, [LMP](/plugins-lmp), the media
player, [Monocle](/plugins-monocle), the document reader, and
[SB2](/plugins-sb2), the next-generation sidebar plugin.

Azoth
-----

Azoth IM client became more keyboard-friendly with shortcuts for showing
quick navigation list with current MUC participants or contacts from the
whole roster, or for opening last detected link in a chat. It also saves
whether formatted messages are enabled for separate contacts now, so you
can have formatting disabled Azoth-wide and enabled for separate
contacts only, so next time chat tabs with those contacts are opened,
Azoth will automatically enable formatted messages. It is much faster
and stable now as well.

Azoth' subplugins were also improved. For example,
[Acetamide](/plugins-azoth-acetamide), the IRC protocol plugin, now
supports querying the list of channels on a server.
[AdiumStyles](/plugins-azoth-adiumstyles) was optimized a lot.
[ChatHistory](/plugins-azoth-chathistory) module loads history way
faster now. [Modnok](/plugins-azoth-modnok), the LaTeX renderer,
supports settings custom background colors and disabling antialiasing.
[Xoox](/plugins-azoth-xoox), the XMPP support plugin, got most fixes: it
now supports properly changing account password, forwards XHTML-IM
message body in Ad-Hoc commands and exposes TLS settings. It also has an
option for turning off requests for VCards and versions in MUCs,
considerably reducing traffic usage and server load in conferences.

And good news for some users of protocols currently not supported by
Azoth: work on a new plugin, [VelvetBird](/plugins-azoth-velvetbird),
has been started. VelvetBird is basically a wrapper around libpurple
adding support for protocols supported by it to Azoth. It is in its very
early stages now, some vitally important features are still missing
(working with authorization/subscription, for instance, is still
somewhat experimental), but some LeechCraft users already use it as well
and are generally happy with it.

LMP
---

LMP, the audio player for LeechCraft, has been improved a lot as well.
It now has a proper album art manager, supports showing artist browser
from a bunch of various places, supports previewing whole albums from
sites like VKontakte (if discography if available via plugins like
[LastFMScrobble](/plugins-lastfmscrobble) and
[MusicZombie](/plugins-musiczombie)).

LMP also has got a new subplugin, LMP Graffiti, which allows one to tag
audio files, split CUE files into separate tracks and obtain tags for
files from services like MusicBrainz via audio fingerprinting (if
corresponding plugins are installed):

\[img\_assist|url=images/lmp\_graffiti01.png|title=|align=inline|link=1|width=440\]

Monocle
-------

Monocle document reader now supports a bunch of new things:

- page thumbnails (with visually highlighting the currently displaying
  area);
- bookmarks;
- forms for PDF files;
- text searching.

\[img\_assist|url=images/monocle\_toc\_search.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/monocle\_thumbs.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/monocle\_forms.png|title=|align=inline|link=1|width=440\]

Monocle also allows searching for selected text via text searchers like
Pogooglue or [SeekThru](/plugins-seekthru) OpenSearch client.

A lot of behavior issues (mostly keeping state between Monocle launches)
were fixed as well. Monocle FXB, the fb2 format plugin, has been
optimized two-fold on a typical fb2 book.

SB2
---

SB2 now supports placing the panel in any window side, not only left
one. It also supports removing and reordering quarks now, and the quarks
can have settings as well:

\[img\_assist|url=images/sb2\_reordering.png|title=|align=inline|link=1|width=440\]

Panel placement preferences, as well as quark list, order and quark
settings can be different for different windows.

Other plugins
-------------

Blogique, the blog client, now supports such features as autosaving, tab
unclosing and session management with the
[TabSessManager](/plugins-tabsessmanager) plugin or showing recent
comments and inbox messages. It also supports keeping a local blog now.

GActs, the module for supporting global shortcuts, now bundles a patched
copy of required Qxt files with it. The patches add support for
assigning media keys to global shortcuts, a thing that upstream Qxt
misses (and seems to not accept the proposed patch for several years
already). GActs still supports building with system Qxt instead of
bundled one, but in this case one misses this media keys feature.

[Launchy](/plugins-launchy) module now supports favorites category where
applications and LeechCraft tabs can be added. Favorites will be shown
in quick launch area in SB2, if the corresponding quark is enabled:

\[img\_assist|url=images/launchy\_quicklaunch1\_ex.png|title=|align=inline|link=1|width=440\]

Launchy now also supports keyboard navigation as well as filtering the
list of applications by name, description or name of the executable.

[NetStoreManager](/plugins-netstoremanager) module (responsible for
cloud storages support) was reworked quite a bit. For example, there
were several stability improvements and older tree-based interface was
replaced by a more Total Commander-like thing.

Among other changes:

- [Aggregator](/plugins-aggregator) module got a major speedup.
- LHTR visual editor plugin now supports tables and some
  other features.
- [GMail Notifier](/plugins-gmailnotifier) module now supports showing
  a quark with the list of mail in the mailbox.
- [Liznoo](/plugins-liznoo) power manager has extended support for Mac
  OS now, with things like querying battery voltage or temperature.
- A new module has been added which provides a quark with temperatures
  readings from libsensors: HotSensors. It is experimental for now and
  is known to crash sometimes during heavy system load in
  Qt internals.
- [Poshuku](/plugins-poshuku) history widget has been fixed,
  supporting filtering by URL and eliminating duplicates in the
  same section.
- [Vrooby](/plugins-vrooby) module now supports UDisks2 and supports
  building with several backends at once, trying them in order at
  run time.

Several old and unsupported plugins were removed, among them:

- skaltDC++, the DirectConnect-client.
- LCFTP, the FTP client.
- TransparentArch, stub for easy access to archives contents.
- VFSCore, virtual file system implementation. This module had to be
  removed because the functionality it relied on is unavailable in Qt
  5 and there are no alternatives.
- Tab++, being replaced by TabsList and SB2.

These plugins were extracted into separate repositories, keeping all the
revisions that relate to them in case someone would take them over.

And now we are even closer to having a working LeechCraft installation
on Windows. For that, we had to migrate to the MinGW toolchain, since
MSVS' support for C++11 standard is pretty crappy yet.

Source tarball is already
[available](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.95/leechcraft-0.5.95.tar.xz/download),
so is [Mac OS X
build](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.95/leechcraft-0.5.95.dmg/download).
Packages for various Linux distros will be available later.

This is the last feature release in the 0.6 series, all other releases
until 0.6.0 will have no new features, only bug fixes. In fact, there
will be a separate branch for 0.6, and while the main development with
all new tasty things will happen in master, only bugfixes will be ported
to the 0.6 branch.

And now it's time for a couple of words about future plans. First of
all, we won't support Qt 5 until at least Qt 5.1 is released: Qt is
still to buggy, and it is insane to try to port quite a big and complex
codebase like LeechCraft to such thing for now. Then, we have some
awesome ideas for the upcoming 0.7 series after the feature freeze,
ranging from new plugins like finance manager and data sources concept
to full-blown desktop environment based on LeechCraft running out of the
box and without aid of things like KDE and friends. Stay tuned!
