---
title: LeechCraft architecture
tags: reference, development
published: 2011-03-31T21:04:33
parentPage: development-writing-plugins
bookOrder: 3
---

LeechCraft is plugin-based: LeechCraft Core only ensures correct loading
and initialization order of plugins, initializes them, interconnects
them and routes messages in between, while all the real work like
BitTorrent implementation is done by plugins. Core also performs some
common tasks like showing GUI to the user, merging settings from
different plugins into one dialog or sharing cache and cookie base.

When LeechCraft starts up, it searches for plugins in directories
relevant to the platform which it runs under. Plugins are basically just
dynamic objects (`libleechcraft_*.so`{.filename} on \*NIX and
`libleechcraft_*.dll`{.filename} on Windows) being loaded by LeechCraft
core through `dlopen`{.function} on \*NIX and `LoadLibrary`{.function}
on Windows at runtime. However, a plugin («virtual plugin») may be
provided by another plugin («adaptor plugin») instead of being loaded
from a shared library by LeechCraft Core. Virtual plugins are subject to
the same plugin behavior rules mentioned a couple of paragraphs below.

Each plugin should have a class, an object of which is exposed via Qt's
`Q_EXPORT_PLUGIN2`{.function} macro. The object of this class is created
internally by Qt in that macro and may be obtained via
`QPluginLoader::instance`{.function} method, if
`QPluginLoader`{.classname} is used to load the library (and it is in
LeechCraft). So let's call that object the *plugin instance object* or
just instance object.

The exported class should obviously be a `QObject`{.classname} and also
implement at least `IInfo`{.classname} interface in order to be
recognized by LeechCraft.

When LeechCraft starts up, it initializes the plugins it finds.
Initialization is done in two passes: first, `IInfo::Init`{.function} is
called on each found plugin, then, after all plugins have passed the
first pass of initialization, `IInfo::SecondInit`{.function} is called.
So, as a consequence, you basically cannot rely on other plugins before
`IInfo::SecondInit`{.function}, particularly in
`IInfo::Init`{.function}. So, you must not request the list of plugins,
emit messages, etc before `IInfo::SecondInit`{.function} is called.
However, after `IInfo::Init`{.function} your plugin must be in a correct
and usable state, because other plugins may begin to use it. Basically
that means that you need to initialize all your datamembers in
`IInfo::Init`{.function}.

\
\

Plugins can communicate with each other either via a set of interfaces
(which is based on but not limited to default LeechCraft interfaces
found in `/src/interfaces/`{.filename} directory) or using the messaging
system.

Let's consider each of these methods.

Message-based communication
---------------------------

This method is more useful when you don't know the exact plugin, or, at
least, what this plugin looks like (what interfaces it implements) and
just talking by such messages with other plugins is OK for you.

Communcation is done using `LeechCraft::Entity` (found in
`/src/interfaces/structures.h`{.filename}) structure which can be
considered as a packet or a message. Plugins send these `Entity`
messages, LeechCraft Core catches them, and… Here the story begins.

So, you have two types of messages. Same `Entity` is used for both of
them, and they differ only in the way of sending them out of your
plugin.

First type of messages is *notification*. It's used to notify Core or
other plugins that a new entity appeared, but your plugin doesn't care
what would happen with it after the announcement.

Let's consider a BitTorrent client that has just finished a download as
an example. It would *notify* other parts of LeechCraft about files it
just finished downloading but it doesn't care what will happen with them
next, would they be handled or not, etc.

Because the result of such a message isn't required at the point of
notification, the signal used to send this message doesn't block.
Instead, it queues the message in the main event loop and returns
immediately, handling all the delivery duty later, when control gets
back to the event loop.

To send a *notification* message, use the

<div class="funcsynopsis">

  ----------------------------- -----------------------------------
  `void gotEntity(`{.funcdef}   LeechCraft::Entity \*`entity``)`;
  ----------------------------- -----------------------------------

<div class="funcprototype-spacer">

 

</div>

</div>

signal. Just declare it in your plugin instance object (the one you
export with `Q_EXPORT_PLUGIN2`{.function}), and LeechCraft core will
automatically detect it at runtime.

Second type is *delegation request*. It's used to *delegate* a task to
another plugin and hope there is such plugin that can handle it. This
way you get access to the plugin that would actually handle the task and
can communicate with it. The corresponding signal blocks.

For instance, consider the Aggregator feed reader. It doesn't download
feeds itself, instead, it delegates them to another plugin by emitting a
*delegation request*. After returning from the signal used to emit such
a message, the sender plugin will know whether the entity was actually
delegated, and if it was, which plugin is handling it.

To send a *delegation request*, use the

<div class="funcsynopsis">

  ---------------------------------- --------------------------------
  `void delegateEntity(`{.funcdef}   LeechCraft::Entity \*`entity`,
                                     int \*`id` = 0,
                                     QObject \*\*`handler` = 0`)`;
  ---------------------------------- --------------------------------

<div class="funcprototype-spacer">

 

</div>

</div>

signal. Here, if the delegation was successful, *`handler`* would point
to the object that handles this delegation request and *`id`* would be
the ID of the task in that handler. It's guaranteed to be a some
non-negative value. To check if the delegation request was successful,
the following trick is commonly applied: before emitting the
`delegateEntity`{.function} signal, set the *`id`* to some negative
value like -1 and after emitting check if it is still -1. If it is, the
delegation failed.

<div class="example">

[](){#id394892}
Example 2.1. Delegating an entity and checking success of delegation

<div class="example-contents">

In this example we emit a delegation entity for downloading a given
*`url`* to *`location`* with task parameters commonly used for internal
LeechCraft tasks (a user does not have to know about the process of
downloading news feeds, for example). We check if the delegation was
successful, and if it failed, we use
`LeechCraft::Util::MakeNotification`{.function} to create a
user-notification (an `Entity` that represents some notification for the
user, not to be confused with notification `Entity`) entity with a
human-readable error title, message and priority, and we emit it as a
notification via `gotEntity`{.function}. Actually, this is a real piece
of code from LackMan plugin, the package manager.

``` {type="c++"}
Entity e = Util::MakeEntity (url,
		location,
		LeechCraft::Internal |
			LeechCraft::DoNotNotifyUser |
			LeechCraft::DoNotSaveInHistory |
			LeechCraft::NotPersistent |
			LeechCraft::DoNotAnnounceEntity);
int id = -1;
QObject *pr;
emit delegateEntity (e, &id, &pr);
if (id == -1)
{
	emit gotEntity (Util::MakeNotification (tr ("Error fetching repository"),
			tr ("Could not find plugin to fetch repository information for %1.")
				.arg (url.toString ()),
			PCritical_));
	return;
}
					
```

</div>

</div>

\

Sometimes you will need to know if LeechCraft can handle a particular
entity here and now. For example, Poshuku plugin, the web browser,
checks what external resources (like RSS feeds or OpenSearch
descriptions) can be handled upon page load and shows actions for
handling only those that can be handled.

In order to check if the particular entity may be handled, use the

<div class="funcsynopsis">

  ------------------------------- -------------------------------------
  `void couldHandle(`{.funcdef}   const LeechCraft::Entity& `entity`,
                                  bool \*`could``)`;
  ------------------------------- -------------------------------------

<div class="funcprototype-spacer">

 

</div>

</div>

signal. This signal blocks. It returns either after Core finds first
plugin that's able to handle the *`entity`*, or all queried plugins
refuse to handle it. The result is stored in the variable pointed by
*`could`*.

It's generally a bad idea to store the result of this function for a
long time because plugins may dynamically choose to refuse or accept
entities, but typically it's safe to assume that the result wouldn't
change until the control gets back to the event loop.

</div>
Interfaces-based communication
------------------------------

This is a much simpler approach, but it is much more «static» as well.
Once you have a pointer to `QObject`{.classname} you want to communicate
with, you can try to `qobject_cast`{.function} it to the interface you
want.

There are basically three ways to obtain a pointer to another plugin:

<div class="itemizedlist">

-   It may be set by LeechCraft Core in its `delegateEntity`{.function}
    handler (see previous section for more information): the third
    parameter of this signal is the pointer to the pointer to the
    handler of the entity.

-   It may be obtained by your plugin in
    `IInfo::SetProvider`{.function}, have you returned the proper
    dependencies list from either `IInfo::Needs`{.function} or
    `IInfo::Uses`{.function}.

-   You may obtain the list of all plugins yourself via the plugins
    manager that you can access via
    `ICoreProxy::GetPluginsManager`{.function}. The
    `ICoreProxy`{.classname} is passed to your `IInfo::Init`{.function}.

</div>

Let us consider a couple of examples illustrating various concepts of
working with other plugins.

<div class="example">

[](){#id395077}
Example 2.2. Getting any available plugin that implements
`IWebBrowser`{.classname}.

<div class="example-contents">

This is the real example from the Aggregator. It's assumed that the
`ICoreProxy`{.classname} passed to your `IInfo::Init`{.function} is
stored as `Proxy_`{.varname}.

``` {type="c++"}

IWebBrowser* Core::GetWebBrowser () const
{
    IPluginsManager *pm = Proxy_->GetPluginsManager ();
    QObjectList browsers = pm->Filter<IWebBrowser*> (pm->GetAllPlugins ());
    return browsers.size () ?
        qobject_cast<IWebBrowser*> (browsers.at (0)) :
        0;
}

				
```

</div>

</div>

\

<div class="example">

[](){#id395111}
Example 2.3. More sophisticated task delegation and error handling.

<div class="example-contents">

This is another bunch of code taken from the Aggregator. This is how it
delegates the downloading of fresh versions of feed files to another
plugin.

``` {type="c++"}

void Core::UpdateFeed (const QString& url)
{
    QList<int> keys = PendingJobs_.keys ();
    Q_FOREACH (int key, keys)
        if (PendingJobs_ [key].URL_ == url)
        {
            QObject *provider = ID2Downloader_ [key];
            IDownload *downloader = qobject_cast<IDownload*> (provider);
            if (downloader)
            {
                qWarning () << Q_FUNC_INFO
                    << "stalled task detected from"
                    << downloader
                    << "trying to kill...";
                downloader->KillTask (key);
                ID2Downloader_.remove (key);
                PendingJobs_.remove (key);
                qWarning () << Q_FUNC_INFO
                    << "killed!";
            }
            else
                qWarning () << Q_FUNC_INFO
                    << "provider is not a downloader:"
                    << provider
                    << "; cannot kill the task";
            return;
        }

    QString filename = LeechCraft::Util::GetTemporaryName ();

    LeechCraft::Entity e = LeechCraft::Util::MakeEntity (QUrl (url),
            filename,
            LeechCraft::Internal |
                LeechCraft::DoNotNotifyUser |
                LeechCraft::DoNotSaveInHistory |
                LeechCraft::NotPersistent |
                LeechCraft::DoNotAnnounceEntity);

    PendingJob pj =
    {
        PendingJob::RFeedUpdated,
        url,
        filename,
        QStringList ()
    };

    int id = -1;
    QObject *pr;
    emit delegateEntity (e, &id, &pr);
    if (id == -1)
    {
        qWarning () << Q_FUNC_INFO << url << "wasn't delegated";
        return;
    }

    HandleProvider (pr, id);
    PendingJobs_ [id] = pj;
    Updates_ [url] = QDateTime::currentDateTime ();
}

void Core::HandleProvider (QObject *provider, int id)
{
    if (Downloaders_.contains (provider))
        return;

    Downloaders_ << provider;
    connect (provider,
            SIGNAL (jobFinished (int)),
            this,
            SLOT (handleJobFinished (int)));
    connect (provider,
            SIGNAL (jobRemoved (int)),
            this,
            SLOT (handleJobRemoved (int)));
    connect (provider,
            SIGNAL (jobError (int, IDownload::Error)),
            this,
            SLOT (handleJobError (int, IDownload::Error)));

    ID2Downloader_ [id] = provider;
}

			
```

</div>

</div>

\

</div>
