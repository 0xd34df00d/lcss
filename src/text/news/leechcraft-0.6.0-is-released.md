---
title: LeechCraft 0.6.0 is released!
tags: release, 0.6.x
published: 2013-09-14T13:22:49

---

Today is a great day for LeechCraft: version 0.6.0 "Surreal State of
Enlightenment" is released!\
\
We won't list the bugfixes since the 0.5.99 release candidate (well, we
will, but in the very end of this article), but rather describe what has
been added since previous major release, 0.5.0. And there is really
quite a lot of new things to talk about.\
\
The screenshots for this article are taken from the development branch
for the upcoming 0.6.60 version, but there isn't really much difference
except for a few new things here or there. <!--break-->

LMP
---

\
\
[LMP](/plugins-lmp), the LeechCraft Music Player, is possibly the plugin
we invested most time and effort in since Azoth. As you can guess from
the name, it is an audio player:\
\
Well, we had a plugin that could play music for quite some time, but it
was rather a stub. Now we have a proper collection- and social-oriented
player having everything you would expect from an audio player today and
that is ready to compete with monsters like Amarok:
\[img\_assist|url=images/lmp00.png|title=|align=inline|link=1|width=440\]\
\
It is based on music collections concept:
\[img\_assist|url=images/lmp01.png|title=|align=inline|link=1|width=440\]\
\
gets even better if you have a Last.FM account (and
[LastFMScrobble](/plugins-lastfmscrobble) module):
\[img\_assist|url=images/lmp03.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/lmp04.png|title=|align=inline|link=1|width=440\]\
\
allowing you to stay on the front edge of the new or hyped music:
\[img\_assist|url=images/lmp06.png|title=|align=inline|link=1|width=440\]\
\
as well as to discover what you may also like:
\[img\_assist|url=images/lmp03.png|title=|align=inline|link=1|width=440\]\
\
fetches lyrics automatically:
\[img\_assist|url=images/lmp08.png|title=|align=inline|link=1|width=440\]\
\
supports transcoding to removable devices (dumb flash-like in 0.6.0, but
full MTP support is already implemented in master development branch and
will be present in 0.6.60):
\[img\_assist|url=images/lmp05.png|title=|align=inline|link=1|width=440\]\
\
can fetch artists discographies (from MusicBrainz via
[MusicZombie](/plugins-musiczombie) module, for example) and preview
them from VKontakte, and allow one to just browse information about
artists:
\[img\_assist|url=images/lmp07.png|title=|align=inline|link=1|width=440\]\
\
The player integrates with the rest of LeechCraft, so that Azoth can
automatically announce what tune you are listening to via XMPP User Tune
extension or similar means for other protocols.\
\
It also has some other cool features, like MPRIS on \*NIX systems or
support for cloud services like MP3Tunes and a general catalogue of
Icecast/Shoutcast streams via the HotStreams module.\
\
LMP also has a subplugin, Graffiti, for tag manipulation, CUE files
splitting:
\[img\_assist|url=images/lmpgraffiti01.png|title=|align=inline|link=1|width=440\]\
\
LMP Graffiti also supports renaming files according to a mask and
fetching tags from MusicBrainz/AcoustID by the means of acoustic
fingerprinting:\
\
Support for all the external services is implemented via separate
plugins, so integrating with Jamendo, Grooveshark, Google Music or
analogs of MusicBrainz is a matter of writing another plugin completely
separate from LMP's code.\
\
In the upcoming 0.6.60 LMP will be based on GStreamer instead of Phonon
in 0.6.0, and the transition is already made. The switch allowed us to
implement a proper and always-working gapless playback and gives us an
opportunity to add support for nice features like ReplayGain or a proper
equalizer later.

SB2
---

\
\
We had a sidebar panel in the 0.5.0 release, and this is a complete
rewrite of it: meet Sidebar 2.0, or just [SB2](/plugins-sb2). The panel
on the bottom of all other screenshots in this announce is the SB2, so
we won't provide yet one more screenshot here.\
\
SB2 is written in QML (though with C++ logic backend, of course), thus
much more flexible and extensible: a lot of things can be easily
achieved which were nearly impossible (if possible at all) with the old
widgets/actions-based sidebar, which it replaces.\
\
SB2 operates around the concept of quarks which are similar to KDE
Plasma's plasmoids. A quark is a small more-or-less self-contained
visual element placed on SB2 (or a hypothetical similar desktop plugin)
which may be written entirely in QML or backed by a full-blown native
C++ plugin. There are quite a few quarks already:

-   tab switcher and opener with highlighting for active and opened tabs
    and a handy tab switcher:
    \[img\_assist|url=images/sb201.png|title=|align=inline|link=1|width=440\]
-   [third-party application launcher](/plugins-launchy);
-   [network activity monitor](/plugins-lemon);
-   [new mail notificator](/plugins-gmailnotifier);
-   [task progress indicator](/plugins-tpi) for monitoring progress of
    everything from pending torrents to audio transcoding process:
    \[img\_assist|url=images/sb202.png|title=|align=inline|link=1|width=440\]
-   and a bunch of others.

\
\
The SB2 panel supports the multiwindow support introduced in this
release (more on this later), allowing to have different panel
orientations, quark lists and individual quark settings for each
window.\
\
For now quarks can be placed only on the SB2 panel, but we are thinking
of writing another plugin, some kind of a dashboard, serving as a
standard desktop screen, where quarks can also be placed. Moreover, the
same quark can provide different look and feel in different contexts.
For example, a hypothetical weather quark will display just a weather
icon and a couple of digits for the temperature on the SB2 panel,
turning into a big and fancy widget with a week-long weather forecast on
the dashboard.\
\
Unfortunately QML is known to crash on some systems: all such
distinctive reports were got were from Ubuntu and openSUSE users. For
now we couldn't find a better workaround than suggesting disabling the
plugin if you experience strange random segfaults when interacting with
SB2.

Monocle
-------

\
\
Another big new plugin is [Monocle](/plugins-monocle), the document
reader:
\[img\_assist|url=images/monocle01.png|title=|align=inline|link=1|width=440\]\
\
Monocle is modular, and different formats are supported by different
modules. The following are supported: PDF, FB2, DjVu and PostScript
(0.6.60 also will add support for MOBI).\
\
It's quite feature-rich and surely can compete with Okular and the
likes. It supports tables of contents, forms (in PDF), thumbnails,
bookmarks, one- or two-pages layouts, fullscreen mode, links and some
other features:
\[img\_assist|url=images/monocle03.png|title=|align=inline|link=1|width=440\]\
\
Monocle integrates with the rest of LeechCraft, so, for example, a just
downloaded document will automatically be opened in Monocle.

Blogique
--------

\
\
One more new thing in this release is [Blogique](/plugins-blogique), the
blogging platform client plugin:
\[img\_assist|url=images/blogique01.png|title=|align=inline|link=1|width=440\]\
\
For now only local blog and Livejournal.com is supported, though support
for more platforms is planned. Like Azoth and Monocle, Blogique is
modular, and adding a new platform is a matter of writing another
plugin.\
\
Blogique is primarily aimed at creating (with a WYSIWYG editor),
updating and keeping blog entries on remote blog platforms (via Metida
plugin for Livejournal) or locally (through Hestia plugin). Blogique
supports drafts, autosaves and allows viewing last comments in blogs.
There is also a calendar to ease navigating through the blog.\
\
Hestia subplugin for local blogging supports sending its posts into any
other accounts of any other blogging system. We plan on adding this
crossposting feature to other platform plugins in next releases.\
\
Metida subplugin for Livejournal has quite some features to offer. It
supports all of LJ's post parameters, from access rights to mood,
geolocation and current music (with autofetching from MPRIS or LMP
plugin). It can also add Like and Repost buttons, create polls and put
parts of the post into cut. By the way as far as we know, it's the only
blog client (on Linux, at least) supporting LJ-specific tags.\
\
We think of implementing blog backup/exporting, viewing friends' posts
and commenting through the client without browser use. Tell us what you
think about this!

NetStoreManager
---------------

\
\
Most changes in [NetStoreManager](/plugins-netstoremanager) correspond
to its appearance and usability.\
\
Most LeechCraft users are accustomed two-panel file managers like
Krusader, Midnight Commander or Total Commander, so we decided to change
NSM's UI from a tree view to something similar to these file managers
(one panel for now, though):
\[img\_assist|url=images/nsm01\_0.png|title=|align=inline|link=1|width=440\]\
\
There are some new features. More files and directories actions are
supported, like copying, moving, erasing and moving to trash. There is
also a "silent mode" for previewing files: a file is automatically
downloaded to a temporary directory and opened after it finishes.\
\
Google Drive plugin now supports exporting some file types supported by
Google Docs, to various formats that differ from the original format of
the file.\
\
There are also usability improvements, for example, accessing trash is
now easier via a special toolbar button, and each file has an icon
according to its MIME type.

Other new plugins
-----------------

\
\
We have a bunch of new smaller plugins as well.

### Liznoo

\
\
A [power manager](/plugins-liznoo), using UPower on Linux, native ioctls
on FreeBSD and native APIs on Mac OS X. It supports reporting battery
level, status and statistics, notifying other plugins about
suspend/hibernate events (so that Azoth can gracefully disconnect from
the servers, for example) and drawing nice power consumption graphs:
\[img\_assist|url=images/liznoo01.png|title=|align=inline|link=1|width=440\]

### Launchy

\
\
Third-party [application launcher](/plugins-launchy) based on
FreeDesktop.Org specifications. It provides a quark for SB2 and a
full-screen launch panel:
\[img\_assist|url=images/launch01.png|title=|align=inline|link=1|width=440\]\
\
In master branch it also fully supports keyboard navigation and
launching arbitrary applications (not only those providing a .desktop
file).

### Vrooby

\
\
[Removable storage devices manager](/plugins-vrooby), currently
available only for Linux and using the UDisks daemon. It also provides
data about removable storages to other plugins, so that LMP, for
example, can know about such devices and sync with them.
\[img\_assist|url=images/vrooby01\_th.png|title=|align=inline|link=1|width=440\]

### Dolozhee

\
\
[Issue reporting tool](/plugins-dolozhee), allows one to submit bug
reports and feature requests easily even without being registered on
LeechCraft issue tracker.

Other improvements
------------------

### Multiple windows

\
\
We got complaints about LeechCraft being single-windows almost from the
inception of the project, and people generally refused to try it out
because they didn't like the idea of everything being in a single
window. Well, this reason is not valid anymore: LeechCraft finally
supports multiple windows. The support is quite experimental for now,
bugs and crashes are possible, but seems like it's already quite stable
for general usage scenarios.\
\
For now there are two modes of multiwindowing: either manual, where new
windows are created upon user's explicit request (like pressing a *New
window* button) and new tabs appear in the currently active window, or
semiautomatic, where tabs of different kinds appear in different windows
and new windows are created automatically if needed. The later mode
somewhat mimicks traditional multiapplication approach, where browser
tabs are in one window, private chats are in another, conferences and
channels in the third and all opened documents in the fourth. Both modes
support moving tabs between windows as user wishes.

### New IM protocols

\
\
[Azoth](/plugins-azoth), our IM client, now also supports MRIM and
Windows Messenger protocol (though seems like the latter protocol is
already deprecated itself by the time of the release). The support is
quite basic: for example, multiuser chatrooms aren't supported for the
MRIM protocol yet, but it is already quite usable for day-to-day usage.\
\
And, moreover, support for the native VKontakte API is already
implemented in the master branch and will be available in the
soon-to-be-released 0.6.60 version. This is quite important since
VKontakte has already shut down its XMPP servers. Moreover, this native
API plugin already supports more than VKontakte provides through the
older XMPP API.

### Mac OS X support

\
\
Yes, LeechCraft is now available for Mac OS X 10.7 (and upper), thanks
to the awesome clang compiler and the UNIX environment. In fact, you can
see it on the Liznoo screenshot.\
\
Several platform-specific things are also supported, ranging from the
maximization icon in the upper right corner of LeechCraft windows to
proper support for its power management APIs in the Liznoo module, for
example.

### Bugs fixed since 0.5.99

\
\
Time for the list of issues fixed in this release compared to the 0.5.99
beta, as promised in the beginning of this post:\
\

-   Core: fixed showing toolbar after last tab is closed.
-   Core: fixed reapplying color theme, explicitly setting palette on
    all widgets.
-   Core: check if there is a tab before activating it on DnD.
-   Core: set default locale according to language settings.
-   Util: fixed a possible use-after-free error in ResourceLoader on
    large pixmaps.
-   XSD: don't count an item with just set datasource as changed.
-   [AN](/plugins-advancednotifications): fixed three bugs that led to
    rules being considered modified when they weren't.
-   [Aggregator](/plugins-aggregator): feed URL string can already be
    encoded, check for it.
-   Aggregator: fixed tooltip cleanup code, removing tags like font,
    span, div, p, h{1,2,3,4,5,6} tags.
-   Aggregator: don't notify about zero something.
-   [Azoth](/plugins-azoth): fixed a rare XML parsing issue.
-   Azoth: cancel roster search on Esc or as soon as search text
    is empty.
-   Azoth AdiumStyles: don't segfault on unknown entries.
-   Azoth Autoidler: handle only Online and Free to Chat statuses.
-   [Azoth p100q](/plugins-azoth-p100q): fixed bookmarks label
    in settings.
-   [Azoth Vader](/plugins-azoth-vader): fixed compatibility with crappy
    clients not knowing about BOM.
-   Azoth Vader: fixed microblog status encoding.
-   [Azoth Xoox](/plugins-azoth-xoox): fixed restoring file
    logging settings.
-   Azoth Xoox: fixed cancelling connecting to the server if there is a
    network error.
-   Azoth Xoox: added \*.jpeg and \*.bmp masks to avatar filter.
-   [Dolozhee](/plugins-dolozhee): set proper stretch on widgets.
-   [LastFMScrobble](/plugins-lastfmscrobble): fixed leaking
    attend markers.
-   LastFMScrobble: fixed leaking recent releases.
-   [Launchy](/plugins-launchy): use own settings instead of messing
    with LMP.
-   [Liznoo](/plugins-liznoo): try autostarting UPower if
    it's unavailable.
-   [LMP](/plugins-lmp): properly handle playlists on DnD.
-   LMP: similarity label now is always under artist name.
-   LMP: consider arbitrary-named album art if it's a single image.
-   LMP: album-art autofetching now made optional.
-   LMP: format datetimes according to locale settings.
-   LMP Graffiti: fixed CUE splitting.
-   LMP Graffiti: fixed linking issues with primary LMP library.
-   LMP Graffiti: fixed garbage in plugin icon.
-   [Poshuku](/plugins-poshuku): set target="\_blank" on links in
    widgets requested by other plugins.
-   Poshuku: fixed freezing on garbage collection with large
    history databases.
-   [Poshuku CW](/plugins-poshuku-cleanweb): don't complain about
    unsupported filters.
-   [Summary](/plugins-summary): fixed leaking context menu actions.

Towards DE
----------

\
\
Yes, jokes aside, we actually think of turning LeechCraft into a desktop
environment. Of course, according to LeechCraft spirit it is purely
optional and implemented via different plugins, but some required
changes are already implemented, like the multiwindows support, power
manager or app launcher.\
\
The upcoming 0.6.60 version will have a special [desktop
mode](/user-guide-desktop-mode), where LeechCraft window automatically
becomes desktop window, and SB2 widget is created as a top-level panel,
visible even when other apps are active:
\[img\_assist|url=images/lcdesktop01.png|title=|align=inline|link=1|width=440\]\
\
0.6.60 will also feature some new related plugins, like
[Fenet](/plugins-fenet) for controlling window and compositing managers:
\[img\_assist|url=images/fenet01.png|title=|align=inline|link=1|width=440\]
[KBSwitch](/plugins-kbswitch) for configuring keyboard layouts:
\[img\_assist|url=images/kbswitch01.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/kbswitch02.png|title=|align=inline|link=1|width=440\]
as well as [Krigstask](/plugins-krigstask) (the taskbar and pager),
[Mellonetray](/plugins-mellonetray) (well, the tray) and Laughty, the
libnotify notification server.