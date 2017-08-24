---
title: AdvancedNotifications
tags: plugins, advanced notifications
shortdescr: a highly configurable, flexible and powerful notifications system
keyplugin: 1
---

AdvancedNotifications plugin provides support for the Advanced
Notifications framework: a highly configurable, flexible and powerful
notifications system.

This plugin allows one to define a set of rules for handling different
events and notifying user about them. AdvancedNotifications currently
supports several notification methods: via system tray, via standard
visual notifications, via sound notifications and by invoking an
external command. It comes with a set of predefined rules suitable for
typical user needs.

AdvancedNotifications also supports creating rules directly from other
plugins, so that [Azoth](/plugins-azoth) can offer creating a
notification about a user changing status in two clicks, for example.

Rules
-----
AdvancedNotifications works by matching each event notification against
a list of rules defined by the user (of course, there is a pretty sane
default setup). The rules are matched from top to bottom. These rules
contain a set of conditions that must be fulfilled for the rule to be
triggered.

\[img\_assist|url=images/an1.png|title=List of
rules|align=inline|link=1|width=440\]

Different plugins may define additional fields that could be used as
conditions in the rules. For example, [Azoth](/plugins-azoth) defines
such fields as sender name, sender ID, sender groups, message body,
etc.

\[img\_assist|url=images/an\_matchers1.png|title=Field
matchers|align=inline|link=1|width=440\]

So, for example, a rule could be written to ignore all the messages from
a given contact, unless they contain some keyword, or a different
notifications sound may be used for incoming messages from, say,
"Personal" group.

Visual method
-------------
This notifier uses another visual notifications plugins already present
in LeechCraft, like [DBusManager](/plugins-dbusmanager)'s libnotify
support or [Kinotify](/plugins-kinotify).

AdvancedNotifications plugin introduces quite a handy feature though:
identical notifications are compressed into one, so that, for example,
when you come online and get a lot of messages from the same contact,
you'd see only one notification about these messages.

System tray method
------------------
System tray notifier is designed to be used for events that user must be
informed about.

It displays different icons for different categories (IM is currently
supported, News is coming) and provides a fancy tooltip with the list of
events and corresponding actions (if any). Old-style menu is also
supported by right-clicking the corresponding category icon. It also
allows to enable event counter for different categories, which draw the
amount of events over the icon.

\[img\_assist|url=images/an01.png|title=System tray
notifier|align=inline|link=1|width=440\]

Sound method
------------
Notification rules may also define the sound to play when an event
occurs.

As with visual method, AdvancedNotifications doesn't play these sounds
by itself, instead, another plugin is used (currently LMP only).

There are some predefined rules with corresponding sounds, for example,
on incoming message, multiuser chat highlight, and such.
