---
title: Writing recipes for BodyFetch
tags: tutorial, development, aggregator
published: 2011-07-12T02:14:01
parentPage: development-aggregator
---

Introduction
------------

\
\
This guide introduces to writing recipes: small scripts for fetching
full news bodies in [Aggregator
BodyFetch](/plugins-aggregator-bodyfetch).\
\
Recipes are usually written in JavaScript or Python, and they contain
all the required information and, possibly, algorithms for BodyFetch to
get the full news stories.\
\
Since only Qrosp plugin provides scripting support for now, and it
currently supports only JavaScript and Python, only these languages are
actually supported for now. And since Python support in the Qross
library (which is used by Qrosp) is optional, it is recommended to write
recipes in JavaScript. Because of that, we will use JavaScript during
our examples.\
\
Please note that the API is in its early stages now, and it would surely
be extended and upgraded. Don't hesitate writing us your suggestions and
ideas.

File locations
--------------

\
\
Custom user recipes are searched in the following directories:\
\

-   `~/.leechcraft/data/scripts/aggregator/recipes/qtscript/`{type="bash"}
    for recipes in JavaScript.
-   `~/.leechcraft/data/scripts/aggregator/recipes/python/`{type="bash"}
    for recipes in Python.

\
\
All recipes can have any name, but it's recommended to use the site's
domain name to simplify distinguishing them from each other.\
\
JavaScript recipes may have `.js`{type="bash"}, `.qs`{type="bash"} or
`.es`{type="bash"} extension, while Python ones may only end with
`.py`{type="bash"}.

Basic API
---------

\
\
Basic API is suitable for most cases.\
\
The simplest recipe should have only two functions,
`CanHandle(link)`{type="javascript"} and
`KeepFirstTag()`{type="javascript"}.

### CanHandle(link)

\
\
This function is called by BodyFetch to determine whether the recipe can
handle news items from the given channel, which is identified by its
link parameter. This function should return true if the recipe is
written for this channel, otherwise it should return false.\
\
An example function for Habrahabr.ru website would look like:\
\

``` {type="javascript"}
function CanHandle(link)
{
        return link.indexOf("http://habrahabr.ru/rss/") == 0;
}
```

### KeepFirstTag()

\
\
This function should return the list of CSS2 selectors that are used to
find the elements to be considered as full news body. For each selector
only first found element is considered (hence Keep*First*Tag), and if
there are several selectors in the returned list, the result is
constructed from the elements found according to them in the same order
as selectors appear in the list. This may be useful for constructing the
news body out of several parts of the page.\
\
Selectors' outer XML is used as the result.\
\
An example function for Habrahabr.ru would look like:\
\

``` {type="javascript"}
function KeepFirstTag()
{
        return [ 'div[class="content"]' ];
}
```
