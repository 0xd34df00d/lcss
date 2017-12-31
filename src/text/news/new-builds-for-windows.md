---
title: New builds for Windows
tags: windows
published: 2013-09-11T22:35:44

---

Hey there!

While we're in preparation for the 0.6.0 release, we've also managed to
build almost whole LeechCraft from master branch for Windows, and [the
package](http://dist.leechcraft.org/LeechCraft/0.6.60/leechcraft-0.5.95-2370-g0459329.msi)
is publicly available!

This version is built with gcc (MinGW) first time since quite long ago,
because MSVS's support for C++11 isn't good enough for LeechCraft, and,
moreover, WebKit built with recent enough MSVS has some issues from
subtle bugs to crashes.

Moreover, this is the first time LeechCraft is packaged with MSI via
WiX, and the corresponding [pull
request](https://github.com/0xd34df00d/leechcraft/pull/252) has just
been merged. Because of MSI some new fancy features should be available,
like the often-requested remembering what plugins you've chosen.

LeechCraft has so many changes overall, so please try out this package
and tell us what you like or don't like. Though we still don't support
Windows as good as we support Linux or even Mac OS X, but it's still
worth knowing.

And you may also have noticed that we've moved our distfiles from
SourceForge to our server. Well, that's basically because of
[this](http://www.gluster.org/2013/08/how-far-the-once-mighty-sourceforge-has-fallen/).
Just read the article if you're interested, I don't think I have
anything to add.
