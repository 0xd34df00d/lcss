---
title: Advanced Notifications
tags: plugins, howto, development
published: 2013-04-02T08:46:41

---

This page documents the Advanced Notifications framework protocols,
conventions and such.

Basic usage
-----------

\
\
The easiest way to create an AN-enabled notification entity is to use
the `Util::MakeAN()`, documented on the [Util namespace
page](http://doc.leechcraft.org/core/namespace_leech_craft_1_1_util.html).
It is as simple as the following (simplifed example from the BitTorrent
plugin):

    QString name; // torrent name
    auto entity = Util::MakeAN ("BitTorrent",			// standard notification header
            tr ("Torrent finished: %1").arg (name),			// standard notification text
            PInfo_,							// notification priority
            "org.LeechCraft.BitTorrent",				// the ID of the plugin that sent this notification
            AN::CatDownloads,					// the category of this notification
            AN::TypeDownloadFinished,				// the type of this notification
            "org.LC.Plugins.BitTorrent.DLFinished/" + name,		// the ID of this event
            QStringList (name));					// the visual path of this event

    // further actions like on a normal notification entity
    auto nah = new Util::NotificationActionHandler (entity);
    nah->AddFunction (tr ("Show folder"),
        [savePathStr] () { QDesktopServices::openUrl (QFileInfo (savePathStr).absolutePath ()); });

This code creates an Advanced Notifications-enabled entity of
*Downloads* category and *Download finished* type. Other available
categories and types are listed in the
[interfaces/an/constants.h](http://doc.leechcraft.org/core/constants_8h.html)
header file.

### Event IDs, count and deltas

\
\
Several similar events can occur sequentially, like several incoming
messages from a single IM contact. This case should be distinguished
from several messages from several different contacts, so that all
notifications about messages from each contact can be "compacted" into
one notification. Event IDs serve exactly this aim: if two different
entities have the same event ID, they are compacted into one
notification.\
\
What compaction exactly means depends on the notification method. For
example, there will be only one entry in the tray about messages from a
single contact, and if 100 messages are recieved from a single contact,
only one popup notification will appear.\
\
Despite the event IDs, one needs to keep track of how much events are
generated with a single event ID, and here event count and deltas come
into play:

-   *DeltaCount* field specifies a change to the total count of the
    events with the given event ID. It can be both positive
    and negative. It is a parameter to `MakeAN()` with default value
    of 1. If *DeltaCount*, the *Count* field is used instead.
-   *Count* field specifies the total count of the events with the given
    event ID. It can be positive or 0. The latter case means that there
    is no need to show the notification for the given event ID anymore,
    for example, because the user has read all the messages from the
    given contact.

\
\
There is a helper utility function `Util::MakeANCancel()` used to make a
"cancelling" advanced notifications entity. It is documented
[here](http://doc.leechcraft.org/core/namespace_leech_craft_1_1_util.html).

Details
-------

\
\
Basically, an AN-enabled entity is also a valid standard notification
entity, so it may be created by using `Util::MakeNotification()`
function (see [this
page](http://doc.leechcraft.org/core/namespace_leech_craft_1_1_util.html)
for documentation). Then, several additional fields should be added to
the `Entity::Additional_` map for the entity to be a valid notification
entry.\
\
It's worth noting, however, that an AN entity may have the
`"x-leechcraft/notification+advanced"` MIME instead of plain
`"x-leechcraft/notification"`. It is useful for cases when you don't
want the notification entity to be handled unless a corresponding AN
plugin is installed and configured. For example, an IM client would emit
notifications about standard messages with a standard notification MIME,
and notifications about new messages in multi-user chatrooms with this
advanced MIME. This way, notifications about standard messages would be
shown even if an AN plugin hasn't been installed, but MUC messages
notifications would be shown only if the user has configured the
corresponding rules. This is useful since most users wouldn't want to
know about every other messages in any MUC they are present.

AN fields
---------

\
\
All the fields' values have `QString` type if not explicitly mentioned
otherwise.\
\
Below is the list of "standard" notification fields (plugins may define
their own ones).

### org.LC.AdvNotifications.SenderID

\
\
The ID of the plugin the sent this notification. It MUST match the value
returned from `IInfo::GetPluginID()`.

### org.LC.AdvNotifications.EventID

\
\
The string uniquely identifying the semantics of this event. For
example, notifications about two different incoming messages from the
same contact would have the same Event ID, while a notification about
incoming messages from different contacts would have different Event
IDs.

### org.LC.AdvNotifications.EventCategory

\
\
The category (or domain) of this event.\
\
The available event categories are listed in the `util/an/constants.h`
header, documented
[here](http://doc.leechcraft.org/core/constants_8h.html).

### org.LC.AdvNotifications.EventType

\
\
The type of the event that generated this notification. For the sake of
convenience, the types description is divided by event type domains,
which also correspond to the event category field.\
\
The available event types are listed in the `util/an/constants.h`
header, documented
[here](http://doc.leechcraft.org/core/constants_8h.html).

### org.LC.AdvNotifications.VisualPath

\
\
This field contains the list of strings (`QStringList`) that is used to
represent the path to the visual representation of the event. For
example, if the AN handler represents the events as a system of actions
in a menu tree, then the visual path defines the names of the menu
items.

### org.LC.AdvNotifications.Count

\
\
This field contains an integer representing the count of the events with
the `"org.LC.AdvNotifications.EventID"` equal to the ID of this
notification.\
\
For example, an IM client would set this field to the count of unread
messages from a given contact when notifying about new incoming message
from that contact. When the user reads all messages from the contact,
the IM client would emit a notification with the corresponding event ID
and this field set to 0.\
\
When emitting a "reset" event (with the counter equal to 0), it's
recommended to use the special category
(`org.LC.AdvNotifications.EventCategory`): the cancellation category
`"org.LC.AdvNotifications.Cancel"`.

### org.LC.AdvNotifications.DeltaCount

\
\
An alternative way to set the number of events with the
`"org.LC.AdvNotifications.EventID"` equal to the ID of this
notification.\
\
This field contains an integer representing the number which should be
added to the current count of events with this ID. Of course, the value
may be negative. If this value is present and is not 0, it is used, and
the `"org.LC.AdvNotifications.Count"` field is ignored.

### org.LC.AdvNotifications.ExtendedText

\
\
A possibly HTML-formatted string containing a brief description of the
event, suitable for displaying on a menu action, for example. For
instance, an IM client would set something like "3 new messages" here.\
\
This field is unique per event ID: the displayed text is overwritten by
the latest received notification in correct AN handlers.

### org.LC.AdvNotifications.FullText

\
\
A possibly HTML-formatted string containing a long description of the
event. For example, `3 new messages from BuddyName`{type="html"}.\
\
This field is unique in the same sense as the
`"org.LC.AdvNotifications.ExtendedText"` field.

Notes regarding human-readable text fields
------------------------------------------

\
\
By design each field should contain the text that's relevant to all the
notifications with the same event ID. Text can be chosen to be further
specialized by the user via the notifications configuration mechanism,
if the notifications sender provides the required contextual information
about its specific fields. For example, [Azoth](/plugins-azoth) could
also add a field named `org.LC.Plugins.Azoth.Msg` containing the message
text, and the user would then be able to configure a well-written AN
handler in such a way that the AN handler would show these texts as
well.