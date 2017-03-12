---
title: Entity variants handled by Aggregator
tags: entity handlers, development, aggregator
published: 2010-11-26T20:39:10

---

The algorithm is pretty simple.\
\
If the `Entity::Entity_` cannot be converted to a `QUrl`, then
Aggregator immediately decides that it can't handle the entity.\
\
Then, `Entity::Mime_` is checked if it's `text/x-opml`. If it is, the
scheme of the URL is checked. If it's *file*, *http* or *https*, then
the OPML file is opened (in case of *file* scheme) or downloaded (in
other case) and feeds from it are added.</code>.\
\
If `Entity::Mime_` isn't `text/x-opml`, the following checks are
performed, in order:

1.  If URL's scheme is *feed*, the entity is considered to be a link to
    the feed in *feed://* format, and the feed is added.
2.  If URL's scheme isn't *http* or *https*, the entity is rejected.
3.  If `Entity::Mime_` isn't *application/atom+xml* or
    *application/rss+xml*, the entity is rejected.
4.  If the `Entity::Additional_` map contains a value by the key
    *LinkRel*, the value is converted to string. If the resulting string
    is non-empty and it isn't equal to *alternate*, the entity
    is rejected.

\
\
If those checks pass, the feed is added with the URL contained in
`Entity::Mime_`.\
\
In either case, the following keys of `Entity::Additional_` are
considered:

*ShowTrayIcon*
:   The associated value is converted to `bool` and Aggregator's setting
    controlling Aggregator's tray icon is changed accordingly.

*UpdateOnStartup*
:   The associated value is converted to `bool` and corresponding
    Aggregator's setting is changed accordingly.

*UpdateTimeout*
:   The associated value is converted to `int` and the global interval
    between updates (in minutes) is updated to this value.

*MaxArticles*
:   The associated value is converted to `int` and the global limit for
    amount of articles in a channel is updated to this value.

*MaxAge*
:   The associated value is converted to `int` and the global limit for
    article age (in days) in a channel is updated to this value.