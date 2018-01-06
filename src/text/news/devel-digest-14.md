---
title: Development digest &num;14
tags: digest
published: 2011-10-14T22:28:15

---

Last couple of weeks was dedicated to Poshuku OnlineBookmarks. Thanks
*Oleg Linkin aka magog* for all his work on that plugin. DZhon also did
a lot to make LeechCraft more buildable and manageable on Windows. He
contributed some Windows-related fixes to LeechCraft as well. Lots of
thanks as well :)

- Reworked Poshuku OnlineBookmarks: it's almost rewritten
  from scratch. Particularly, it now supports its own plugins, and
  exact bookmark services are implemented as plugins. Currently
  supported services are Read It Later and Del.icio.us.
- Implemented Azoth OTRoid for supporting
  [Off-The-Record](http://www.cypherpunks.ca/otr/) messaging system in
  [Azoth](/plugins-azoth).
- Initial work on Choroid, our nice image viewer.
- [Aggregator](/plugins-aggregator) now queues updates of feeds
  instead of updating them all at once: no more lags on update!
- Allow one to set password in account configuration dialog in
  [Azoth](/plugins-azoth), closes
  [\#403](http://dev.leechcraft.org/issues/403).
- Last Activity is now set properly in [Azoth
  Xoox](/plugins-azoth-xoox).
- [Azoth Xoox](/plugins-azoth-xoox) now respects lack of support for
  XEP-0085 in other clients.
- [Azoth](/plugins-azoth) now sends directed chat state
  participation events.
- Lots of small fixes in [Azoth](/plugins-azoth) and [Azoth
  Xoox](/plugins-azoth-xoox).
- Fixed a rare though possible segfault on exit in [Azoth
  Chathistory](/plugins-azoth-chathistory).
- Lots of Win32-related improvements.
