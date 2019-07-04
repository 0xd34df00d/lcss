---
title: Development digest &num;8
tags: digest
published: 2011-07-13T10:40:40

---

This week we also mostly focused on the Azoth IM in LeechCraft, but,
unlike the previous week, we mostly focused on features not directly
related to XMPP rather than implementation of lots of XEPs. Some other
plugins, like [Aggregator](/plugins-aggregator), weren't forgotten as
well.

`{ "name": "modnok01.png", "align": "right", "title": "LaTeX formula with Modnok", "thumb": "small" }`{.img}
`{ "name": "azoth_muc_as1_120916.png", "align": "right", "title": "An Adium style", "thumb": "small" }`{.img}
`{ "name": "azoth_muc_as4_120917.png", "align": "right", "title": "Another Adium style", "thumb": "small" }`{.img}

So, the list of changes since previous devel digest follows:


- A new plugin, SecMan SecureStorage, has been merged into
  *master* branch. This plugin provides an AES256-secured storage area
  for passwords and personal data *(thanks Akon32)*.
- Added [Azoth Modnok](/plugins-azoth-modnok) plugin for inline
  in-chat LaTeX rendering and display.
- Added [Azoth AdiumStyles](/plugins-azoth-adiumstyles) plugin for,
  well, support for Adium styles. It is still experimental and quite
  basic, but, nevertheless, already usable.
- Added Azoth Autoidler plugin for automatic change of status due to
  inactivity period.
- Added [Aggregator BodyFetch](/plugins-aggregator-bodyfetch) plugin
  for automatic fetching of full news bodies.
- Implemented rich text formatting support in [Azoth](/plugins-azoth)
  with the ability to format outgoing messages as well.
- Added support for
  [XHTML-IM](http://xmpp.org/extensions/xep-0071.html) to [Azoth
  Xoox](/plugins-azoth-xoox).
- Added support for publishing geolocation information to Azoth.
- Azoth Xoox now also supports
  [Geolocation](http://xmpp.org/extensions/xep-0080.html).
- Azoth now exposes options to add MUC participants to the contact
  list if their ID is known.
- Improved rendering of history in Azoth ChatHistory, with saner
  nicks, for example.
- Azoth now allows to set pre-nick and post-nick strings to be used
  when displaying nicks in chats.
- fb2 export dialog in [Aggregator](/plugins-aggregator) now allows to
  set custom book name and genres.
- Fixed generation of exported fb2 documents in Aggregator.
- Updated Hunspell implementation in Azoth Rosenthal which hopefully
  would fix segfaults with some dictionaries.
- Fixed segfault in LeechCraft Core when disabling Azoth but leaving
  plugins for it enabled.
- Lots of bugfixes in Azoth ChatHistory, p100q, and such.

We've also renamed the `libplugininterface` support library and
corresponding header files to `liblcutil` to better reflect the purpose
of that library.

And, well, we've finally introduced the "Prioritized handlers" concept,
but it isn't much used yet, so we'll write about it when it'd be used
more.

*This digest was written with 0.4.80-248-gd746dae as HEAD.*
