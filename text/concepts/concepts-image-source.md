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

`{ "name": "lhtr_up1.png", "align": "inline", "title": "" , "thumb" : "medium" }`{.img}

Then one chooses the images to add (on Blasq side):\

`{ "name": "lhtr_up2.png", "align": "inline", "title": "" , "thumb" : "medium" }`{.img}

Then one can configure parameters like previews size, alt text,
alignment and so on (now on the LHTR side):

`{ "name": "lhtr_up3.png", "align": "inline", "title": "" , "thumb" : "medium" }`{.img}

And finally (on the [Blogique](/plugins-blogique) side, in which LHTR
embeds):

`{ "name": "lhtr_up4.png", "align": "inline", "title": "" , "thumb" : "medium" }`{.img}
