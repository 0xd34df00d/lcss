---
title: Development digest #20
tags: digest, 0.6.x
published: 2012-04-05T14:55:49

---

Last couple of weeks we mostly fixed small issues and implemented
not-so-big feature requests here or there. There are some changes worth
emphasizing, though.\
\
First, [Azoth Xoox](/plugins-azoth-xoox), our XMPP protocol
implementation, now properly caches information about clients'
capabilities and doesn't rerequest vCards when they surely haven't been
changed. This actually allows conserving bandwidth quite a lot.\
\
Second, tabs unclosing system moved to a separate plugin,
[TabSessManager](/plugins-tabsessmanager), and became global. Support
for this system already existed implicitly in Poshuku for some time, and
now Azoth also supports it, which means that one can easily unclose a
just closed chat. And, well, the *Ctrl+Shift+T* shortcut is working
again!\
\
Third, settings for theme and theme variant in [Azoth](/plugins-azoth)
settings are now separated. So, variants only relevant to currently
selected theme are shown in a separate combobox. This allows themes to
be much more manageable then it were before.\
\
[Azoth Acetamide](/plugins-azoth-acetamide), the IRC implementation,
also got a lot of improvements and fixes for protocol part as well as
behavioral changes.\
\
A bit more full list of changes looks like this:

-   [Azoth](/plugins-azoth): support tab session management.
-   Azoth: theme and theme variant settings are now separated.
-   Azoth: allow one to reorder bookmarks.
-   [Azoth Acetamide](/plugins-azoth-acetamide): fixed answer on
    Spy commands.
-   Azoth Acetamide: disconnect on socket error.
-   Azoth Acetamide: proper WHO request after channel joining.
-   Azoth Acetamide: support for server password in bookmarks.
-   Azoth Acetamide: proper SSL errors handling.
-   [Azoth AdiumStyles](/plugins-azoth-adiumstyles): parse PLists for
    more info.
-   [Azoth Xoox](/plugins-azoth-xoox): fixed segfault on going offline.
-   Azoth Xoox: proper gateway login/logout logic.
-   Azoth Xoox: better caching for disco\#info.
-   Azoth Xoox: proper support for vcard-update — vCards aren't
    rerequested in vain any more.
-   Azoth Xoox: caching for avatars in MUCs.
-   Azoth Xoox: support refreshing branches in service discovery.
-   Azoth Xoox: support showing physical addresses in vCards.
-   Azoth Xoox: fixed several rare segfaults.
-   [Poshuku CleanWeb](/plugins-poshuku-cleanweb): better control for
    user filters.
-   Poshuku CleanWeb: support pasting/loading user filters from file.
-   [TabSessManager](/plugins-tabsessmanager): implement a global
    tabs uncloser.
-   Core: name/shortcut filter in ShortcutManager widget.
-   Core: support setting accept-language.
-   XSD: support for selection event notifications.
-   Overall: some code fixes thanks to static analysis!