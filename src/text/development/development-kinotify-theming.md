---
title: Theming Kinotify
tags: themes, plugins, kinotify, development
published: 2011-01-31T18:06:15

---

Kinotify supports themes for the notifications.

File layout
-----------

\
\
A notification theme includes an HTML template file named `tmp.html` and
optionally any other files you may need in the notification.\
\
For Kinotify to detect your theme, create a directory in
`~/.leechcraft/data/kinotify/themes/notification` with the desired name
(it would be the name of your theme) and place at least the template
file there. For a sample theme called, for example, Sample, that would
be `~/.leechcraft/data/kinotify/themes/notification/Sample/tmp.html`.

Template contents
-----------------

\
\
The templates are encouraged to support actions from the plugins. To
support actions, insert a `form`tag where appropriate. Kinotify would
append `input` elements with the `type="button"` to the first found
`form` element in your theme file.\
\
Kinotify uses WebKit internally to render the notification, so feel free
to use whatever decent versions of WebKit support in your HTML.

### Supported placeholders

\
\
The template file will have the following fixed strings substituted
accordingly:

-   `{title}` — would be replaced with the actual title of
    the notification.
-   `{body}` — would be replaced with the text of the notification.
-   `{imagepath}` — would be replaced with either path to the icon
    representing the notification or the base64-encoded contents of
    the icon.

\
\
The theme may also have a subfolder named `img`, and for each file there
matching the pattern `*.png` the `{basename}` string in the template
would be substituted with the contents of the corresponding
`basename.png` file in base64-scheme.\
\
The theme may refer to the colors of the current palette using the
`{ColorRole}` placeholder, which will be replaced with the RGB-string
of the corresponding color, like `100, 0, 0` for somewhat red color. The
`Role` may have the following values with the corresponding meaning:

-   Window
-   WindowText
-   Base
-   AlternateBase
-   ToolTipBase
-   ToolTipText
-   Text
-   Button
-   ButtonText
-   BrightText

Notes
-----

### Samples

\
\
Currently two predefined themes come with Kinotify: Commie and Adaptive,
located at `src/plugins/kinotify/themes/notification/` in the source
tree or in `/usr/share/leechcraft/kinotify/themes/notification` in
installed LeechCraft.

### Testing

\
\
Please note that **you don't need to restart LeechCraft or reset the
theme** for the changes to take effect. Just do something that would
produce notifications.