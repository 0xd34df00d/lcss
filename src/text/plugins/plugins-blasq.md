---
title: Blasq
tags: blasq
published: 2014-03-18T16:14:14
shortdescr: client for various cloud image storage services, like Flickr or Picasa

---

Blasq is the client for various cloud image storage services, like
Flickr or Picasa. The exact storage services, which are listed below,
are implemented via subplugins.

Blasq supports both fetching image collections and the images themselves
and uploading images to remote services (where applicable). Other
plugins like [Blogique](/plugins-blogique) may also use Blasq for
inserting images into blog posts, for example.

Screenshots
-----------
\[img\_assist|url=images/blasq01.png|title=|align=inline|link=1|width=440\]
\[img\_assist|url=images/blasq02.png|title=|align=inline|link=1|width=440\]

Features
--------
- Fetch image collections.
- Display and download images.
- Upload images to the cloud image storages (including mass upload).
- Delete images.
- Support for the [data filter](/concepts-data-filters) concept for
  uploading images from other plugins.

Please note the list of supported features may differ depending on the exact service.

Supported services
------------------
Flickr
:   Via the Spegnersi subplugin. Image uploads aren't supported yet.

LiveJournal FotoBilder
:   Via the DeathNote subplugin.

Picasa
:   Via the Vangog subplugin.

VKontakte
:   Via the Rappor subplugin.
