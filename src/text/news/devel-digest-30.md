---
title: Development digest #30
tags: digest, 0.6.x
published: 2012-08-18T20:00:00

---

Only a week has passed since the 0.5.80 release, but we've already done
quite a lot!

First of all, radio support in [LMP](/plugins-lmp) has been reworked,
and a new plugin has been added, [HotStreams](/plugins-hotstreams),
which provides access to lots of different radio stations, like the ones
on Digitally Imported, SkyFM, SomaFM and more.

Then [NetStoreManager](/plugins-netstoremanager) has been improved a lot
and now better supports intuitive drag'n'drop operations. Also, the
NetStoreManager's aim is a bit different today from what it was planned
for almost a year ago, so the initial Yandex.Narod service subplugin has
been removed as being obsolete. When we settle with the Google Drive
support, Yandex.Narod will be replaced with a full-blown Yandex.Disk
integration module.

Third, the [Liznoo](/plugins-liznoo) power management module now
supports FreeBSD platform, thanks to the contributions of a guy who
chose to remain anonymous.

And the settings tab has been also cleaned up a lot: subplugins'
settings now reside in their parent plugins settings pages.

There is also a bunch of other smaller changes:

- Core: use native file dialogs.
- [Azoth](/plugins-azoth): adjust variant chooser to contents.
- Azoth: fixed non-expanding smiles in smiles chooser.
- Azoth: MUC-aware groups sorting (MUC groups are now at the bottom).
- Azoth: optional separate MUC log.
- Azoth: fixed handling of tabs losing focus.
- Azoth: fixed several segfaults.
- [Azoth Acetamide](/plugins-azoth-acetamide): support 307, 310, 320,
  378 answers for UnrealIRCD.
- Azoth Acetamide: default IRC port is 6667 now.
- [Azoth p100q](/plugins-azoth-p100q): support in-place insertions
  instead of replaces.
- Azoth p100q: fixed last ID shortcut (it's *Ctrl+Shift+P* now).
- [Azoth Xoox](/plugins-azoth-xoox): detect and eliminate
  duplicate bookmarks.
- Azoth Xoox: fixed a bug in stanza generation in XEP-0016.
- Azoth Xoox: proper Cancel/Auth error handling.
- Azoth Xoox: don't reconnect on account nick change.
- [Dolozhee](/plugins-dolozhee): fixed reporting Core issues.
- [Kinotify](/plugins-kinotify): configurable screen corner for the
  notifier balloon.
- [LackMan](/plugins-lackman): remove caching.
- [LMP](/plugins-lmp): added listview-based tabs switcher.
- LMP: added buffer status indicator.
- LMP: added collection statistics dialog.
- LMP: new collection items are added immediately.
- [Poshuku](/plugins-poshuku): fixed error page template.
