---
title: Development digest &num;5
tags: digest
published: 2011-06-16T12:18:58

---

This week in LeechCraft:

`{ "name": "settings1.png", "align": "right", "title": "General view", "thumb": "small" }`{.img}
`{ "name": "settings2.png", "align": "right", "title": "Concrete page", "thumb": "small" }`{.img}

- LeechCraft settings moved from a dialog to a tab (and to be honest,
  the idea of the tab is borrowed from KDE's *systemsettings*). See
  the screenshot on the right.
- Service discovery requests and VCard requests are now queued in
  [Azoth Xoox](/plugins-azoth-xoox) (previously they were requested
  all at once), and that should fix some issues with slow and buggy
  servers like GTalk.
- Fixed some bugs in [Azoth p100q](/plugins-azoth-p100q) with handling
  and display of messages from *psto.net* *(thanks Ignotus)*.
- Inline image display is now optional in [Azoth
  p100q](/plugins-azoth-p100q) *(thanks Ignotus)*.
- [Azoth](/plugins-azoth) now supports scrolling the chat window from
  the keyboard via Shift+PgUp and Shift+PgDown shortcuts.
- [Azoth](/plugins-azoth) now allows to configure what hotkey is used
  for sending messages: just Enter, Ctrl+Enter or Shift+Enter.
- [Azoth ChatHistory](/plugins-azoth-chathistory) now correctly
  handles HTML tags in messages.
- [Azoth ChatHistory](/plugins-azoth-chathistory) now also shows the
  direction of the messages, which is handy for copypasting.
- [Azoth Xoox](/plugins-azoth-xoox) doesn't request capabilities of
  clients with old entity caps XEP like Psi+ (since it's senseless).
- Fixed too paranoid download detection in
  [Poshuku](/plugins-poshuku), so, for example, it's safe to go to
  [Habrahabr.ru](http://habrahabr.ru) now without the risk of being
  flooded with download requests about *mb\_timezone*.
- Fixes in [Poshuku CleanWeb](/plugins-poshuku-cleanweb) for correctly
  hiding blocked elements in Qt 4.7.
- Statuses with line breaks are displayed correctly in the contact
  list now.
- And rather technical one: services from the Core are provided as if
  Core was plugin for itself: that eases and unificates a lot
  of things. For example, Core just provides another instance object
  for itself, and this instance object returns Core's
  XmlSettingsManager, settings tab, and such.

Advanced Notifications
----------------------

And there is another change, even more technical, so we've decided to
move it out of the list. We've begun the work on the Advanced
Notifications framework, an upgrade to existing notifications framework,
that would allow to implement persistent notifications, notifications
grouping and reducing, and a lot of other tasty things. Let's overview
them briefly.

### Persistent notifications

Up until now, a notification was only shown by system means (via
`libnotify`) or by our nice [Kinotify](/plugins-kinotify) plugin, but
after the notification had disappeared, user had no way of knowing that
something had occured.

Persistent notifications fix that. They allow, for example, to implement
a plugin that would collect events like incoming unread messages,
conference highlights or incoming file transfer requests and display a
persistent notification (for example, as an icon in the system tray) for
them until the user reacts to the event or manually dismisses the
notification.

So, yes, we will finally have a system tray icon for new incoming
messages in Azoth.

### Notifications grouping

Advanced Notifications carry informating about their category, type,
Semantic Event ID (SEID), and such. This way, it is possible to group
all notifications from a single category into one tray icon or menu, for
example. This way, notifications from our IM client and from a
hypothetical Twitter client could be all placed into one menu of one
icon. Of course, with a proper plugin, user is able to tweak the
settings of grouping.

Notification category is the most general grouping criteria. For
example, it could be IM, File download, News, and such. Type is used for
more precise categorization withing a category. For example, for an
IM-category notification it could be IncomingMessage,
IncomingMUCMessage, FileTransferRequest, AttentionRequest or
AuthorizationRequest. Event ID is used for extremely fine-grained
categorization (and some other tasks). For example, event ID would be
the same for two messages coming from the same IM contact, but incoming
message notification and file transfer request notification have
different event IDs event if they originate from the same contact.

### Notifications reducing

Up until now a plugin that displays notifications had no way of knowing
if two notifications actually notify about the same thing, and if an IM
client sends out a hundred notifications about new messages from a
single contact, you would have to click trough all those notifications,
despite they are semantically equivalent.

Now, thanks to event IDs, a proper notification plugin can detect that
there is no need in displaying next 99 notifications after first one
about new incoming messages has been shown.

### Actions

Of course, notifications carry actions with them. So, you could open a
chat or grant authorization right from the persistent notifications'
menu.

### Customizability

Advanced Notifications carry a lot of context information, like source
contact, contact group, message body and such for an IM message
notification. This allows to configure how an Advanced Notifications
plugin would notify about different events.

For example, it would be possible to configure the plugin so that visual
notifications are displayed for every message in your favorite
conference, and sound is played only for incoming messages from contacts
in "Personal" group, and attention requests are ignored for all contacts
except the one with JID yourgf@gmail.com, and all notifications from
contacts in group "Bots" are ignored at all, but only if the message
doesn't contain the word "LeechCraft".

Of course, different plugins which are the sources of notifications can
expose different context information, since an RSS reader, for example,
has completely different set of parameters than an IM client, and, in
fact, all those parameters aren't known to the notificator in
compile-time. For that, notification source plugins must also implement
an interface that allows them to provide semantics of those parameters,
so an Advanced Notifications plugin is able to provide a sensible GUI
for configuring the rules.

### Try it out!

If you want to be on the bleeding edge and see how Advanced
Notifications framework is progressing, you can build the Advanced
Notifications plugin from our git by passing
`-DENABLE_ADVANCEDNOTIFICATIONS=True`{type="bash"} flag to
`cmake`{type="bash"}, since this plugin is disabled by default. Please
note that it depends heavily on the API and implementation of
LeechCraft, so it's better to build LeechCraft itself from source as
well.

Currently only Azoth supports some basic Advanced Notifications, and
only tray notifications are working.
