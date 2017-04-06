---
title: RSS and OpenSearch
tags: user guide, poshuku
published: 2011-11-20T19:47:04
parentPage: user-guide-poshuku
bookOrder: 2
---

This chapter describes how to work with RSS- and OpenSearch-enabled web
sites in Poshuku.

RSS
---

\
\
[RSS](http://en.wikipedia.org/wiki/RSS) is used to publish frequently
updated works — such as blog entries, news headlines, audio, and video.
One can subscribe to an RSS feed to automatically receive the updates of
the site's content without checking it manually. RSS feeds are read by
RSS aggregators, and the standard RSS aggregator in LeechCraft is, well,
[Aggregator](/plugins-aggregator).\
\
If a feed reader is installed, Poshuku automatically detects RSS feeds
whenever it visits a RSS-enabled web page. If any RSS or Atom
([Atom](http://en.wikipedia.org/wiki/Atom_(standard)) is basically just
another format similar to RSS) feeds are detected on a web page, Poshuku
would offer subscribing to them by displaying the corresponding icon in
the address bar:\
\
\[img\_assist|url=images/rss1-a.png|title=|align=inline|link=1|width=750\]\
\
Clicking on the button reveals the list of feeds found:\
\
\[img\_assist|url=images/rss2.png|title=|align=inline|link=1|width=750\]\
\
As you may see, there may be several feeds on a single page, having
different content.\
\
Clicking on any item in the list results in dialog were you can set the
tags for the item:\
\
\[img\_assist|url=images/rss3.png|title=|align=inline|link=1|width=750\]\
\
Here you can enter ';'-separated list of tags for the feed, or choose
them from already-existing tags by right-clicking the line edit and
selecting the needed ones.\
\
Refer to the [Aggregator user guide](/user-guide-aggregator) for further
information.\
\
*Note*: you can also right-click on any link containing the word *RSS*,
and the context menu would have the corresponding action right on top:\
\
\[img\_assist|url=images/rss4.png|title=|align=inline|link=1|width=750\]\
\
This way you can subscribe to feeds that are not automatically detected.

OpenSearch
----------

\
\
[OpenSearch](http://en.wikipedia.org/wiki/OpenSearch) allows to perform
web searches without actually having to visit the corresponding search
engine. The [SeekThru](/plugins-seekthru) plugin in LeechCraft is
responsible for OpenSearch support.\
\
Just like with RSS feeds, Poshuku automatically detects the presence of
OpenSearch descriptions and suggests to add them. This is completely
analogous to the RSS autodetection and addition:\
\
\[img\_assist|url=images/opensearch1-a.png|title=|align=inline|link=1|width=750\]\
\
After selecting the OpenSearch description a dialog pops up where one
can enter the tags that would be used to address this description.\
\
Searching with the installed OpenSearch descriptions could be performed
either from [Summary](/plugins-summary) (which is documented in its user
guide) or directly from Poshuku. For that, just prepend the name of the
tag with the exclamation sign and enter the search query in the address
bar:\
\
\[img\_assist|url=images/opensearch2.png|title=|align=inline|link=1|width=750\]\
\
Here, we would search for "leechcraft repo" using all search engines
with the *git* tag.
