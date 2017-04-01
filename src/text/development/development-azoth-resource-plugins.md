---
title: Writing resource plugins for Azoth
tags: plugins, development, azoth
published: 2011-02-16T19:51:56
parentPage: development-azoth
bookOrder: 3
---

Introduction
------------

\
\
Resource plugins add support for loading various resources like smile
packs or chat window styles into Azoth. Since this involves the plugins
for plugins concept of LeechCraft, please refer to the [corresponding
document](/development-plugins-for-plugins) if you are unfamiliar with
it.\
\
Since resource plugins are second-level plugins, they should at least
implement `IInfo` and `IPlugin2`. For Azoth to detect them as a resource
plugin, the return value of the `IPlugin2::GetPluginClasses()` method
should contain the
`"org.LeechCraft.Plugins.Azoth.Plugins.IResourceSourcePlugin"` class,
and they also need to implement the `IResourcePlugin` interface.\
\
The `IResourcePlugin::GetResourceSources()` returns a list of objects,
each of them implements an interface which is subclass of
`IResourceSource`. There are currently two subclasses:

-   `ISmileResourceSource` for loaders of smile packs, and
-   `IChatStyleResourceSource` for loaders of chat style themes.

IResourceSource base
--------------------

\
\
All interfaces for different types of resource loaders are derived from
the `IResourceSource` interface. This interface contains only one
function, `IResourceSource::GetOptionsModel()`. This function should
return the model with a single column that will be added to the
corresponding combobox in the settings. The data for the
`Qt::DisplayRole` interpreted as string would later be used to query the
resource source for information or load of the corresponding resource
pack. We will further refer to this string as *option*.

Smile packs
-----------

\
\
To be done.

Chat style themes
-----------------

\
\
Loaders of chat style themes should implement the
`IChatStyleResourceSource` interface, which has one new method:
`GetHTMLTemplate()`, which takes two parameters — the selected option
and the entry object for which to create the template. The object is
expected to implement `ICLEntry`. This method should return (a possibly
preprocessed) template for the chat window.