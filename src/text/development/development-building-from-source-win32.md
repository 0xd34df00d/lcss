---
title: Building from source (Win32)
tags: development
published: 2011-09-13T20:42:23
parentPage: development-general-information
---

This document describes building LeechCraft with pretty much all the
plugins for Win32. This is still highly experimental, so the result is
not guaranteed.

Intro
-----

\
\
This build guide assumes Windows 7 with Microsoft Visual Studio 2010
SP1. We will use Qt 4.7.3, Boost 1.46.1, Libtorrent 0.15.6, CMake 2.8.4,
qxmpp-dev snapshot and fresh enough OpenSSL.\
\
We will use `E:\LeechCraft`{type="winbatch"} path for LeechCraft source
and we will store third-party libraries in `E:\libs`{type="winbatch"}
throughout the guide. Adjust the paths accordingly.

Installing Qt
-------------

\
\
Seems like it is safe to use Qt binaries shipped by Nokia for MSVS 2008
with the 2010 version. The binaries could be found at [Qt download
page](http://qt.nokia.com/downloads/downloads#qt-lib), and here's the
direct link that works at the time of writing the guide:
http://qt.nokia.com/downloads/windows-cpp-vs2008.\
\
So, download the installer and install Qt into
`E:\Libs\Qt\4.7.3`{type="winbatch"} (note the version at the end, it may
be different for you).\
\
After you've installed Qt, open
`E:\Libs\Qt\4.7.3\bin\qtvars.bat`{type="winbatch"} and add the following
line there, adjusting the paths necesserily:\
\

``` {type="winbatch"}
call "C:\Program Files\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86
```

\
\
This way, opening Qt command prompt would also set up MSVS compiler
properly.\
\
*Note:* while I tried to follow this guide myself, the precompiled
binaries of Qt weren't working with MSVS 2010, so I had to compile them
manually.\
\
*Note:* if you choose to compile Qt yourself, make sure you do it
*after* installing SSL, and that Qt can find your OpenSSL installation.

Building Boost
--------------

\
\
Download the freshiest version of Boost, for example, from
https://sourceforge.net/projects/boost/files/boost/1.46.1/ for 1.46.1.
Unpack it into `E:\Libs\boost_1_46_1`{type="winbatch"}. Open MSVS
command line prompt and issue the following sequence of commands:\
\

``` {type="winbatch"}
E:
cd \Libs\boost_1_46_1
bootstrap.bat
.\bjam link=shared
```

\
\
This would build shared-only version of Boost libraries, both release
and debug. After this, issue
`copy bjam.exe C:\Windows\System32`{type="winbatch"} to make bjam
available later — it will be used for Libtorrent.\
\
If you, for some reason, want static version of Boost binaries, just
omit the `link=shared`{type="winbatch"} part from the last command. If
you want only release or debug versions, append the corresponding
parameter to `bjam`{type="winbatch"}, for example:\
\

``` {type="winbatch"}
.\bjam release
```

\
\
for building both static and shared release-only libraries.\
\
Building Boost takes a while, from several minutes on a pretty modern
Core i7 system to hours on older systems. My Athlon 64 X2 4000+ managed
to build in 24 minutes, for example. So, we may move on to installing
other dependencies while Boost is being built.

Installing OpenSSL
------------------

\
\
Thankfully, OpenSSL comes in precompiled form for Win32, so it's
unnecessary to build it (though you can, of course, but for that you'd
need Perl). Binaries could be downloaded from
[here](http://www.slproweb.com/products/Win32OpenSSL.html), and at the
time of writing the OpenSSL 1.0.0d version was actual, so we download
the [corresponding
installer](http://www.slproweb.com/download/Win32OpenSSL-1_0_0d.exe).
Avoid light versions of installer, since they don't contain development
files that are required to build software that uses OpenSSL. The needed
installer is typically around 8 MB in size, or maybe even more.\
\
Once again, we install OpenSSL into `E:\Libs`{type="winbatch"}, so that
the installer would create `E:\Libs\OpenSSL-Win32`{type="winbatch"}.\
\
The installer may ask whether to install the libraries into System32
folder or into installation folder. Choose the second.

Installing CMake
----------------

\
\
That's pretty simple, just download CMake binary installer from the
[official site](http://cmake.org/cmake/resources/software.html). Install
it into standard program files folder (since it's not a binary) and
choose to register it in PATH for you.

Installing NSIS
---------------

\
\
Though optional, this step is also recommended. Download and install
NSIS from their [Download page](http://nsis.sourceforge.net/Download).

Installing git
--------------

\
\
You will need git to checkout fresh sources of LeechCraft, qxmpp and
Qross. Download the freshiest installer of msysgit whose name begins
with "Git-" from the [msysgit
page](http://code.google.com/p/msysgit/downloads/list). At the time of
writing, a preview version of git 1.7.4 [was
actual](http://code.google.com/p/msysgit/downloads/detail?name=Git-1.7.4-preview20110204.exe&can=2&q=).\
\
Run the installer. It's recommended to add git to the system path.

Building speex
--------------

\
\
Speex is needed for Jingle support in LeechCraft Azoth.\
\
Download sources from [Speex site](http://www.speex.org/downloads/). At
the time of writing,
[1.2rc1](http://downloads.xiph.org/releases/speex/speex-1.2rc1.tar.gz)
version was actual. Unpack the sources to
`E:\Libs\speex`{type="winbatch"}.\
\
Load the VS2003 (later ones would cause you problems) solution from
`E:\Libs\speex\win32\VS2008\libspeex.sln`{type="winbatch"}. MSVS2010 may
ask to convert it, so accept and convert.\
\
Having successfully converted the project, select Release build type and
build the *libspeex* project.

Building QXmpp
--------------

\
\
Open the Qt command prompt and issue the following:\
\

``` {type="winbatch"}
E:
cd \Libs
git clone git://github.com/0xd34df00d/qxmpp-dev.git
cd qxmpp-dev
mkdir build
cd build
qmake ../
set INCLUDE=E:\Libs\speex\include;%INCLUDE%
nmake release
cd ..
mkdir qxmpp
copy src\*.h qxmpp
```

\
\
This will build the release version of QXmpp. If you want debug version
as well, substitute `nmake release`{type="winbatch"} with
`nmake`{type="winbatch"}.

Building QJson
--------------

\
\
Get [QJson sources](http://sourceforge.net/projects/qjson/files/qjson/)
([0.7.1](http://sourceforge.net/projects/qjson/files/qjson/0.7.1/qjson-0.7.1.tar.bz2/download)
is actual at the time of writing). Unpack it into
`E:\Libs\qjson`{type="winbatch"}, make sure MSVS isn't running and
issue:\
\

``` {type="winbatch"}
E:
cd \Libs\qjson
mkdir build
cd build
cmake ../ -G "Visual Studio 10"
```

\
\
Then, open `E:\Libs\qjson\build\qjson.sln`{type="winbatch"} and build
the MinSizeRel configuration.\
\
Create directory `E:\Libs\qjson\qjson`{type="winbatch"} and copy all
`*.h`{type="winbatch"} and `*.hh`{type="winbatch"} files from
`src`{type="winbatch"} directory there.

Building libtorrent
-------------------

\
\
By the time you get here, Boost should have already been compiled, so
now libtorrent, which depends on Boost, can be built.\
\
First, [get the
source](http://code.google.com/p/libtorrent/downloads/list). At the time
of writing,
[0.15.6](http://code.google.com/p/libtorrent/downloads/detail?name=libtorrent-rasterbar-0.15.6.tar.gz&can=2&q=)
was the latest version.\
\
Then, extract the archive into `E:\Libs\libtorrent`{type="winbatch"}.
Open MSVS command prompt and issue:\
\

``` {type="winbatch"}
E:
cd \Libs\libtorrent
set BOOST_ROOT=E:\Libs\boost_1_46_1
set INCLUDE=E:\Libs\OpenSSL-Win32\include;%INCLUDE%
set LIB=E:\Libs\OpenSSL-Win32\lib;%LIB%
bjam boost=source boost-link=shared link=shared openssl=pe geoip=off release
```

\
\
This will build release version of libtorrent with support for OpenSSL
and without GeoIP (LC doesn't use it anyway), with dynamic linking to
Boost.

Building Qross
--------------

\
\
Qross library is required for LeechCraft scripting plugin, Qrosp.
Basically, only the JS backend is required to be built, and we won't
consider building Python support now.\
\
So, open the Qt command line prompt and issue:\
\

``` {type="winbatch"}
E:
cd \Libs
git clone git://github.com/0xd34df00d/Qross.git
cd Qross
mkdir build
cd build
cmake ../src/qross -G "Visual Studio 10"
```

\
\
Open `E:\Libs\Qross\build\Project.sln`{type="winbatch"} with Visual
Studio, select the MinSizeRel configuration and build the solution.

Building LeechCraft
-------------------

\
\
Open the Qt command line prompt and issue:\
\

``` {type="winbatch"}
E:
git clone git://github.com/0xd34df00d/leechcraft.git
```

\
\
Run `E:\leechcraft\tools\win32\build32.bat`{type="winbatch"} script.
Open
`E:\leechcraft\tools\win32\build32\leechcraft.sln`{type="winbatch"},
select RelWithDebInfo configuration and build the solution.\
\
Then, after it builds, use the
`E:\leechcraft\tools\win32\collect32.bat`{type="winbatch"} to collect
all LeechCraft-related libraries and executables into single directory,
ready to be packed.