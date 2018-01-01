---
title: Development digest &num;17
tags: digest
published: 2011-11-06T12:51:39

---

The last week and a half we introduced a dozen of new packages with
emoticons, affiliation icons, mood icons, chat window styles and such to
[LackMan](/plugins-lackman)'s repositories. Moreover, Laure plugin again
got some attention from Ignotus, and seems like it's already in quite a
usable state for plain music playback. We've also introduced the *More
this stuff* support across LeechCraft for displaying just those packages
that are relevant to the context. For example, if user clicks on the
*More this stuff* button in the chat window style setting, he will be
presented with a list of available chat window styles. For that to work,
our XML settings dialog markup language now supports the attribute that
allows to have *More this stuff* buttons where needed, and
[LackMan](/plugins-lackman) now supports communicating with other
plugins in order to show just those packages that are relevant to the
chosen *More this stuff* category.\
\
\[img\_assist|url=images/icons1.png|title=Poshuku hover
box|align=left|link=1|width=220\]\
\
Among other changes:

-   Added the "Group send" feature to [Azoth](/plugins-azoth).
-   [Poshuku](/plugins-poshuku): display links on hover in a nice box on
    the viewport instead of status bar (see the screenshot on
    the right).
-   [LackMan](/plugins-lackman) now gives a bit more space to the
    descriptions of the packages.
-   Added periodical updates feature to [LackMan](/plugins-lackman).
-   [AdvancedNotifications](/plugins-advancednotifications) now supports
    toggling audio notifications via quick launch area and tray menu.
-   [Aggregator](/plugins-aggregator) now supports removing individual
    channels by user.
-   Allow one to disable displaying conference join/leave events in
    [Azoth](/plugins-azoth).
-   [Azoth](/plugins-azoth) now has buttons to install more different
    icons/themes in settings.
-   Fixed layouts a bit more in Settings tab.
-   [\#489](http://dev.leechcraft.org/issues/489): fixed displaying
    image in [Azoth p100q](/plugins-azoth-p100q) from original post in
    each comment quote.
-   [\#492](http://dev.leechcraft.org/issues/492): hide Inspect action
    in [Azoth](/plugins-azoth) context menu when developer extras
    are disabled.
-   Fixed viewport size issues in [Poshuku](/plugins-poshuku).
-   Fixed rare emoticons mishandling in [Azoth](/plugins-azoth).