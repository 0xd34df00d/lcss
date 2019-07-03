---
title: Development digest &num;2
tags: digest
published: 2011-05-22T15:49:35

---

So, we haven't published any digests in the last couple of weeks, and
the next delay would be even lengthier, since most of us have finals
now, but nevertheless, some new features have been introduced.

- Added support for Psi+ and Kopete emoticons packs in Azoth
  NativeEmoticons *(thanks Magog)*.
- Fixed loading resources when started with current directory not
  equal to `leechcraft.exe`{type="bash"} directory on Windows.
- Added search in the contact list in Azoth.
- Support for password-protected rooms in Azoth Xoox.
- Added new plugin, Azoth HiLi, for customizing highlights in
  the MUCs. Highlights could be triggered by plain strings or
  by regexps.
- p100q plugin for Azoth now supports parsing tags and selecting them,
  and user avatars are also shown *(thanks Ignotus)*.
- Added `GM_addStyle`, `GM_getValue`, `GM_deleteValue`, `GM_setValue`,
  `GM_listValues`, `GM_openInTab`, `GM_getResourceText`,
  `GM_getResourceURL` and `GM_log` functions in Poshuku FatApe, the
  GreaseMonkey support layer *(thanks Nobodyzzz)*.
- Kinotify became more system palette-aware, as well as some default
  text styles for different contexts were added. Should look
  fancier now.
- Outgoing messages don't contain a datetime stamp now in Azoth Xoox.
- Fixed a segfault when closing a tab in Poshuku with an active
  context menu.
- Several fixes in Acetamide *(thanks Magog, once again)*.
- Rather not user-oriented, but nevertheless: documented Poshuku's
  hooks and changed signatures of some of them.
