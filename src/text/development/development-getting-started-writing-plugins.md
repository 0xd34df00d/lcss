---
title: Getting started (writing plugins)
tags: plugins, development
published: 2011-07-18T14:54:25
parentPage: development-writing-plugins
bookOrder: 1
---

There are different typical scenarios for getting into LeechCraft
development, depending on your preferred role in the project.

Programmer
----------

\
\
Ok, so you want to write new plugins for LeechCraft, or maybe contribute
code to existing ones.\
\

-   Take a look at our [code style](/development-code-style) rules and
    guidelines so that you know how to write code that'd be easily
    accepted into LeechCraft main codebase.
-   You will probably want to know [how to build
    LeechCraft](/development-building-from-source).
-   Then, while it builds, you may feel like wanting to get familiar
    with [LeechCraft
    architecture](/development-leechcraft-architecture).
-   Read a [quick introduction to writing
    plugins](/development-writing-a-simple-plugin-in-20-minutes), where
    we'd write a simple plugin.
-   If you are unfamiliar with CMake, you could refer to some tips in
    our [cheatsheet](/development-cmake-cheatsheet).
-   Refer to our [workflow](/development-workflow).
-   Finally, refer to any relevant documentation about some particular
    LeechCraft features and ways of doing things (like [having tabs in
    your plugin](/development-having-tabs-in-your-plugin) or [support
    plugins inside your plugin](/development-plugins-for-plugins)) as
    you need to.

Translator
----------

\
\
LeechCraft uses Qt Linguist for translations, so you will need it
installed. Translations for language with the two-letter ISO code `lang`
for a plugin named, for example, Aggregator, are located in that
plugin's directory and are named
`leechcraft_aggregator_lang.ts`{type="bash"}. Translations may also be
targeted to different countries by appending the `_COUNTRY`{type="bash"}
two-letter ISO code to the base name of the translation file.\
\
If you want to translate LeechCraft to some language, first, check if
the translation exists already. If it does, you will need to update it,
otherwise you should generate it from scratch. Both tasks are done with
the same sequence of commands, and if you don't want to perform them by
yourself, feel free to contact us for us to update/generate the
translation for you.\
\
The sequence is:

<ol>
<li>
Check if there is any `*settings.xml` file. If there is, run the shell
script located at
`/tools/scripts/translationstuff/gencpp.sh`{type="bash"} (relative to
the root of the git repository), passing the name of the XML file to it
and redirecting the output of the script to a `.cpp`{type="bash"}-file,
like:\
\

``` {type="bash"}
~/Programming/leechcraft/tools/scripts/translationstuff/gencpp.sh *settings.xml > dummy.cpp
Run the following command to update (or generate) the translation you want to work on:

lupdate *.cpp *.h *.ui -ts leechcraft_pluginname_lang.ts

Please note that plugin may have additional files with translatable strings in subdirectories, in that case you should pass them in similar manner as well (before the -ts).
```
