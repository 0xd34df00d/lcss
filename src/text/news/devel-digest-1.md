---
title: Development digest &num;1
tags: digest
published: 2011-05-07T09:27:22

---

After some discussion in our development team, we've decided to
periodically publish development digests in the news section of this
site. The digests would primarily cover new features and decisions by
the dev team. They won't be strongly periodical, but would rather be
published as long as there is enough new material or to announce
something really important.\
\
So, today the first digest is published, and we'd like to note the
following changes done in the last couple of weeks:\
\

-   Azoth now supports configuring MUC rooms, and the configuration
    functionality is implemented in the Xoox plugin.
-   Major improvements in Acetamide 2, the rewrite of IRC protocol
    support in Azoth, have been merged in the master development branch.
    For example, Acetamide now supports all the commands from the RFC
    2812, and CTCP request/replies are now shown in the current tab.
-   Entity handler dialog has been reworked a bit, so that "Browse" is
    now a button, and it allows to choose the correct path without
    closing the dialog.
-   Work has been started on the emoticons converter which is to convert
    emoticons packs from other clients into LeechCraft Azoth's own
    native format. The repository is
    at https://github.com/Maledictus/SmilesConverter. Currently only
    Kopete is supported, Psi support is on its way.