---
title: Development digest &num;22
tags: digest, 0.6.x
published: 2012-04-21T14:41:31

---

In the last two weeks we mostly fixed things, and the list of fixes is
quite big and important.\
\
We've also updated, fixed and revamped [LackMan](/plugins-lackman), our
package manager, a lot. Its behavior is now much more consistent, and
the UI is much more clear and information-rich. And it became much, much
faster on updates. And it finally works on Windows!\
\
[Azoth](/plugins-azoth), our IM client, now supports loading messages
from history into chat window on demand. And Azoth's history storage
module, [ChatHistory](/plugins-azoth-chathistory), finally became able
to perform global and per-account searches.\
\
The promised list of fixes as well as improvements follows:

-   Core: store plugin icons on-disk, not in QSettings.
-   Core: support for searching icons in
    `~/.leechcraft/icons`{type="bash"}.
-   Core: optional hiding of the tray icon.
-   Core: much nicer settings tab.
-   Core: saner tab recovery policy.
-   Util: better SysInfo data.
-   XSD: fixed segfault when adding LackMan packages.
-   XSD: fixed first start segfault on Windows.
-   [Azoth](/plugins-azoth): history scrollback.
-   Azoth: case-insensitive highlight.
-   Azoth: filter by entry ID in console.
-   Azoth: console now shows timings.
-   Azoth: changed alternative nick semantics.
-   Azoth: fixed occasional segfault when hiding offline users.
-   [Azoth AdiumStyles](/plugins-azoth-adiumstyles): minor theme
    compatibility issues fixed, themes like Pushpin are now working.
-   [Azoth ChatHistory](/plugins-azoth-chathistory): support per-account
    and global searching.
-   Azoth Rosenthal: fixed context menu corrections.
-   [Azoth Xoox](/plugins-azoth-xoox): advertise XEP-0232 info
    about self.
-   Azoth Xoox: store passwords for password-protected MUCs.
-   Azoth Xoox: kludges for Kopete and Jabber.El detection.
-   Azoth Xoox: self-offline handling fixes.
-   Azoth Xoox: a bunch of other small fixes.
-   Azoth Xoox: caps generation fixes.
-   Azoth Xoox: fixed a couple of logical leaks.
-   [BitTorrent](/plugins-bittorrent): compatibility with
    libtorrent 0.16.
-   [DBusManager](/plugins-dbusmanager): disable notifications
    by default.
-   [Dolozhee](/plugins-dolozhee): bug link now works.
-   Dolozhee: proper completion method for bug page.
-   Dolozhee: passwords are saved now.
-   [LackMan](/plugins-lackman): revamped UI.
-   LackMan: lots of Storage fixes, particularly on package removal.
-   LackMan: async Storage, speeds things up by two orders of magnitude.
-   LackMan: don't request all images on package retrieval.
-   LackMan: keep package if it's removed from repo but is installed.
-   LackMan: fixed Windows issues.
-   LackMan: notifications about number of new/updated packages.
-   [Otlozhu](/plugins-otlozhu): added iCal import/export.
-   [TabSessManager](/plugins-tabsessmanager): remove duplicate
    unclose actions.
-   TabSessManager: elided text for actions.