---
title: General information about Azoth plugins
tags: plugins, development, azoth
published: 2011-02-12T02:38:23
parentPage: development-azoth
bookOrder: 0
---

Azoth has several types of plugins. They can provide support for
different protocols, allow Azoth to load various resources (like smile
packs or chat window styles) or just hook into Azoth core and other
plugins.\
\
So, there are currently three types of plugins for Azoth: protocol
plugins, resource source plugins and general plugins for everything that
isn't related to the specific types.\
\
Since all these plugins are second-level plugins for Azoth (please refer
to [Plugins for plugins](/development-plugins-for-plugins) page if you
are not familiar with the concept), they should implement the `IPlugin2`
to be recognized as such, and should have the following classes in the
set returned from `IPlugin2::GetPluginClasses()`:

-   `"org.LeechCraft.Plugins.Azoth.Plugins.IGeneralPlugin"` for general
    type plugins
-   `"org.LeechCraft.Plugins.Azoth.Plugins.IProtocolPlugin"` for for
    protocol plugins
-   `"org.LeechCraft.Plugins.Azoth.Plugins.IResourceSourcePlugin"` for
    plugins that allow loading additional resources

\
\
Of course, one plugin could be of several types, in this case it should
implement all the required interfaces and return all the corresponding
plugin classes.