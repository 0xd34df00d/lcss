---
title: Monocle
tags: plugins, monocle
published: 2014-03-06T07:51:39
shortdescr: modular document reader, with support for different file formats via different backends
keyplugin: 1

---

Monocle is a modular document reader, with support for different file
formats via different backends.\
\
Monocle integrates with the rest of LeechCraft, so, for example, when
you click a link to a PDF document in [Poshuku](/plugins-poshuku), it is
suggested to be opened by Monocle after it's downloaded.

Features
--------

-   Tables of contents.
-   Support for links in documents (like in PDF files).
-   Support for forms in documents (like, again, in PDF documents).
-   Displaying annotations in documents like PDF.
-   Support for searching in documents like PDF and FB2.
-   Thumbnails for documents visually highlighting the currently
    displayed part of the pages.
-   Support for selecting areas and copying them as image or as text (if
    applicable), or even integrating with the [data
    filters](/concepts-data-filters) like image uploaders or
    text searchers.
-   Fullscreen presentation mode.
-   Limited cache for already-rendered images.
-   Displaying one or two pages at once.
-   Paginated navigation.
-   Automatic document reload on document file changes.
-   Integration with the rest of LeechCraft.

\
\
The exact feature set depends on the backend used and document type.

Screenshots
-----------

\
\
\[img\_assist|url=images/monocle01.png|title=Searching in a PDF
document|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/monocle\_datafilters\_part.png|title=Data
filters|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/monocle02.png|title=Page
thumbnails|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/monocle03.png|title=PDF document with
forms|align=inline|link=1|width=440\]\
\
\[img\_assist|url=images/monocle04.png|title=DjVu
document|align=inline|link=1|width=440\]

Backends
--------

\
\
Different file formats are supported by different backends. For now the
following backends exist:

### PDF (Poppler-based)

\
\
The most feature-rich backend, based on the Poppler rendering library.
It also supports multithreaded threaded rendering on Poppler 0.24.0 and
newer, resulting in seamless smooth scrolling and optimal multicore
usage if multiple pages are displayed at once.

### fb2

\
\
Self-written parser for fb2 books. Doesn't support images in fb2
documents for now.

### DjVu

\
\
Based on the DjVuLibre suite.

### PostScript

\
\
Based on the libspectre library.

### MOBI

\
\
Based on own implementation.

### PDF (mupdf-based)

\
\
Another backend for PDF documents. Some claim that it renders more
nicely than Poppler. Though, for now it doesn't support links, forms,
text searching and possibly some other fancy things Poppler supports.\
\
Please note that since mupdf is built as static library, you need to
build mupdf with the `-fPIC`{type="bash"} option.