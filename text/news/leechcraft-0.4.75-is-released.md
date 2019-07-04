---
title: LeechCraft 0.4.75 is released
tags: 0.5.x, release
published: 2011-06-02T14:37:32

---

Today is our next milestone release, the 0.4.75, "Focus Shall Not
Fail".

This release incorporates a great change: EiskaltDC++, an awesome Direct
Connect and Advanced Direct Connect client, now serves as LeechCraft
plugin. So, LeechCraft can now download stuff via NMDC and ADC in
addition to BitTorrent (and HTTP, of course).

Azoth, our IM client, has also been improved a lot. Its IRC
implementation, the Acetamide plugin, is completely reworked and now
supports RFC 2812 among new features.

`{ "name": "azoth_muc_120916.png", "align": "inline", "title": "MUC in Azoth", "thumb": "medium" }`{.img}

XMPP protocol now also supports more things, like bookmarks (with
autojoin), password-protected rooms, configuring MUC rooms, service
discovery and gateways. Roster is a bit fancier now, especially in MUCs,
and supports groupless mode. URIs for joining MUCs and such are handled
now as well. And, support for chat state notifications is also added, so
now one would see when a remote user is typing. These notifications are
also sent to remote users, but for privacy-concerned users this could be
disabled in settings, of course.

`{ "name": "azoth_sd_120916.png", "align": "inline", "title": "Service Discovery", "thumb": "medium" }`{.img}

Some funny bugs have been fixed in Azoth. For example, one of them
prevented Azoth from handling messages that had been received while the
user was offline. The other caused Azoth Xoox to request all the VCards
of all the VCard-less users right after coming online, which effectively
halted the connection.

Various other plugins for Azoth have also been improved. Support for
Psi+ and Kopete emoticons packs is implemented in Azoth NativeEmoticons,
for example. Support for the *psto.net* and *juick.com* microblogging
services has been improved severely. A new plugin, Azoth HiLi, allows to
configure custom highlights in chat rooms.

`{ "name": "azoth_psto1_0.png", "align": "inline", "title": "Juick in Azoth", "thumb": "medium" }`{.img}

Kinotify now supports showing a custom picture in the notification, so,
for example, if an IM contact has sent you a message, the avatar of that
contact (if any) would be displayed instead of standard pixmap.

We've also started developing a new plugin for Poshuku, FatApe, for
supporting GreaseMonkey userscripts in our browser. It already works and
supports almost whole API of original GreaseMonkey, but there is still
no GUI for managing userscripts, so they should be placed manually into
the `~/.leechcraft/data/poshuku/fatape/scripts`{type="bash"} directory.

A new plugin (except EiskaltDC++, of course) has been introduced, the
GMail Notifier, which, as the name states, notifies about new mail in
GMail inboxes.

LeechCraft has also moved to the new tabs system, which was originally
planned for the 0.6 series. Now, the exact tab that one wants would open
most of the times when hitting `Ctrl+T`.

Of course, there are more small improvements and fixes here or there,
but describing them all in this release announce would render it
completely incomprehensible.

And, sad but true, our good old Chatter plugin has been removed in
favour of Azoth Acetamide, since Chatter is unmaintained.

If you are really curious, you can view our development digests related
to this milestone here: [\#1](/devel-digest-1), [\#2](/devel-digest-2)
and [\#3](/devel-digest-3). If you are even more curious, you could view
the output of `git log 0.4.70..0.4.75`{type="bash"}. Beware: it's almost
600 commits there.

Packages are already available for Ubuntu Lucid, Maverick and Natty
(`ppa:0xd34df00d/leechcraft`, as always), and Gentoo ebuilds are also
available (in the `rion` overlay). Packages for Fedora, OpenSUSE are in
progress, as well as Windows installer.

And, well, as you may have noticed, releases have names from now on.
