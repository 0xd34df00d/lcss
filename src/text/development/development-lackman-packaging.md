---
title: Packaging
tags: lackman, development
published: 2011-10-25T18:39:31

---

This page describes the process of packaging for LackMan.

Basics
------

\
\
Generally, LackMan package consists from a description of the package
and a set of archives. Each archive corresponds to a separate package
version, while package description describes the most recent version.\
\
The package description file is named like the package itself, converted
to lowercase and whitespaces removed. So for a package called *Cool New
Icons* the corresponding file would be `coolnewicons.xml`{type="bash"}.

Description example
-------------------

\
\
The XML file for the *Modern Bubbling* package, which we will create in
the next section, looks like this:\
\

``` {type="xml"}


 Modern Bubbling
 An Adium chat style theme from the Adiumxtras site.
 
  azoth
  theme
  chat styles
  adium
 
 
  1.0
 
 
  
  
 
 A nice theme with lots of variants.<br /><br />
This package contains two variants: plain Modern Bubbling and Compact version, which allows to group consecutive messages into a single message bubble.<br /><br />
This theme is available at <a href="http://www.adiumxtras.com/index.php?a=xtras&xtra_id=3629">http://www.adiumxtras.com/index.php?a=xtras&xtra_id=3629</a>
 
  Georg Rudoy
  0xd34df00d@gmail.com
 
 
```

Creating package description
----------------------------

\
\
Package description is, well, just an XML file describing that package.
That XML format isn't documented yet, though I hope someday it would
be.\
\
The best method of creating the description file is to use our tiny
[lcpackgen](https://github.com/0xd34df00d/lcpackgen/) program. It's
simple as hell and could be obtained via git:
<git://github.com/0xd34df00d/lcpackgen.git>. It uses Qt and builds with
*cmake* and could be built everywhere LeechCraft can run.\
\
Here we will show by example how *lcpackgen* can be used. We'd make a
description file for package *Modern Bubbling*, which is an Adium chat
style for [Azoth](/plugins-azoth).\
\
So, we run *lcpackgen* and see something like this:\
\
\[img\_assist|url=images/00\_startup.png|title=|align=inline|link=1|width=679|height=502\]\
\
We start filling different fields and noting where the label in bottom
right corner becomes green, meaning that we have provided enough
information. So, we fill in some fields in the *Basic* tab:\
\
\[img\_assist|url=images/01\_basic.png|title=|align=inline|link=1|width=679|height=502\]\
\
Please note how we use HTML in the *Long description* field.\
\
Then we set what versions are available:\
\
\[img\_assist|url=images/02\_versions.png|title=|align=inline|link=1|width=679|height=502\]\
\
Our theme doesn't have any dependencies, so we leave that field blank.
Also note that the label in the bottom right corner tells now that the
description is valid. We can basically save the description, but since
our theme is a really nice piece of artwork, we'd provide a screenshot:\
\
\[img\_assist|url=images/04\_screenshots.png|title=|align=inline|link=1|width=679|height=502\]\
\
In these fields, we can list URLs of screenshots and thumbnails, one URL
per line.\
\
Finally, we save the description to a directory containing all the stuff
(like archives) related to our package as
`modernbubbling.xml`{type="bash"}.

Archives
--------

\
\
Creating proper archives for the packages is documented on the
corresponding [Archives](/development-lackman-archives) page.

Getting it into the repo
------------------------

\
\
After you've created the package description and the corresponding
archive (or several archives), you can either create an issue on our
[issue tracker](http://dev.leechcraft.org) with your files attached,
send them into the maillist (<leechcraft-users@lists.sourceforge.net>),
or find us in our XMPP conference,
[leechcraft@conference.jabber.ru](xmpp:leechcraft@conference.jabber.ru?join).\
\
After that, if all goes well, your package would be in the LackMan
repos:\
\
\[img\_assist|url=images/lackman2.png|title=|align=inline|link=1|width=440|height=269\]