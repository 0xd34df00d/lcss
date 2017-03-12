---
title: Using notifications
tags: plugins, howto, development
published: 2013-04-02T07:51:20

---

Notifications are just normal LeechCraft entities with a special MIME
and a predefined structure.

Creating notifications
----------------------

\
\
To create a notification, use the
`LeechCraft::Util::MakeNotification (const QString& header, const QString& body, Priority priority)`
function (in the `util/util.h`{type="bash"} header). Given a header, a
body and priority of your notification, it would return a properly
initialized `LeechCraft::Entity` object.\
\
This entity should then be sent from your plugin using the
`gotEntity (const LeechCraft::Entity&)` signal. Please note its
signature, the namespace specification there must not be omitted,
otherwise the signal won't be detected by LeechCraft core. Of course,
the signal should be emitted from the plugin instance class, the one
that you write in the `Q_EXPORT_PLUGIN2` macro.\
\
You may generally use the HTML markup in your notification body.\
\
A sample code would look like (assuming we are in the `LeechCraft`
namespace):

    const auto& e = Util::MakeEntity ("Azoth",
            tr ("New message from %1").arg (buddyName),
            PInfo_);
    emit gotEntity (e);

\
\
The entity may also be customized before emitting it with the
`gotEntity` signal. See the next sections for examples.

Having actions in notification
------------------------------

\
\
To have actions in your notification, create a
`LeechCraft::Util::NotificationActionHandler` object (in
`util/notificationactionhandler.h`{type="bash"} header) using `new`,
passing the entity that should have actions to its constructor. Then,
add the actions by calling
`AddFunction (const QString& name, Callback_t func)` method of the
action handler object. The first parameter, `name`, is the user-visible
name of your action. The second parameter is the function that would be
called when the action is triggered by the user. The function should
have no parameters and return nothing.\
\
Please note that the created object must not be deleted explicitly by
you. It will be automatically deleted whenever needed.\
\
An example code would look like:

    Entity e = Util::MakeEntity ("Azoth",
            tr ("New message from %1").arg (buddyName),
            PInfo_);
    auto handler = new Util::NotificationActionHandler (e);
    handler->AddFunction (tr ("Open chat"),
            [buddyObject] () { ChatManager_->OpenChat (buddyObject); });
    emit gotEntity (e);

\
\
Please also note that not all notification engines support actions, so
your notification should be sensible even without them.

Using custom pixmap
-------------------

\
\
Just set the `"NotificationPixmap"` element of the `Entity::Additional_`
map to the `QPixmap` you want to be shown.\
\
Sample code:\
\

    Entity e = Util::MakeEntity ("Azoth", tr ("New message from %1").arg (buddyName), PInfo_);
    e.Additional_ ["NotificationPixmap"] = QVariant::fromValue (buddyObject->GetAvatar ());
    emit gotEntity (e);

\
\
Please note that not all implementations support showing custom pixmaps.