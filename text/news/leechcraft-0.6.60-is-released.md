---
title: LeechCraft 0.6.60 is released!
tags: release, 0.7.x
published: 2013-12-30T10:52:50
---

After more than half a year and 4000 commits after previous feature
release, 0.5.95, we are proud to announce LeechCraft 0.6.60 "Accelerated
Evolution"!

This version introduces a lot of new plugins, new features in existing
plugins and, of course, bugfixes. Well, even the brief changelog
omitting non-significant changes is around 300 lines long, and this
version has 297 tasks on our tracker ([stats
included](http://dev.leechcraft.org/versions/36)), which is almost three
times more than the previous record! So let's see what's new.

Desktop mode
------------

LeechCraft already had quite a few plugins offering features that are
usually a part of a desktop environment, like a [power
manager](/plugins-liznoo) or [removable storage
manager](/plugins-vrooby), so we decided to take one step further and
turn it into a proper Desktop Environment. This day has finally come,
jokes aside!

[Desktop mode](/user-guide-desktop-mode) is a new special mode of
LeechCraft which basically turns it into a full-featured desktop
environment. For example, the [SB2](/plugins-sb2) sidebar (which
contains elements like a taskbar or app launcher) turns into a separate
always-visible dock panel that covers other applications:

`{ "name": "lcdesktop01.png", "align": "inline", "title": "", "thumb": "medium" }`{.img}

Desktop mode is activated via the `--desktop` command line switch, and
there are already session files for login managers to offer LeechCraft
as a desktop environment.

But desktop mode is not only comprised from customized behavior of
existing plugins with hte `--desktop` switch, it also relies heavily on
a few plugins added in this release, like:

- [Fenet](/plugins-fenet) plugin is responsible for autostarting a
  window manager and possibly a compositing manager. It also installs
  a `.desktop` file for login managers to use to properly start LC.
- [KBSwitch](/plugins-kbswitch) serves as keyboard
  layout configurator. It allows configuring the list of keyboard
  layouts as well as various options, like the button for groups
  switching, the compose key, etc.
- [Krigstask](/plugins-krigstask) provides a taskbar and a pager quark
  for [SB2](/plugins-sb2).
- [Mellonetray](/plugins-mellonetray) provides a system tray area
  quark for [SB2](/plugins-sb2).
- [Laughty](/plugins-laughty) is a system-wide desktop notifications
  daemon fetching event notifications from third-party applications
  and displaying them via LeechCraft plugins like
  [Kinotify](/plugins-kinotify).

Of course, other plugins like [Vrooby](/plugins-vrooby),
[Liznoo](/plugins-liznoo) or [Launchy](/plugins-launchy) may also be
found useful in the desktop mode.

Desktop mode is very experimental for now and in its early stages, some
things are known to not work, and we are hoping for some feedback about
what should be added or changed.

LMP improvements
----------------

[LMP](/plugins-lmp), our social collection-oriented audio player,
migrated from Phonon to pure GStreamer, getting proper gapless playback
support and compatibility with GStreamer 1.x. Mac OS X builds can also
properly play various files now, while LMP on Mac was dumb during Phonon
times.

Some other features are now possible because of the migration, like a
proper equalizer, ReplayGain support or visualization. They are planned
for future releases, though.

LMP now also supports instant queues when one can schedule some tracks
in the playlist to be played right after the current one. This is
useful, for example, to finish playback of the current album and then
move to completely different artist.

There are a lot of smaller changes and improvements, among them:

- Automatic tags recoding.
- Handling power events to automatically pause playback when going to
  sleep and continue playback on resume.
- Media info is now fetched from the collection (if available) instead
  of being resolved from the disk, leading to much a couple orders of
  magnitude faster playlist manipulations.
- LMP now supports notifying the user about the progress of operations
  like transcoding or tags fetching via Job Holder API thus plugins
  like [TPI](/plugins-tpi) or [Summary](/plugins-summary).
- Volume change exponent can be configured now.
- Images in widgets like biography view or similar artists are
  now cached.

Using LMP as a sound notification backend is broken now, though, and
will be fixed shortly after this release. Consider using Dumbeep module
for now.

VK messaging support
--------------------

This release also adds support for VKontakte messaging via the new
[Azoth](/plugins-azoth) subplugin, [Azoth Murm](/plugins-azoth-murm).

Murm supports quite a few VKontakte features like friends groups,
multiuser chats, and it automatically fetches media content embedded in
messages like attached photos, audios, videos and reposts. Murm also
offers the audios to be played or queued in media players like LMP:

`{ "name": "murm01.png", "align": "inline", "title": "", "thumb": "medium" }`{.img}

The messages can also be encrypted via OTR if the corresponding plugin
is installed and if the other chat participant supports OTR encryption.

Blasq
-----

[Blasq](/plugins-blasq) is our new plugin for cloud image photo albums
like Picasa. The exact services are implemented via subplugins, and
there are already four of them for Flickr, LiveJournal, Picasa and
VKontakte.

`{ "name": "blasq01.png", "align": "inline", "title": "", "thumb": "medium" }`{.img}

The plugin supports collections of photos, uploading (and
mass-uploading) new photos and deleting them. Other plugins like
[Blogique](/plugins-blogique) may also use Blasq as the source of images
to be inserted into blog posts.

Other new plugins
-----------------

A few other plugins have also been added in this release, among them:

- [Devmon](/plugins-devmon) for managing non-mass storage USB devices
  for plugins like LMP MTPSync (since MTP devices aren't generally
  mass storage ones).
- [Imgaste](/plugins-imgaste) for uploading images to imagebins. This
  was previously a part of [Auscrie](/plugins-auscrie) but has moved
  out to its separate plugin so that other modules like
  [Poshuku](/plugins-poshuku) or [Monocle](/plugins-monocle) could
  [benefit](/xmpp-conference-moved) from it.
- Xtazy for fetching currently playing tune from MPRIS-compatible
  players or plugins like LMP. Again, it was a part of Azoth Xtazy
  before, but has moved out to its own plugin so that, for example,
  Blogique could also autodetect the current tune.
- Sysnotify, a LeechCraft notification backend using the libnotify
  D-Bus protocol.
- [Scroblibre](/plugins-scroblibre), a Submissions API 1.2-compliant
  scrobbler for services like libre.fm supporting this API.
- LMP MTPSync, LMP subplugin for uploading music to devices
  implementing the MTP protocol.
- VtyuLC, experimental VLC-based video player.

Core and existing plugins
-------------------------

### Azoth and subplugins

- Azoth now shows a message in chat log whenever current date changes
  (at around 00:00).
- Shortcuts for erasing text from cursor to begin/end of line or
  beginning of the current word were added.
- It is now possible to change permissions of a room participant in
  all multiuser chat rooms.
- Support for multiple items selection in roster. Some actions like
  opening a chat or items removal can now be applied to all
  selected items.
- Old messages separator now appears for messages shown from history
  or before tab opening as well.
- Azoth Autopaste now supports hastebin.org and paste.org.ru services,
  and also remembers last used service and highlighting per
  each entry.
- Azoth StandardStyles now creates hash-based nick colors based on
  theme background color instead of global application palette leading
  to way better and more readable nick coloring.

### Blogique

- Blogique now supports service-specific tags in its WYSIWYG editor,
  like ``{type="html"} or ``{type="html"} for LiveJournal, properly
  displaying them in view mode as well.
- Added support for previewing posts.
- Blogs can now be exported to various formats like pdf or fb2.
- Blogique Metida (LiveJournal support submodule) now supports
  fetching and modifying friends lists as well as sending and
  receiving messages.

### Poshuku



[Poshuku](/plugins-poshuku), our web browser module, now supports [data
filters](/concepts-data-filters) for handling page screenshots, allowing
the user to automatically upload them to imagebins, for example.

History handling has been optimized a lot. Particularly, it doesn't make
LeechCraft freeze for a few seconds each 15 minutes if the history is
quite big now.

[Poshuku CleanWeb](/plugins-poshuku-cleanweb), the ad blocker, has also
been heavily optimized. Particularly, filters parsing and loading is now
asynchronous and threaded, greatly reducing module load time. Filtering
itself is also threaded now, utlizing all available CPU cores, so page
loading is much faster now as well. Filters handling has been improved
as well, particularly the element hiding logic which now catches more
garbage.

### Error handling

AnHero depended on KDE's crash handling system before this release, and
we've finally rewrote it to avoid this dependency. Now it has its own
KDE-free crash handler:

`{ "name": "anhero01.png", "align": "inline", "title": "", "thumb": "medium" }`{.img}

It is also able now to automatically save crash logs and backtraces as a
bonus. On the other hand, [Dolozhee](/plugins-dolozhee) now supports
attaching files to the reports and automatically checks for any files
left by AnHero upon startup. So, installing both these modules makes
crash reporting quite easy: it's enough to just start LeechCraft after a
crash, and Dolozhee will automatically pick AnHero's traces and offer
the user to create a bugreport. All that's left for the user is to fill
in the *Steps to reproduce* field.

Moreover, AnHero now also works under Mac OS X! If you want to leave
crash handling to the default Mac OS X handler, you could just
deactivate this plugin.

### Other plugins

- Rules in [AdvancedNotifications](/plugins-advancednotifications) can
  now be created from other plugins. For example, contact menu in
  Azoth now contains actions for creating a notification rule about
  the contact changing state or going online in one click.
- [Aggregator](/plugins-aggregator) has finally got shortcuts for easy
  navigation to previous/next item (or unread item).
- Cookies management has improved a lot in Core. Such features were
  added as whitelisting, blacklisting and cookies removal on
  application exit.
- Tabs now have adaptive width, so scroll buttons never appear in the
  tab bar.
- [Deadlyrics](/plugins-deadlyrics) now supports more search engines
  with better handling of non-unicode encodings and various patterns.
- [Liznoo](/plugins-liznoo) now supports prohibiting the screensaver
  if other plugins (like a video player) request it.
- [Monocle](/plugins-monocle) now supports arbitrarily rotating
  document pages, both all pages in a document and each single page.
  It has also been optimized quite a lot, especially when navigating
  by several pages.
- [NetStoreManager](/plugins-netstoremanager) notifies about
  upload/download progress via Job Holder API plugins like
  [TPI](/plugins-tpi) just like LMP.
- [SB2](/plugins-sb2) now supports different per-window and
  per-launch-mode (desktop or normal) settings. A few issues have also
  been fixed.
- [TouchStreams](/plugins-touchstreams) can now automatically fetch
  the list of friends and their tracks and offer them as radio
  stations in [LMP](/plugins-lmp). Unfortunately due to VKontakte
  policies CAPTCHA would occasionally appear in this case.

Probably the most notable issue fixed in this release is a race
condition in Qt network disk cache code leading to frequent crashes on
some systems. A crash in QML caused by HotSensors under load on some
systems is also fixed.

LeechCraft is also quite faster now, particularly during startup, as all
plugin checks and initial loading is threaded now, utilizing all
available CPU cores. Plugins initialization has also been moved to
separate threads where possible. A few algorithmic optimizations have
also been performed on loading process.

Saving settings has also been optimized and moved into its own thread,
so huge system IO doesn't block LeechCraft if it has to save its state
after, say, [a group in Azoth roster has been folded or
unfolded](http://dev.leechcraft.org/issues/1435).

The source package is [already
available](http://dist.leechcraft.org/LeechCraft/0.6.60/leechcraft-0.6.60.tar.xz),
so is [Mac OS X
build](http://dist.leechcraft.org/LeechCraft/0.6.60/leechcraft-0.6.60.dmg).
Packages for other operating systems and distros will be available soon.
