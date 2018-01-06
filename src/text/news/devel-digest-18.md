---
title: Development digest 18
tags: digest
published: 2011-11-23T16:16:52

---

Last few weeks we were mostly busy polishing LeechCraft for the 0.4.95
milestone, so don't expect this digest to contain lots of new fancy
features and such — it's more about bugfixing and small improvements.

So, what've we got for you?

- Added Poshuku Pogooglue plugin for instantly searching selected text
  in Google.
- Lots of improvements in Laure, as always.
- Added *Gajim* style to Azoth StandardStyles.
- Added context menu for nicknames in MUCs in [Azoth](/plugins-azoth).
- [Azoth](/plugins-azoth) now can optionally append a message to the
  chat view whenever participant ends the conversation.
- It is possible now to disable sending "conversation ended" chat
  participant state events in [Azoth](/plugins-azoth).
- Configurable text post-address text in [Azoth](/plugins-azoth).
- Added the *Quote* action to the chat view context menu of
  [Azoth](/plugins-azoth).
- Added support for *itpc* in [Aggregator](/plugins-aggregator).
- More lexers in [Popishu](/plugins-popishu): added Octave and
  Matlab lexers.
- Show line numbers and wrap words by default in
  [Popishu](/plugins-popishu).
- [Azoth Acetamide](/plugins-azoth-acetamide) now supports
  SSL connections.
- LeechCraft now opens URLs in external applications if those URLs
  couldn't be handled by LeechCraft plugins.
- Several fixes for interoperability of Azoth OTRoid with other
  Azoth plugins.
- Fixed package deinstallation in [LackMan](/plugins-lackman).
- Fixed toolbar visibility control in Core.
- Fixed leaking search widgets in [Azoth](/plugins-azoth).
- Fixed colors for pre-nick/post-nick text in Azoth StandardStyles.
- Use *automoc* feature of CMake 2.8.6 and later. Fixes lots of
  warnings from *moc* during build process.
- Fixed a segfault in [LackMan](/plugins-lackman) when cancelling
  installation of packages.
- Fixed fetching scripts in Poshuku FatApe.
- Fixed userscripts detection in Poshuku FatApe.
- Fixed segfault when clearing mood in [Azoth
  Xoox](/plugins-azoth-xoox).
- Lots of fixes for Poshuku OnlineBookmarks.
- Fixed item view not being updated sometimes in
  [Aggregator](/plugins-aggregator).
- Fixed *Clear chat* behavior in [Azoth](/plugins-azoth).
