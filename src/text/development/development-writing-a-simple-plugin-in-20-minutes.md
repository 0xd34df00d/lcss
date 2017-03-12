---
title: Writing a simple plugin in 20 minutes
tags: tutorial, development
published: 2011-07-10T21:44:23

---

Introduction
------------

In this tutorial we will write a simple plugin (called Auscrie for "Auto
Screenshooter") for LeechCraft. This way we will illustrate basic
concepts of plugin writing. Our plugin would be able to take a
screenshot of LeechCraft's window and save it somewhere or upload to a
imagebin. Screenshooting would be initiated by a button in the toolbar.

We will learn:

<div class="itemizedlist">

-   how to create dummy new plugins and build them;
-   how to add UI written in Qt Designer to plugins;
-   preferable ways of working with network and HTTP in particular in
    LeechCraft;
-   using LeechCraft messages to notify user about various events in
    your plugin.

</div>

</div>
Understanding plugins
---------------------

C++ plugins for LeechCraft are just dynamic libraries with main plugin
instance exported from it. Plugin instance is exported with
Q\_EXPORT\_PLUGIN2. Plugin instance should also implement IInfo
(`/src/interfaces/iinfo.h`{.filename} from the repository root)
interface to be recognized by LeechCraft as a proper plugin.

To know more about writing plugins for C++/Qt applications please visit
How to Create Qt Plugins guide.

You could also refer to the general LeechCraft overview for more
information about plugins and LeechCraft architecture.

</div>
Paths
-----

For our convenience we will work right in source tree, in
`/src/plugins/auscrie`{.filename}. Usually you will develop your plugin
separately from the source tree (see Workflow documentation for more
information), and the only difference would be that you will need to
adjust the paths accordingly. For example, you will need to make sure
that *`CMAKE_MODULE_PATH`* points to the directory containing
`FindLeechCraft.cmake`{.filename} when running CMake. CMake variables
are set with `-D`{.option} command line switch. For example:

`cmake -DCMAKE_MODULE_PATH=/some/path/to/LeechCraft/SDK`{type="bash"}

This is \*NIX-oriented tutorial. Refer to the corresponding parts of
Windows building guide for the differences in the building process.

</div>
General skeleton
----------------

There is a convenience Python script in LeechCraft repository:
`/tools/scripts/genplugin.py`{.filename} which generates very basic
`CMakeLists.txt`{.filename} file for your plugin and plugin instance
declaration/implementation files. It is invoked as:

``` {type="bash"}
genplugin.py -a "Plugin Author" -p PluginNameWithoutSpaces -i Comma,Separated,List,Of,Base,Interfaces
		It would also give a short help message when run with -h option.
		So, we create the /src/plugins/auscrie directory, cd into it and run the script like this (please note that in your case path to genplugin.py can be different):
		../../../tools/scripts/genplugin.py -a "Your Name" -p Auscrie -i IToolBarEmbedder
		We also derive from the IToolBarEmbedder (/src/interfaces/itoolbarembedder.h) because we want to embed our button there.
		This script would generate basic files, but that would be enough to produce a minimal working (more precisely, minimal loading) plugin. Let's try to compile and run it! To do that, we create a directory in which the plugin will be built, run cmake over it, then make to build the plugin and then make install from root to install the plugin. From the directory with the sources issue:
		
		mkdir build
		cd build
		cmake ../
		make
		sudo make install
		
```

Here we used out-of-source builds. Generally, it's preferable to use
out-of-source builds since you can easily clean up the source tree (by
removing the build directory) or have multiple builds with different
configurations simultaneously.

Now run LeechCraft and open Settings dialog, then select the Plugins
page. You should now see your plugin in the list. If you don't, check
the logs (`~/.leechcraft/warning.log`{.filename}) and contact us.

</div>
Basic stuff
-----------

Now we have a very basic plugin that is recognizable by LeechCraft. Let
us fill the gaps.

First, we should fill the `GetInfo`{.function} stub with some sensible
description, like "Simple auto screenshooter.".

Then let's create the action that would make a screenshot. First, we
define some internal data members and methods:

<div class="itemizedlist">

-   `Proxy_`{.varname} of type `ICoreProxy_ptr`{.classname}, where we
    will store the pointer to the core proxy object passed to
    `Init`{.function}. We need this proxy, because it's the object
    through which all the communication with LeechCraft Core is done,
    and we will need it later;
-   `QAction`{.classname} \*`ShotAction_`{.varname}, which would
    initiate screenshooting;
-   private slot `makeScreenshot`{.function} which would be invoked when
    our action fires up.

</div>

It's better to do such initialization in our Init function, so we write
there the following code for our action:

``` {type="c++"}

Proxy_ = proxy;

Dialog_ = new ShooterDialog (Proxy_->GetMainWindow ());

ShotAction_ = new QAction (Proxy_->GetIcon ("screenshot"),
        tr ("Make a screenshot"),
        this);
connect (ShotAction_,
        SIGNAL (triggered ()),
        this,
        SLOT (makeScreenshot ()));

		
```

We use `ICoreProxy_ptr`{.classname} to get the right icon from the right
theme for our action. When you will develop your own plugins you will
need to carry your icons with you unless you get into the official
source tree. We also use the proxy to get the pointer to the main
window. The `ShooterDialog`{.classname} stuff will be explained later.

Then, let's fill the `GetActions`{.function} stub and return our
`ShotAction_`{.varname}. `GetActions`{.function} would look like:

``` {type="c++"}

QList Plugin::GetActions () const
{
    QList result;
    result << ShotAction_;
    return result;
}

		
```

If you compile and install your plugin now, you will see the icon of
your screenshoter in a toolbar, but it does nothing yet.

</div>
Initiating screenshooting
-------------------------

In our screenshooting slot we run a simple dialog asking for screenshot
parameters. If user accepts the dialog, we disable the shooting action
(we will reenable it again when the screenshot is ready) and start a
timer according to the timeout set by user in the dialog:

``` {type="c++"}

void Plugin::makeScreenshot ()
{
    if (Dialog_->exec () != QDialog::Accepted)
        return;

    ShotAction_->setEnabled (false);
    QTimer::singleShot (Dialog_->GetTimeout () * 1000,
            this,
            SLOT (shoot ()));
}

		
```

We created the `Dialog_`{.varname} in `Init`{.function} in order to keep
it between different calls to `makeScreenshot`{.function}. Having this
dialog avaliable in any function has another benefit: we don't have to
store screenshot parameters like format or quality after executing the
dialog since we can ask it anytime.

Writing this dialog is quite a trivial task for anyone who ever used Qt
Designer, so it won't be documented here. However, it's worth noting how
forms should be added to CMake-based project. We define a variable which
will hold the list of forms (`FORMS`{.varname} in our case), we add the
`.h`{.filename} and `.cpp`{.filename}-files to the list of headers and
sources, we call the `QT4_WRAP_UI`{.function} to run **uic** on the
forms and we add the result of **uic** to the list of dependencies of
our plugin. So, the middle of the `CMakeLists.txt`{.function} file would
look like:

``` {type="c++"}

SET (SRCS
    auscrie.cpp
    shooterdialog.cpp
    )
SET (HEADERS
    auscrie.h
    shooterdialog.h
    )
SET (FORMS
    shooterdialog.ui
    )
QT4_WRAP_CPP (MOC_SRCS ${HEADERS})
QT4_WRAP_UI (UIS_H ${FORMS})

ADD_LIBRARY (leechcraft_auscrie SHARED
    ${COMPILED_TRANSLATIONS}
    ${SRCS}                                                                                                                                                                                                                      
    ${MOC_SRCS}
    ${UIS_H}
    )

		
```

</div>
Shooting, it's fun!
-------------------

Let's finally take a look at the `shoot`{.function} slot. We will split
our discussion of it into logical parts.

To grab the window, we use the `Proxy_`{.varname} object we stored
earlier to access the main LeechCraft window. Don't forget to
`#include`{.code} the `QMainWindow`{.classname} header, otherwise
casting from `QMainWindow`{.classname}\* to `QWidget`{.classname}\*
would fail.

``` {type="c++"}

void Plugin::shoot ()
{
    ShotAction_->setEnabled (true);

    QWidget *mw = Proxy_->GetMainWindow ();
    QPixmap pm = QPixmap::grabWidget (mw);

    const char *fmt = qPrintable (Dialog_->GetFormat ());
    int quality = Dialog_->GetQuality ();

		
```

Then we have two options: to save file to the disk and to send it to a
pastebin. The first one is a bit easier to implement:

``` {type="c++"}

    switch (Dialog_->GetAction ())
    {
        case ShooterDialog::ASave:
        {
            QString path = Proxy_->GetSettingsManager ()->
                    Property ("PluginsStorage/Auscrie/SavePath",
                            QDir::currentPath () + "01." + Dialog_->GetFormat ())
                    .toString ();

            QString filename = QFileDialog::getSaveFileName (mw,
                    tr ("Save as"),
                    path,
                    tr ("%1 files (*.%1);;All files (*.*)")
                        .arg (Dialog_->GetFormat ()));

            if (!filename.isEmpty ())
            {
                pm.save (filename, fmt, quality);
                Proxy_->GetSettingsManager ()->
                setProperty ("PluginsStorage/Auscrie/SavePath",
                        filename);
            }
        }
        break;

		
```

Here we used Core's settings manager which is basically a wrapper around
`QSettings`{.classname}. Keys starting with *PluginsStorage* can be used
by plugins, the Core won't use them for its own tasks. It is generally
ok to use Core's settings manager for storing a setting or two, but if
you need more, and especially if you need to build your own settings
dialogs, you will need to add one for your plugin.

If user selected uploading to an imagebin, we call a separate function,
Post(), that would take care of it:

``` {type="c++"}

        case ShooterDialog::AUpload:
        {
            QBuffer buf;
            pm.save (&buf,
                    fmt,
                    quality);
            Post (buf.data ());
        }
		break;
    }
}

		
```

We also should now add the following to our `CMakeLists.txt`{.filename}
just before `INCLUDE (${QT_USE_FILE})`{.code}:

``` {type="c++"}

SET (QT_USE_QTNETWORK TRUE)

		
```

This would add the networking abilities to our plugin, making visible
the includes from the QtNetwork module and linking our plugin to the
QtNetwork library. We will definitely need it since our plugin uses
QtNetwork (for example, `QNetworkAccessManager`{.classname} and
`QNetworkReply`{.classname}) to do actualy posting of screenshots.

Because we aren't interested in uploading implementation now, we've
moved all the posting code into separate `Poster`{.classname} class, so
our `Post`{.function} function looks quite simple:

``` {type="c++"}

void Plugin::Post (const QByteArray& data)
{
    Poster *p = new Poster (data,
            Dialog_->GetFormat (),
            Proxy_->GetNetworkAccessManager ());
    connect (p,
            SIGNAL (finished (QNetworkReply*)),
            this,
            SLOT (handleFinished (QNetworkReply*)));
    connect (p,
            SIGNAL (error (QNetworkReply*)),
            this,
            SLOT (handleError (QNetworkReply*)));
}

		
```

Here we used `Proxy_`{.varname} once again to obtain the
application-wide instance of the `QNetworkAccessManager`{.classname}
with the `GetNetworkAccessManager`{.function} method. It's always better
to use the application-wide `QNetworkAccessManager`{.classname} thus
getting access to the application-wide network cache and cookie
database, as well as allowing it to optimize requests by reusing
connections, for example.

It's also worth noting that in case if you need to just download a file,
which is not our case but just a very common task, you can just emit the
corresponding signal without caring about network access, managers,
replies and stuff. This approach is discusses in details in the Overview
document.

It is also ok to create the `Poster`{.classname} on the heap without
caring about memory deallocation now. It will be freed in the
corresponding slots.

We connect to the `Poster`{.classname}'s signals

<div class="funcsynopsis">

  ----------------------- -----------------------------
  `finished(`{.funcdef}   QNetworkReply \*`reply``)`;
  ----------------------- -----------------------------

<div class="funcprototype-spacer">

 

</div>

</div>

and

<div class="funcsynopsis">

  -------------------- -----------------------------
  `error(`{.funcdef}   QNetworkReply \*`reply``)`;
  -------------------- -----------------------------

<div class="funcprototype-spacer">

 

</div>

</div>

to get notified when our uploading finishes or whether an error occurs.
`Poster`{.classname} emits the `QNetworkReply`{.classname} that
originally emitted the corresponding signal as the parameter of those
signals.

Let's take a look at

<div class="funcsynopsis">

  ----------------------------- -----------------------------
  `handleFinished(`{.funcdef}   QNetworkReply \*`reply``)`;
  ----------------------------- -----------------------------

<div class="funcprototype-spacer">

 

</div>

</div>

(by the way, don't forget to declare all the introduced members in class
definition):

``` {type="c++"}

void Plugin::handleFinished (QNetworkReply *reply)
{
    sender ()->deleteLater ();

    QString result = reply->readAll ();

    QRegExp re ("You can find this at ([^<]+)");
    if (!re.exactMatch (result))
    {
        Entity e = Util::MakeNotification ("Auscrie",
                tr ("Page parse failed"),
                PWarning_);
        emit gotEntity (e);
        return;
    }

    QString pasteUrl = re.cap (1);

    Entity e = Util::MakeNotification ("Auscrie",
            tr ("Image pasted: %1, the URL was copied to the clipboard")
                .arg (pasteUrl),
            PInfo_);

    QApplication::clipboard ()->setText (pasteUrl, QClipboard::Clipboard);
    QApplication::clipboard ()->setText (pasteUrl, QClipboard::Selection);
    
    emit gotEntity (e);
}

		
```

First we shedule the sender object (`Poster`{.classname} instance
created earlier) to delete itself once control gets to the event loop.
We don't plainly use something like `delete sender ();`{.code} because
we can't delete objects inside their signals' handlers.

Then we get the page returned by server via `readAll`{.function} and try
to get the link to our newly uploaded image by quite a simple regexp. If
it fails, we emit a notification about our failure with Warning priority
and stop processing. Please note that in your class signals and slots
that use LeechCraft's data structures must use fully qualified names
with namespaces, like

<div class="funcsynopsis">

  ----------------------------- ----------------------------------------
  `void gotEntity(`{.funcdef}   const LeechCraft::Entity& `entity``)`;
  ----------------------------- ----------------------------------------

<div class="funcprototype-spacer">

 

</div>

</div>

Otherwise Qt's meta object system won't recognize them.

Here we also use the LeechCraft messages system to send out a
notification about various events in your plugin, like errors or just
information messages, to be shown to the user. We use the
`LeechCraft::Util::MakeNotification`{.function} (which can be added by
`#include `{.code}) utility function to create such an entity. This
function takes three parameters: notification title, notification body,
notification priority. Notifications and LeechCraft messages are
discussed in details in the Overview document.

</div>
Conclusion
----------

Basically that's all. Now we have a working, usable and useful plugin.
Of course there is something to extend: for example, we could keep
history of all the pasted screenshots or show a fancy progressbar
notifying about upload progress, and you will almost surely want to add
localization support, but our goal here is to get used to LeechCraft's
concept of plugins.

</div>