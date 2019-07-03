---
title: Plugins depgraph
tags: plugins
published: 2011-11-16T15:41:52

---

For a long time I was asked to make a clear and readable list of
dependencies between plugins in LeechCraft. Those dependencies are quite
obscure, as some plugins depend on others directly, some depend only on
some functionality of others, and there could be even cyclic
dependencies!

Anyway, a few days ago I made a graph for that, and [here it
is](http://files.leechcraft.org/plugins.png). I do not even post
thumbnails here since it doesn't make sense for an image wider than 3000
pixels.

Thus, ovals indicate the usual LeechCraft plugins, rectangles represent
some of the functionality provided by plugins, and external non-standard
(not Qt and not Boost) dependencies are of rhomboid shape. Arrows from
rectangles go to plugins that implement the given functionality, and
they are always black. Orange arrows show plugin-subplugin relations.
Red arrows show "strict" dependencies, and blue ones show "recommended"
dependencies — that is, everything would work without the latter, but
perhaps in a suboptimal way, or missing some functionality. Red/blue
color codes are used for plugin-plugin dependencies, plugin-subplugin
dependencies (think [Azoth](/plugins-azoth), for example, which cannot
work without at least one styling engine, which is also Azoth subplugin)
and external library dependencies. "Strict" dependencies carry some kind
of personal thoughts: for example, you can use [Azoth](/plugins-azoth)
or Snails without a password manager, but it would be quite a pain — you
will be asked with a password to every other step, so the corresponding
arrows are red.

Also, this graph doesn't contain all the plugins in LeechCraft: ones
without dependencies (including subplugins depending only on their
parent plugin) aren't shown.

That graph will be updated from time to time, so one could expect it to
be more or less up-to-date.

If anyone wonders, graph's sources are
[here](https://github.com/0xd34df00d/leechcraft/blob/master/doc/plugins.dot).
