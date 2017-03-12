---
title: Archives
tags: lackman, development
published: 2011-10-30T14:03:14

---

This page describes creating archives for LackMan packages and also
considers some common directory structures for different plugins.

Install destination
-------------------

\
\
Basically, LackMan package is just a `tar.gz`{type="bash"} archive
(besides the package description) that would be unpacked to some
destination, preserving the directory structure of the archive.\
\
Different types of packages are installed to different places:\
\

-   `$LC_DATA_DIR/plugins/scriptable/$pluginlanguage/`{type="bash"} for
    scriptable plugins.
-   `$LC_DATA_DIR/icons/`{type="bash"} for iconsets.
-   `$LC_DATA_DIR/translations/`{type="bash"} for translations.
-   `$LC_DATA_DIR/data/`{type="bash"} for theme packages and general
    data packages.

\
\

``` {type="bash"}
$LC_DATA_DIR is the directory in user's home directory where LeechCraft's data relies. Currently it is ~/.leechcraft.

As one may see, destination directory of a scriptable plugins depends on its language. The language name is used as the directory name, and it can be, for example, one of these:


python
qtscript
ruby


For example, a plugin written in Python would go into $LC_DATA_DIR/plugins/scriptable/python/, while JavaScript/QtScript plugin would go to $LC_DATA_DIR/plugins/scriptable/qtscript/.

Naming the archive

The archive should be named as the package with all whitespaces removed and converted to the lower case, plus the version number of the package.

So, for example, archive for the package Really Cool Smiles of version 1.2.1-beta1 would be named reallycoolsmiles-1.2.1-beta1.tar.gz.

Examples

Adium style for Azoth

Azoth AdiumStyles searches for custom Adium styles from $LC_DATA_DIR/data/azoth/styles/adium/. Each style should reside in its own directory, but each package could have several styles included.

So, suppose we want to make a package named Modern Bubbling of the version 1.0 with two styles: Modern Bubbling and Modern Bubbling (Compact). Due to Adium themes internals, the package archive should be created in such a way that, when unpacked, the main.css file have the following path:


$LC_DATA_DIR/data/azoth/styles/adium/Modern\ Bubbling.AdiumMessageStyle/Contents/Resources/main.css
```

\
\
Here we take the `main.css`{type="bash"} file because it's pretty
standard for Adium themes and exists in almost all of them.\
\
So, we create a directory where we'd place our archive contents and
`cd`{type="bash"} into it. In this example, we assume the following
directory:
`~/Programming/lcupackages/modernbubbling/arch/`{type="bash"}. That is:\
\

``` {type="bash"}
mkdir -p ~/Programming/lcupackages/modernbubbling/arch/
cd ~/Programming/lcupackages/modernbubbling/arch/
```

\
\
We place there what we want to go to the archive remembering that it
would be extracted just to `$LC_DATA_DIR/data/`{type="bash"}. So, our
`main.css`{type="bash"} file would be in:\
\

``` {type="bash">
~/Programming/lcupackages/modernbubbling/arch/azoth/styles/adium/Modern Bubbling.AdiumMessageStyle/Contents/Resources/main.css
</pre><br/><br/>Then we just create the archive with the following command:<br/><br/><pre type="bash">
tar cvzf modernbubbling-1.0.tar.gz azoth/
</pre><br/><br/>That is, our archive is ready!

<h3>Status icons pack for Azoth</h3><br/><br/><a href="/plugins-azoth">Azoth</a> searches for custom status icon packs in <code type="bash">$LC_DATA_DIR/data/azoth/iconsets/contactlist/</code>. Each subdirectory there is a separate icon pack and should contain files like <code type="bash">online.png</code> or <code type="bash">dnd.png</code>.<br/><br/>So, suppose we want to make a package named <em>Humane Statuses</em> of the version <em>2.1</em>. We create a directory where we" d="" place="" our="" archive="" contents="" and="" <code="" type="bash"}
cd into it. In this example, we assume the following directory: ~/Programming/lcupackages/humanestatuses/arch/. That is:


mkdir -p ~/Programming/lcupackages/humanestatuses/arch/
cd ~/Programming/lcupackages/humanestatuses/arch/
```

\
\
We place there what we want to go to the archive remembering that it
would be extracted just to `$LC_DATA_DIR/data/`{type="bash"}. So, for
example, our `online.svg`{type="bash"} file would be in:\
\

``` {type="bash">
~/Programming/lcupackages/modernbubbling/arch/azoth/iconsets/contactlist/Humane\ Statuses/online.svg
</pre><br/><br/>Then we just create the archive with the following command:<br/><br/><pre type=" bash"=""}
tar cvzf humanestatuses-2.1.tar.gz azoth/
```

\
\
That is, our archive is ready!