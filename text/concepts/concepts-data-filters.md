---
title: Data filters
tags: concepts
---

Data filters are plugins that consume some data like text or images from
other plugins. They may be the end point of processing or pass it
further to other plugins.

Example
-------

A [screenshot tool](/plugins-auscrie) may save or upload the screenshots
itself, or it may just pass this duty to the image data filters. The
filters could then upload the image to a dumb imagebin, or to a
collection on Flickr, or perform arbitrary modifications to the image
(like applying Instagram-like filters) and pass it along to other data
filters.

A [document reader](/plugins-monocle) can pass the selected text to text
data filters for [searching in Opensearch engines](/plugins-seekthru) or
uploading it to a pastebin. The following screenshot illustrates this:
\[img\_assist|url=images/monocle\_datafilters\_part.png|title=Data filters in Monocle|align=inline|link=1|width=440\]

The exact functionality of the data filters doesn't matter to the plugin
producing the data. Moreover, data filter plugins are "passive" — that
is, data is fed to them by data producers. The producer plugins can
choose between different data filters, with or without user interaction.

Data filter types
-----------------

### Image data filters

- [Imgaste](/plugins-imgaste)

### Text data filters

- Pogooglue
- [SeekThru](/plugins-seekthru)

Modules using data filters
--------------------------

### Image filters

- [Auscrie](/plugins-auscrie) for handling screenshots.
- [Monocle](/plugins-monocle) for handling selected parts of a
  document as images.
- [Poshuku](/plugins-poshuku) for handling full-length web page shots.

### Text data filters

- [Azoth](/plugins-azoth) for handling selected chat text.
- [Monocle](/plugins-monocle) for handling selected document text.
- [Poshuku](/plugins-poshuku) for handling selected text on web pages.
