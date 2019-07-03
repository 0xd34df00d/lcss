---
title: Changelog for 0.3.0
tags: changelog
published: 2010-11-27T23:44:31

---

Fixes
-----

### Overall

-   New icons for LeechCraft and plugins by Pevzi.
-   Updated translations.
-   Removed the splash screen.
-   More aggressive optimizations on Microsoft Windows builds.
-   Don't pull MSVS redist into the installer on Microsoft Windows.
    Saves about 2 megabytes of installer space and allows to install
    LeechCraft under non-admin user.

### Core

-   Fixed a segfault when filtering items.
-   Fixed handler selection in some rare cases.
-   Fixed explicit selection of Arabic and Russian translations in
    the settings.
-   Use main toolbar for plugins' actions.

### Aggregator

-   Fixed saving/loading the Item Bucket.
-   Fixed not saving tags for just added feeds.
-   Update items when channel is just being marked (un)read.

### BitTorrent

-   Fixed moving first/last items in the queue.
-   Fixed segfault on some panes.

### Poshuku

-   Don't suggest empty pages (without URL) on session restore.

### CleanWeb

</ul>
<li>
Save approximately 9 KiB of memory per filter entry. Saves almost 50 MB
on Morpeh's list!

</li>
</ul>
### SeekThru

-   Correctly load the translation files.