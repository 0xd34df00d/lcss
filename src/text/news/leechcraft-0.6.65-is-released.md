---
title: LeechCraft 0.6.65 is released!
tags: release, 0.7.x
published: 2014-04-03T19:16:19
---

Today we are proud to announce the release of LeechCraft 0.6.65
"Facepalm Mute"!

Some new tasty features and plugins were introduced in this release, and
lot of things were changed under the hood, as well as lots of small
behavioral issues were fixed or improved in many different plugins. So,
let's get straight to all the new tasty things!

New plugins
-----------



Five new plugins have been added in this release.

### Aggregator WebAccess

This module has seen its inception quite long ago, but only now it
became somewhat ready. [WebAccess](/plugins-aggregator-webaccess)
provides a basic web interface for the [Aggregator](/plugins-aggregator)
feed reader, so one can read news articles from a mobile device or
another machine:

\[img\_assist|url=images/aggregator\_wa1.png|title=|align=inline|link=1|width=440\]

The module is still extremely experimental, but it is already used by
some in some scenarios.

### CertMgr

[CertMgr](/plugins-certmgr) is the new SSL manager. It supports both
managing the SSL exceptions (like accepted or rejected SSL errors), as
well as disabling system-wide SSL certificates and loading custom
ones:

\[img\_assist|url=images/certmgr1.png|title=|align=inline|link=1|width=440\]

### CPU Load

CPU load monitoring quark that shows current IO/nice/user/system load in
the [sidebar](/plugins-sb2) and displays a tooltip with the load graphs
for each core on hover:

\[img\_assist|url=images/cpuload1.png|title=|align=inline|link=1|width=440\]

It only supports Linux and Mac OS X systems for now.

### Ooronee

A small quark for handling images and text dropped onto it via plugins
supporting the [data filters concept](/concepts-data-filters).

### Rosenthal

The spell check core has been moved from Azoth Rosenthal to a
first-level plugin, losing the *Azoth* prefix on the way. Now it can be
used by any plugin wishing to check spelling, and it also supports
multiple dictionaries now.

LMP
---

Most significant change in this release of the [LMP](/plugins-lmp) audio
player is the support for ReplayGain. Now LMP understands the ReplayGain
metadata in audio files and adjusts the volume accordingly. Of course,
album mode is supported.

We are aware that ReplayGain information is very rarely met in nature,
so another ReplayGain-related feature is automatic analysis and RG
metadata calculation for audio files in your collection. The calculated
metadata is stored in local collection, leaving your files intact, so
you can safely continue seeding them in a bittorrent client, for
example. One more reason to use collection in LMP, and one more reason
to use LMP — as far as we know, almost no other audio players support
this.

LMP's internals were upgraded in this release to support various audio
filters, so get ready for various equalizers, visual effects and so on
in next release!

Also, LMP now works properly on Mac OS X, and the Mac package now
contains all required gstreamer plugins, so one can play FLAC or MP3
files or listen to internet radio on Macs now as well. Moreover, proper
support for files watching was added: it was impossible to add a
directory containing more than 256 files to collection before that. Now
the watching backend explicitly uses FSEvents on Mac, supporting
unlimited number of files in collection.

The Graffiti submodule for audio tags manipulation now supports
canceling directory iteration and has got a few fixes regarding CUE
support. We plan to move to `shntool` in next releases though.

Among other improvements and fixed issues:

-   Played tracks history is now collected (though not available in the
    UI yet).
-   Total duration of selected playlist tracks is now displayed.
-   Fixed memory leaks with GStreamer tags messages.
-   Fixed interaction of MPRIS implementation with KDE.
-   Fixed transcoding of audio files containing embedded album art.
-   Added support for Drag-n-Drop of radio items to playlist.

Azoth
-----

[Azoth](/plugins-azoth), the IM client, is probably the most widely-used
module and most mature one, but it still gets tons of new features and
improvements. For example, Azoth now supports server history (for the
protocols that support this concept). So, if you had a conversation on
another device or client you still can access it from Azoth and view the
messages stored on server. Only XMPP and VKontakte protocols support
this feature for now, and
[XEP-0313](http://xmpp.org/extensions/xep-0313.html) is chosen for XMPP
instead of older but way more clumsy
[XEP-0136](http://xmpp.org/extensions/xep-0136.html). XEP-0313 requires
support both from client and server, and as far as we know only Prosody
supports it.

\[img\_assist|url=images/azoth1\_0.png|title=|align=inline|link=1|width=440\]

The [Xoox](/plugins-azoth-xoox) submodule implementing the XMPP protocol
gained support for [Message
Carbons](http://xmpp.org/extensions/xep-0280.html). That is, a resource
may now optionally get all messages from all other resources, including
the sent ones. This helps maintaining the conversation flow across
different devices somewhat similarly to Skype. Message Carbons are
forcefully disabled for some types of messages, though, for example for
OTR messages. Of course, this is strictly optional and, moreover, opt-in
feature.

A few other smaller fixes and improvements are available in the Xoox
module:

- The roster cache now isn't cleared if Xoox haven't managed to fetch
  the roster during application run time at least once.
- Organization VCard fields are now supported on newer QXmpp.
- VCards and versions requests can now be disabled globally.

VKontakte support (by the [Murm](/plugins-azoth-murm) module) has been
improved as well. Besides supporting server history, Azoth Murm now can
rename multiuser chats and invite contacts to multiuser chats. A few
issues have been fixed as well, like sending messages containing the
*&lt;* symbol or crashes on some slow connections.

Azoth now also supports sending images via the [image data
filter](/concepts-data-filters) plugins, like
[Imgaste](/plugins-imgaste) or [Blasq](/plugins-blasq). In this case an
image is uploaded to an imagebin or a cloud image hosting service
respectively, and a link to it is sent to the chat.

Just as with LMP, quite a few improvements were done and issues have
been fixed as well:

- Support for text search in chat window has been
  added:
   
  \[img\_assist|url=images/azoth2.png|title=|align=inline|link=1|width=440\]
  
- A workaround has been found for a long-standing bug in Qt leading to
  crashes on startup.
- Fixed Drag-n-Drop behavior: now dropping entries to other entries
  and to chat tabs is handled properly. For example, dropping a user
  to a conference tab (or vice versa) now suggests inviting the user
  to the conference.
- Text does not disappear now from the message edit if autopasting has
  been canceled.
- Better handling for network connectivity issues in
  [Acetamide](/plugins-azoth-acetamide).
- Depester module now shows a "muted" icon near the ignored contacts
  in the roster.
- Fixed horizontal scrolling appearing in standard styles on
  long words.
- Fixed some memory issues in OTR support plugin.

Monocle
-------

[Monocle](/plugins-monocle), the document reader, now supports annotated
documents. For now annotations are only supported for PDF documents, and
only basic textual annotations are recognized. They are displayed both
inline in the document and in a special side panel:

\[img\_assist|url=images/monocle1.png|title=|align=inline|link=1|width=440\]

Creating annotations is not supported yet.

By the way, you can help by sending us a few documents containing
graphical or sound annotations. You can attach them to a [bug
report](http://dev.leechcraft.org/projects/leechcraft/issues) or a mail
to the [mailing
list](https://groups.google.com/forum/#!forum/leechcraft).

PDF backend now also supports threaded rendering if built with Poppler
0.24.0 is newer. Threaded rendering allows both seamless scrolling
without freezing the UI and scrolling process as well as uniform CPU
cores utilization if multiple pages are shown at once.

LHTR
----

The [LHTR](/plugins-lhtr) visual hypertext editor component used
primarily by the [Blogique](/plugins-blogique) module now gained support
for the image sources plugins (that Blasq also became in this release),
so that images can be inserted easily. First we select the service we
want to insert images from:

\[img\_assist|url=images/lhtr\_up1.png|title=|align=inline|link=1|width=440\]

Then we select the images we want to add (of course, multiple selection
is supported):

\[img\_assist|url=images/lhtr\_up2.png|title=|align=inline|link=1|width=440\]

Then we choose image parameters, like the size of the previews, the alt
text for each image, the alignment and so on:

\[img\_assist|url=images/lhtr\_up3.png|title=|align=inline|link=1|width=440\]

And finally:

\[img\_assist|url=images/lhtr\_up4.png|title=|align=inline|link=1|width=440\]

Also, the HTML editor now supports syntax highlighting.

Other plugins
-------------

- [Aggregator](/plugins-aggregator) now supports renaming feeds.
- [KBSwitch](/plugins-kbswitch) now shows a menu with all the
  available layouts after right-clicking the quark.
- [LackMan](/plugins-lackman) now supports vim-style navigation and
  using Space key to toggle packages.
- [MusicZombie](/plugins-musiczombie) now fetches all information
  about a single artist in one request instead of issuing one request
  per each album.
- [New Life](/plugins-newlife) now supports importing history
  from Opera.
- [Popishu](/plugins-popishu) text editor now supports the recoverable
  tabs concept, so its tabs can be unclosed or saved between
  restarts now.
- [SB2](/plugins-sb2) now supports hiding quarks by default unless
  user explicitly adds them, so network monitor, CPU load and several
  other quarks are now hidden by default.

Other fixes
-----------

Among significant ones:

- [AnHero](/plugins-anhero), the crash handler, now restarts
  LeechCraft via the `leechcraft --restart`{type="bash"} switch
  instead of an ugly shell kludge.
- A serious bug in [CSTP](/plugins-cstp) has been fixed that may lead
  to crashes on some systems on each erroneously finished download.
- Fixed a memory leak in XDG handling code.
- `/etc/os-release`{type="bash"} is now properly parsed.


Other than that, a lot of smaller issues and rare crashes were fixed in
this release.

Also, some Mac OS X-specific issues were fixed. Besides what's been
mentioned for LMP:

- Native key symbols like ⌘ or ⌥ are shown in shortcuts manager
  instead of textual representation, avoiding confusion when
  configuring shortcuts.
- A memory leak in the [Liznoo](/plugins-liznoo) module has
  been fixed.
- A crash in the Liznoo module has been fixed on systems that don't
  have any batteries like desktop iMacs.
- Fixed font drawing on Mac OS X 10.9.
- LeechCraft now supports installing in the standard UNIX layout (with
  `$PREFIX/bin`{type="bash"}, `$PREFIX/lib`{type="bash"},
  `$PREFIX/share`{type="bash"} and all the likes) instead of the
  installation in the layout suitable for app bundles.

Source package is [already
available](http://dist.leechcraft.org/LeechCraft/0.6.65/leechcraft-0.6.65.tar.xz),
so is [Mac OS X
package](http://dist.leechcraft.org/LeechCraft/0.6.65/LeechCraft-0.6.65.dmg).
Packages for other supported OS and distros will be available a bit
later.
