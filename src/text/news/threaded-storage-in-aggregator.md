---
title: Threaded storage in Aggregator
tags: aggregator
published: 2012-01-03T12:46:18

---

Storage operations in [Aggregator](/plugins-aggregator) were always
single-threaded and performed in the main GUI thread. Particularly, feed
updates were also performed in the main thread, including fetching
already-existent items from the database, looking for modified ones,
updating modified items and inserting new ones. That resulted in a
terrible overall performance during feed updates — one could tell when
Aggregator decides to update its feeds just by feeling how sluggish and
slow LeechCraft interface suddenly becomes for a dozen of seconds.\
\
That's in the past now. Yesterday all that feed updating machinery was
moved to a separate thread, and only parsing the downloaded feeds is
done in the main GUI thread now, but I doubt that it is really worth
moving that into a separate thread as well — XML parsing is fast as hell
and is hardly the performance hotspot.\
\
The threaded architecture allows moving arbitrary operations into the
storage thread as long it makes sense from the UI point of view. For
example, marking whole channels as read or unread was also moved into
that separate thread, but it hardly makes sense to fetch items of the
currently selected channel to that thread — user would wait for this
operation to complete anyway, and it's fast enough for user to not start
doing other stuff.\
\
Threaded storage is already tested with SQLite and PostgreSQL on Linux
and generally seems to work. It should work with any PostgreSQL/MySQL
installation and with most modern SQLite installations. Though, if
SQLite was compiled without threading support, Aggregator would
misbehave, likely resulting in segfaults. In this case, file a bug to
your distro's SQLite maintainers. And, of course, the usual warning:
threaded storage is still quite experimental and not thoroughly tested,
so bugs may happen.\
\
This change only applies to the *master* branch: it won't be included in
the upcoming 0.5 release.