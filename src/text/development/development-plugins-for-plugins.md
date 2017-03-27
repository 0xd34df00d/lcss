---
title: Plugins for plugins
tags: development
published: 2011-02-09T09:22:38
parentPage: development-writing-plugins
bookOrder: 8
---

Plugins could have other plugins for themselves, though this requires
some support from both sides. Plugins for other plugins would be further
called as second-level plugins, while plugins that support them would be
called plugin-ready (or first-level) plugins.\
\
Plugin-ready plugin should implement the `IPluginReady` interface to
indicate that it supports plugins for itself, while second-level plugin
should implement `IPlugin2`.\
\
LeechCraft core automatically determines which plugins should be
connected with which other plugins using the so-called plugin classes. A
plugin-ready plugin returns a set of strings representing plugin classes
that it supports, and second-level plugin returns a set of strings that
it provides. Then, if intersection between these sets for a pair of
plugins is non-empty, the second-level plugin is connected with the
plugin-ready one.\
\
Of course, one second-level plugin may provide several different plugin
classes, and they may logically belong to the same first-level plugin or
to different ones. In first case, the second-level plugin would be added
only once, in the second case, it will be added to each first-level
plugin with which the classes intersection is non-empty.\
\
The interface for first-level plugins, `IPluginReady`, has two methods,
`QSet GetExpectedPluginClasses() const` and `void AddPlugin(QObject*)`.
The first one returns the list of expected plugin classes, and the
second one is used to add corresponding plugins to this one. The
`IPlugin2` interface has only one method,
`QSet GetPluginClasses() const` that returns the list of plugin classes
that this plugin provides.\
\
The `void IPluginReady::AddPlugin(QObject*)` is called by the LeechCraft
core to connect the first-level plugin with the corresponding
second-level one when both of them have performed their initial
initialization (with the `void IInfo::Init(ICoreProxy_ptr)` method), but
before `void IInfo::SecondInit()`. So it is safe to rely on each other
in the `AddPlugin` and `SecondInit`, assuming both plugins initialize
themselves correctly in `Init`\
\
The second-level plugins are considered to be dependent on first-level
ones, so if not all plugin classes of a plugin found the corresponding
first-level plugins, the second-level plugin is not initialized.\
\
Of course, second-level plugins may have plugins for themselves as well,
in which case they become both first-level and second-level plugins as
once.