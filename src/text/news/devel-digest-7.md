---
title: Development digest &num;7
tags: digest
published: 2011-07-04T11:55:49

---

This week's changelog is rather small, but we have two major new
features: somewhat working Jingle and support for ad-hoc commands in
Azoth.

So, moving on to the changes list:

- Implemented support for Jingle in [Azoth Xoox](/plugins-azoth-xoox)
  (so LeechCraft requires Speex and QtMultimedia now).
- Overall support for media calls in [Azoth](/plugins-azoth), with
  selectable input/output audiodevices, call manager and such.
- Impemented support for ad-hoc commands
  ([XEP-0050](http://xmpp.org/extensions/xep-0050.html)) in
  Azoth Xoox.
- Added Azoth Rosenthal plugin, which implements Hunspell-based
  spellchecking in Azoth.
- Added support for showing images directly in chat window into Azoth
  EmbedMedia *(thanks Nobodyzzz)*.
- Added Poshuku Keywords plugin for URL shortcuts
  *(thanks Nobodyzzz)*.
- Support for animated icons in Azoth (for example, for "connecting"
  icon or "incoming file").
- Fixed a couple of funny bugs in Azoth Herbicide.
- Finally respect background color from system palette in
  [Aggregator](/plugins-aggregator).
- Saner error messages in Azoth, with reason string instead of
  reason code.
