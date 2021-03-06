---
title: Monocle
tags: plugins, monocle
published: 2014-03-06T07:51:39
shortdescr: modular multiformat document viewer
keyplugin: 1

---

Monocle is a modular document reader, with support for different file
formats via different backends.

Monocle integrates with the rest of LeechCraft, so, for example, navigating
to a PDF document in [Poshuku](/plugins-poshuku) automatically suggests opening
it in Monocle.

Features
--------

- Tables of contents.
- Support for links in documents (like in PDF files).
- Support for forms in documents (like, again, in PDF documents).
- Displaying annotations in documents like PDF.
- Support for searching in documents like PDF and FB2.
- Thumbnails for documents visually highlighting the currently
  displayed part of the pages.
- Support for selecting areas and copying them as image or as text (if
  applicable), or even integrating with the [data
  filters](/concepts-data-filters) like image uploaders or
  text searchers.
- Fullscreen presentation mode.
- Limited cache for already-rendered images.
- Displaying one or two pages at once.
- Paginated navigation.
- Automatic document reload on document file changes.
- Integration with the rest of LeechCraft.

The exact feature set depends on the backend used and document type.

Screenshots
-----------

`{ "name": "monocle01.png", "align": "inline", "title": "Searching in a PDF document", "thumb": "medium" }`{.img}

`{ "name": "monocle_datafilters_part.png", "align": "inline", "title": "Data filters", "thumb": "medium" }`{.img}

`{ "name": "monocle02.png", "align": "inline", "title": "Page thumbnails", "thumb": "medium" }`{.img}\

`{ "name": "monocle03.png", "align": "inline", "title": "PDF document with forms", "thumb": "medium" }`{.img}\

`{ "name": "monocle04.png", "align": "inline", "title": "DjVu document", "thumb": "medium" }`{.img}

Backends
--------

Different file formats are supported by different backends. For now the
following backends exist:

### PDF

The most feature-rich backend, based on the Poppler rendering library.
It also supports multithreaded threaded rendering on Poppler 0.24.0 and
newer, resulting in seamless smooth scrolling and optimal multicore
usage if multiple pages are displayed at once.

### fb2

Self-written parser for fb2 books. Doesn't support images in fb2
documents for now.

### DjVu

Based on the DjVuLibre suite.

### PostScript

Based on the libspectre library.

### MOBI

Based on own implementation.
