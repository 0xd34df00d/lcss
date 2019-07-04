---
title: Blocking ads
tags: user guide, poshuku
published: 2011-11-20T21:00:32
parentPage: user-guide-poshuku
bookOrder: 3
---

Advertisment can be blocked with the [Poshuku
CleanWeb](/plugins-poshuku-cleanweb) plugin. CleanWeb watches all the
HTTP requests made and blocks those matching an entry in any installed
ad filter. Just after installation CleanWeb doesn't contain any ad
filters, and they have to be installed manually for CleanWeb to work.
Most filters are updated periodically (typically once in several days)
to reflect new ad patterns.

Adding filters
--------------

\
\
Filters allow CleanWeb to understand what HTTP requests should be
blocked. There are lots of already-existing filters. Some of them may
fit you better, depending on your language and browsing habits.\
\
Please avoid adding too much filters since that can degrade the
performance of your browsing considerably.\
\
There are two ways of adding filters.

### Through CleanWeb settings

\
\
There is a package called *Poshuku CleanWeb Subscriptions* with the list
of some popular filters in the [LackMan](/plugins-lackman). Install it
though LackMan:\
\
`{ "name": "cleanweb-install-packages1.png", "align": "inline", "title": ""  }`{.img}\
\
After that, go to CleanWeb settings, select *Subscriptions* tab and
click *Add*:\
\
`{ "name": "cleanweb-install-packages2.png", "align": "inline", "title": ""  }`{.img}\
\
There, select the subscriptions you want and click *OK*. That's it!

### The AdBlock+ subscriptions list

\
\
Since CleanWeb uses AdBlock+-compatible list format, you can just visit
their page with the [list of
subscriptions](http://adblockplus.org/en/subscriptions). There, just
click on the links near *Subscribe:* words, and the subscriptions would
be added automatically.

Removing filters
----------------

\
\
To remove a filter, just go CleanWeb settings page, select
*Subscriptions* tab, select the filter you'd like to remove and click
Remove. That's it!

Manual blocking
---------------

\
\
Some undesired elements may still be shown even after installing some
filters. To block them, right-click the corresponding element and select
*Block image...*. A dialog would pop up, where you can select blocking
options:\
\
`{ "name": "cleanweb-manual-filter1.png", "align": "inline", "title": ""  }`{.img}\
\
There, you could customize the URL pattern to block, select whether it
should be interpreted as a wildcard (with *\*?* symbols) or a regexp.
You can also specify whether the item will be blacklisted or
whitelisted, whether the matching should be case-sensitive, and on what
domains the filtering should be explicitly enabled or disabled.\
\
If you later change your mind and decide to unblock the item, just go to
CleanWeb settings, select the *User filters* tab and remove your filter.

Blocking Adobe Flash
--------------------

\
\
Flash elements could also be blocked. If blocking is enabled, Flash
won't be loaded by default. Instead it will be replaced with a button
allowing you to load only desired Flash clips.\
\
To enable Flash blocking, go to CleanWeb settings, select *FlashOnClick*
tab and select the checkbox. That's it!
