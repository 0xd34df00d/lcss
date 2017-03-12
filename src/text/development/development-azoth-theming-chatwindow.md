---
title: Theming chat windows
tags: themes, plugins, development, azoth
published: 2011-07-11T00:08:54

---

Azoth chat windows may be styled if the Azoth StandardStyles plugin is
present.

File layout
-----------

\
\
A chat window theme includes an HTML template file named
`viewcontents.html`{type="bash"} and optionally any other required
files. A different template may be used for MUC chats: if present,
`viewcontents.muc.html`{type="bash"} would be used instead of
`viewcontents.html`{type="bash"}.\
\
For Azoth StandardStyles to detect your theme, create a directory in
`~/.leechcraft/data/azoth/styles/standard/`{type="bash"} with the
desired name (it would be the name of your theme) and place at least the
template file there. For a sample theme called, for example, Sample,
that would be
`~/.leechcraft/data/azoth/styles/standard/Sample/viewcontents.html`{type="bash"}.

Simple example
--------------

A basic theme would look like



    	
    		
    		
    		
    		Chat
    		
    			a { color: LINKCOLOR; }
    			a.nicklink { text-decoration: none; }
    			body { background-color: BACKGROUNDCOLOR; color: FOREGROUNDCOLOR; }
    			.statusmsg { color: green; }
    			.highlightchatmsg { color: red; }
    		
    	
    	

</pre>
Message elements
----------------

\
\
Messages are appended to the ``{type="html"}

</code> element as ``{type="html"}

<div>

</code>s. The classes of those ``{type="html"}
<div>

</code>s and their subelements depend on the role of the message, and
may be used to show different messages in different style.\
\
The following ``{type="html"}
<div>

</code> classes are used:
-   `"slashmechatmsg"` for messages beginning with "/me".
-   `"highlightchatmsg"` for chat messages that triggered a highlight.
-   `"chatmsg"` for the rest of chat messages.
-   `"eventmsg"` for the event messages (like kicks, bans and MUC room
    subject changes).
-   `"statusmsg"` for status messages (like status changes as well as
    joins and leaves in MUCs).

\
\
Nickname, if any, is in ``{type="html"} inside the div. Nicknames in the
MUCs are basically hyperlinks that allow to insert them in the message
line edit, and the corresponding ``{type="html"} elements have the
`"nicklink"` class. Nicknames in one-to-one chats have class of either
`"nicknamein"` or `"nicknameout"` depending on whether it's nickname in
incoming or outgoing message.\
\
Date/time of the message is shown in a ``{type="html"}.
Nick coloring
-------------

\
\
The ``{type="html"} tag defines the type of nick color generation. If
it's `"hash"`, then the smart color-generator is used to generate the
colors based on the current palette background (*not* the HTML template
background). If it's a list of space-separated words, than the words are
converted to the colors and used instead. The words may have the
following format:
-   `#RGB`{type="html"} (each of R, G, and B is a single hex digit)
-   `#RRGGBB`{type="html"}
-   `#RRRGGGBBB`{type="html"}
-   `#RRRRGGGGBBBB`{type="html"}
-   A name from the list of colors defined in the list of SVG color
    keyword names provided by the World Wide Web Consortium; for
    example, "steelblue" or "gainsboro".

\
\
The color-generator-based hash coloring is not recommended for themes
where background color is overridden.
Autoscrolling
-------------

\
\
A script for autoscrolling support would be added to your webpage. The
script exposes three functions: `ScrollToBottom()`{type="js"},
`TestScroll()`{type="js"} and `InstallEventListeners()`{type="js"}. It
also installs event handlers to
`document.body.DOMNodeInserted`{type="js"} event and to
`window.onresize`{type="js"} event, and adds a new property to the
`window`{type="js"} object, called `ShouldScroll`{type="js"}.

</div>

</div>

</div>