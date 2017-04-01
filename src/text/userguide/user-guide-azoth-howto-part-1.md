---
title: Azoth howto, part 1
tags: user guide, azoth
published: 2013-12-19T00:58:32
parentPage: user-guide-azoth
bookOrder: 0
---

LeechCraft has a whole lot of great modules that can gain and hold their
audience, but one of the most prominent plugins is possibly
[Azoth](/plugins-azoth), the IM client.\
\
Like LeechCrat itself, concrete features in Azoth are implemented via
subplugins, while Azoth core only implements the core GUI and several
other things that are interesting only to programmers. One should first
decide what plugins he wants. Of course, it is possible to just install
all the available plugins and then disable (or just ignore) some of
them, but it still may be important to consider the ones most relevant
to this guide. The plugins are split into three groups according to the
author's own preferences.\
\
The most important ones are:

-   LeechCraft — the LeechCraft core;
-   AdvancedNotifications — the primary notification management module,
    for example, providing tray notification icon about unread messages;
    supports flexible notification rules;
-   [Azoth](/plugins-azoth) — IM core;
-   [Azoth Acetamide](/plugins-azoth-acetamide) — IRC protocol support;
-   Azoth Autopaste — half-automatic pasting of long texts to pastebins;
-   [Azoth Chathistory](/plugins-azoth-chathistory) — plugin for storing
    and displaying conversations history;
-   Azoth Rosenthal — spellchecker for outgoing messages;
-   Azoth Standardstyles — support for native LeechCraft themes —
    simple, elegant and fast;
-   [Azoth Vader](/plugins-azoth-vader) — support for the mail.ru
    protocol;
-   [Azoth Velvetbird](/plugins-azoth-velvetbird) — wrapper for
    supporting libpurple protocols;
-   [Azoth Xoox](/plugins-azoth) — one of the most complete
    implementations of the XMPP (Jabber) protocol out there;
-   [Kinotify](/plugins-kinotify) — platform-independent visual
    notifications (*sysnotify* module could be installed instead for
    notifying via desktop environment);
-   Pogooglue — support for searching for the selected text in search
    engines;
-   Secman — password storage module;
-   Secman Simplestorage — one of the implementations of password
    storage backend;
-   [TabSessManager](/plugins-tabsessmanager) — plugin for recovering
    opened tabs on startup and unclosing tabs.

\
\
One could also recommend the following:

-   [Auscrie](/plugins-auscrie) — plugin for making screenshots and
    uploading them to imagebins;
-   [Azoth Adiumstyles](/plugins-azoth-adiumstyles) — support for Adium
    chat styles;
-   [Azoth Astrality](/plugins-azoth-astrality) — support for protocols
    provided by the Telepathy framework, for now only basic IM features
    are supported;
-   Azoth Autoidler — automatic status changing according to user
    activity;
-   Azoth Depester — support for ignoring users in conferences;
-   Azoth EmbedMedia — showing images, Youtube videos etc. into chat
    window on link click;
-   Azoth Herbicide — SPAM filter;
-   Azoth NativeEmoticons — smiles support;
-   Dolozhee — client for LeechCraft issue tracker for submitting bug
    reports and feature requests in a few clicks;
-   [Liznoo](/plugins-liznoo) — integration with system services for
    properly supporting sleep and hibernate modes, as well as some fancy
    things for notebook users;
-   [New Life](/plugins-newlife) — import settings and history from
    other clients;
-   [CSTP](/plugins-cstp) — support for the http(s) protocol, is used in
    the Lackman plugin and similars;
-   Dumbeep — sound notifications (one could use [LMP](/plugins-lmp)
    module instead if one needs a media player as well);
-   [Lackman](/plugins-lackman) — userspace package manager for
    LeechCraft, allows installing additional chat themes, smiles,
    iconpacks, etc.

\
\
It is also worth noting these plugins:

-   [AnHero](/plugins-anhero) — crash handler for KDE;
-   Azoth BirthdayNotifier — notifications about birthdays of users from
    the contact list;
-   Azoth HiLi — additional options for configuring highlights in
    conferences;
-   Azoth LastSeen — local tracker of buddies activity;
-   [Azoth p100q](/plugins-azoth-p100q) — integration with the psto.net
    microblogging service;
-   Azoth SHX — shell commands executor supporting pasting command
    output to the chat;
-   Azoth Xtazy — publishing (unobtrusive as well) the information about
    current tune if the player supports MPRIS (or if [LMP](/plugins-lmp)
    is used);
-   Glance — быстрый компактный обзор всех открытых вкладок;
-   [NetStoreManager](/plugins-netstoremanager) — provides support for
    cloud storage services, in Azoth context it is useful for file
    transfers;
-   NetStoreManager GoogleDrive — Google Drive backend for
    NetStoreManager (registration is required);
-   Pintab — support for tabs pinning;
-   Poshuku — LeechCraft web browser, is used in Lackman for fancy
    themes information displaying;
-   [SB2](/plugins-sb2) — dock panel with support for various quarks
    (similar to widgets or plasmoids in other environments) like for
    switching between tabs, quickly enabling or disabling sound
    notifications or display file transfer status via the
    [TPI](/plugins-tpi) module (this module may be unstable on some
    systems due to untested Qt features);
-   [Summary](/plugins-summary) — plugin for displaying background
    activity of other plugins, may be used instead of SB2 +
    [TPI](/plugins-tpi) as it can, for example, display unread news in
    news aggregator as well;
-   TabsList — yet another implementation of fast tabs switching,
    more keyboard-oriented.

\
\
Plugins packages are usually prefixed with *leechcraft-*, like
*leechcraft-azoth* or *leechcraft-netstoremanager-googledrive*. If
package manager of your distro doesn't have such a rich set of
LeechCraft packages, don't worry: subplugins (*leechcraft-X-Y*) are
likely bundled with the corresponding first-level plugins, like
*leechcraft-azoth*.