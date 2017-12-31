---
title: LeechCraft 0.5.75 is released
tags: release, 0.6.x
published: 2012-07-11T12:27:49

---

Today LeechCraft 0.5.75 "This Glorious Nightmare" is released!

Just like in the previous release, we mostly focused on
[LMP](/plugins-lmp) module, which is our collection-oriented music
player.

For example, it now supports music collection uploading to portable
media players. Files can also be set to converted from lossless formats
like FLACs to lossy but much smaller ones (in terms of file size) like
Ogg Vorbis. One can also select the desired directory layout and file
naming when uploading files. The transcoder is highly parallel: in fact,
it can encode as much media files as you have CPU cores, so it makes
sense to upload music in big batches. It's also run with minimum
possible priority, so one can just continue to do your work while the
media files are being converted. All this stuff looks like this:

\[img\_assist|url=images/lmp-up-1.png|title=Uploading progress|align=inline|link=1|width=440\]
\[img\_assist|url=images/lmp-up-2.png|title=Transcoding options|align=inline|link=1|width=440\]

For now only those media players are supported that don't require any
special MTP or i-device-related protocols, but support for the latter
ones is planned. By the way we will be glad to get your help here — from
writing protocols support and synchronization modules to testing!

Among other significant new features in LMP:

- Support for social radio stations like Last.FM radio.
- Obtaining personalized recommendations, recent releases by artists
  in user's library and biography retrieval.
- Support for MPRIS.

Implementing collection synchronization support required us to make yet
one more plugin: [Vrooby](/plugins-vrooby). Vrooby is responsible for
working with the underlying platform/backend to obtain information about
removable storage devices. Other plugins then may query it to know what
devices are available and where they are mounted, for example. It also
allows the user to mount and unmount them via LeechCraft UI:

\[img\_assist|url=images/vrooby-1.png|title=Devices popup|align=inline|link=1|width=440\]

Several things were optimized a lot, thanks to the Intel VTune profiler
being for non-commercial use (it's available in Gentoo's *science*
overlay, BTW). Particularly, startup times were reduced a lot
(especially if all the required libraries are already in disk cache),
and some places like contact list drawing in [Azoth](/plugins-azoth),
our IM client, were optimized.

We've also worked hard on a couple of new plugins, one of which is
Monocle, a modular document reader. It would be officially announced
next time in milestone 0.5.80, though, so stay tuned!

There was a bunch of minor fixes and enhancements in other plugins, so
check out our development digests, where all this is listed in more
detail: [\#25](/devel-digest-25), [\#26](/devel-digest-26) and
[\#27](/devel-digest-27). One can especially highlight two small but
highly requested features:

- First, a nickname can be inserted into current chat tab message edit
  by Ctrl+clicking it in the roster.
- Second, [Azoth ChatHistory](/plugins-azoth-chathistory) module
  finally got a small calendar widget to select dates to view history
  for, and links in chat logs are now clickable.

Packages and builds for supported distros and OSes will be available
soon. Watch your package manager or our [download page](/download)! By
the way, the source archive is [already
available](http://sourceforge.net/projects/leechcraft/files/LeechCraft/0.5.75/leechcraft-0.5.75.tar.xz/download).
