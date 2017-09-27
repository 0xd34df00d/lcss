---
title: Image sources
tags: concepts
---

Image source is a plugin providing (possibly hierarchical) image
collection to other plugins. The images should have a public URL and a
few other attributes.

For example, the [Blasq](/plugins-blasq) module provides images from the
cloud services, while the [LHTR](/plugins-lhtr) editor module can embed
them into the document being edited. Firstly the user selects the
service to embed images from:

\[img\_assist|url=images/lhtr\_up1.png|title=|align=inline|link=1|width=440\]

Then one chooses the images to add (on Blasq side):\

\[img\_assist|url=images/lhtr\_up2.png|title=|align=inline|link=1|width=440\]

Then one can configure parameters like previews size, alt text,
alignment and so on (now on the LHTR side):

\[img\_assist|url=images/lhtr\_up3.png|title=|align=inline|link=1|width=440\]

And finally (on the [Blogique](/plugins-blogique) side, in which LHTR
embeds):

\[img\_assist|url=images/lhtr\_up4.png|title=|align=inline|link=1|width=440\]
