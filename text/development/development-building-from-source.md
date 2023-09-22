---
title: Building from source
tags: development
published: 2014-07-03T22:14:58
parentPage: development-general-information
---

Prerequisites
-------------

+--------------------------+--------------------------+--------------------------+
| Dependency               | Version                  | Notes                    |
+:=========================+:=========================+:=========================+
| Qt                       | ≥5.9                     |                          |
+--------------------------+--------------------------+--------------------------+
| Boost                    | ≥1.70                    |                          |
+--------------------------+--------------------------+--------------------------+
| OpenSSL                  | ≥0.9.8                   |                          |
+--------------------------+--------------------------+--------------------------+
| PCRE                     | ≥8.30                    | Optional (though         |
|                          |                          | recommended) Core        |
|                          |                          | dependency. Used by      |
|                          |                          | AdBlock and Azoth.       |
|                          |                          | Previous 8.x versions    |
|                          |                          | will also work though    |
|                          |                          | lack JIT support.        |
+--------------------------+--------------------------+--------------------------+
| Rasterbar libtorrent     | ≥1.2.1                   | Unicode and DHT support  |
|                          |                          | is required.             |
+--------------------------+--------------------------+--------------------------+
| QXmpp                    | ≥1.1.0                   |                          |
+--------------------------+--------------------------+--------------------------+
| libotr                   | ≥4.0.0                   | Required for the Azoth   |
|                          |                          | OTRoid plugin (3.x will  |
|                          |                          | also work though lack    |
|                          |                          | some features).          |
+--------------------------+--------------------------+--------------------------+
| hunspell                 | ≥1.3.0                   | Required for the         |
|                          |                          | Rosenthal plugin.        |
+--------------------------+--------------------------+--------------------------+
| Speex                    | ≥1.0                     | Required for the         |
|                          |                          | [Azoth](/plugins-azoth)  |
|                          |                          | plugin compiled with     |
|                          |                          | `ENABLE_MEDIACALLS`.     |
+--------------------------+--------------------------+--------------------------+
| libtelepathy-qt5         | ≥0.9.8                   | Required for the [Azoth  |
|                          |                          | Astrality](/plugins-azot |
|                          |                          | h-astrality)             |
|                          |                          | plugin.                  |
+--------------------------+--------------------------+--------------------------+
| libpurple                | ≥2.10                    | Required for the [Azoth  |
|                          |                          | VelvetBird](/plugins-azo |
|                          |                          | th-velvetbird)           |
|                          |                          | plugin.                  |
+--------------------------+--------------------------+--------------------------+
| gstreamer                | ≥1.0                     | Required for the LMP     |
|                          |                          | plugin.                  |
+--------------------------+--------------------------+--------------------------+
| Taglib                   | ≥1.11.0                  | Required for the LMP     |
|                          |                          | plugin.                  |
+--------------------------+--------------------------+--------------------------+
| libguess                 | ≥1.0                     | Recommended for the LMP  |
|                          |                          | plugin.                  |
+--------------------------+--------------------------+--------------------------+
| liblastfm                | ≥1.0.9                   | Required for the         |
|                          |                          | LastFMScrobble plugin.   |
+--------------------------+--------------------------+--------------------------+
| ffmpeg                   | ≥4.0.0                   | Used by the MusicZombie  |
|                          |                          | plugin (libav would not  |
|                          |                          | work thanks to           |
|                          |                          | differences in           |
|                          |                          | resampling code).        |
+--------------------------+--------------------------+--------------------------+
| chromaprint              | ≥1.4.0                   | Used by the MusicZombie  |
|                          |                          | plugin.                  |
+--------------------------+--------------------------+--------------------------+
| poppler                  | ≥0.82.0                  | Required for the Monocle |
|                          |                          | PDF plugin.              |
+--------------------------+--------------------------+--------------------------+
| ghostscript              | ≥9.0                     | Required for the Monocle |
|                          |                          | PostRus plugin.          |
+--------------------------+--------------------------+--------------------------+
| djvu                     | ≥3.5.24                  | Required for the Monocle |
|                          |                          | Seen plugin.             |
+--------------------------+--------------------------+--------------------------+
| Qwt                      | ≥6.1                     | Required for the Lemon,  |
|                          |                          | Liznoo, Poleemery        |
|                          |                          | plugins and Core if      |
|                          |                          | graphs are enabled.      |
|                          |                          | Optional for LMP FrAdj.  |
+--------------------------+--------------------------+--------------------------+
| libsensors               | ≥3.3.0                   | Required for the         |
|                          |                          | HotSensors plugin.       |
+--------------------------+--------------------------+--------------------------+
| udev                     | ≥180                     | Required for the DevMon  |
|                          |                          | plugin (\*NIX-only).     |
+--------------------------+--------------------------+--------------------------+
| X11                      | \*                       | Required for KBSwitch,   |
|                          |                          | Krigstask, Mellonetray,  |
|                          |                          | SB2 and utility library  |
|                          |                          | (\*NIX-only).            |
+--------------------------+--------------------------+--------------------------+
| kqoauth                  | ≥0.98                    | Required for the Azoth   |
|                          |                          | WoodPecker and Blasq     |
|                          |                          | Spegnersi plugin.        |
+--------------------------+--------------------------+--------------------------+
| Qross                    | ≥0.2.0                   | Required for the Qrosp   |
|                          |                          | plugin.                  |
+--------------------------+--------------------------+--------------------------+
| QScintilla2              | ≥2.6                     | Required for the Popishu |
|                          |                          | plugin.                  |
+--------------------------+--------------------------+--------------------------+
| CMake                    | ≥3.1                     |                          |
+--------------------------+--------------------------+--------------------------+

A pretty decent compiler is required for LeechCraft from master. gcc 9.2
and clang 9 will surely work.

***Note***: this guide assumes a \*NIX-like OS like Linux or FreeBSD.
Building with Windows is possible but is full of patching and heavy
work, and it hasn't been properly documented yet.

### Platform-specific prerequisites

#### X11

  Dependency      *Version*   Notes
  --------------- ----------- ---------------------------------------------------------------------------------------------
  libX11                      Required for Krigstask, Mellonetray, KBSwitch and Core (if X11 support library is enabled).
  libXdamage                  Required for Mellonetray.
  libXcomposite               Required for Krigstask.
  libxkbcommon                Required for KBSwitch.
  libxkbfile                  Required for KBSwitch.

Getting prerequesites
---------------------

Some distros allow easy installation of all the required prerequesites,
and the process is documented here.

### Debian, Ubuntu

It's as simple as running the following from root:

``` {type="bash"}
sudo add-apt-repository ppa:tehnick/leechcraft-unstable
sudo apt-get update
sudo apt-get build-dep leechcraft-unstable
```

### openSUSE

Execute the following replacing *openSUSE\_Tumbleweed* with your distro
version:

``` {type="bash"}
sudo zypper ar http://download.opensuse.org/repositories/home:Reki:leechcraft:masterbranch/openSUSE_Tumbleweed/home:Reki:leechcraft:masterbranch.repo
sudo zypper ref
sudo zypper si -d leechcraft
```

Getting sources
---------------

You can either download (an extremely outdated) source package from
https://sourceforge.net/projects/leechcraft/files/ or check out the
files from git (you will need `git`{type="bash"} for this). The later is
strongly advised.\
\
To check out the sources from git, `cd`{type="bash"} into a directory
where you want `leechcraft`{type="bash"} subdirectory to be placed. In
this guide we assume it's `~/Programming`{type="bash"}. Issue the
following from that directory:

``` {type="bash"}
git clone git://github.com/0xd34df00d/leechcraft.git
```

This would create `~/Programming/leechcraft`{type="bash"} and put the
project's sources and commit history there. To later update the
repository, just issue:

``` {type="bash"}
cd ~/Programming/leechcraft
git pull
```

Building and installing
-----------------------

We use so-called out-of-source builds. They support having different
builds with different configurations simultaneously as well as easily
remove the build directory if something goes wrong. So, create a
directory in `~/Programming/leechcraft`{type="bash"}, say,
`build`{type="bash"}, and `cd`{type="bash"} into it. Type

``` {type="bash"}
cmake -DCMAKE_BUILD_TYPE=BuildType ../src 
```

Here *BuildType* specifies what type of the build you want:

<dl>
<dt>
    Release

</dt>
<dd>
Release version with no debugging information and optimizations enabled.

</dd>
<dt>
    Debug

</dt>
<dd>
Debug version with debugging information and no optimizations at all.

</dd>
<dt>
    RelWithDebInfo

</dt>
<dd>
A version with both debugging information and optimizations enabled
(recommended).

</dd>
<dt>
    MinSizeRel

</dt>
<dd>
Release version with optimizations for producing executables of minimal
size.

</dd>
</dl>

Then, after `cmake`{type="bash"} successfully prepares the build system,
type `ccmake`{type="bash"} and check the list of plugins to be built.
You can enable or disable them there nicely. Alternatively, you can
manually edit the `CMakeCache.txt`{type="bash"} file in the build
directory, modifying values of variables starting with *ENABLE\_*.\

After you've selected what you want to build, run `make`{type="bash"}
and have a cup of coffee while LeechCraft compiles. To compile things
faster, append the *-jN* option, where *N* is number of cores you have.
For a decent Core i7 system that would be `make -j8`{type="bash"}, for
example. If it fails, join the Jabber conference
[leechcraft@conference.jabber.ru.](xmpp:leechcraft@conference.jabber.ru) and feel free to ask.

Become root and issue `make install`{type="bash"} to install LeechCraft
into `/usr/local`{type="bash"}. That's it!\

Please note that **LeechCraft won't work without
installing**

Uninstalling
------------

``` {type="bash"}
cd ~/Programming/leechcraft/build
sudo cmake -P cmake_uninstall.cmake
```

Microsoft Windows
-----------------

Hehe. It's tricky. Don't try.

More seriously, building on Win32 requires a good knowledge of the build
process, Qt and Boost pecularities and various typical but subtle
errors.

Nevertheless, if you are brave enough, you could follow the [Win32
building guide](/development-building-from-source-win32).

Troubleshooting
---------------

### LeechCraft segfaults on startup

`make install`{.bash} is required, really.

LeechCraft doesn't start, outputting into console complaints about liblcutil.so.0.5.0

If you get something like

```
leechcraft: error while loading shared libraries: liblcutil.so.0.5.0: cannot open shared object file: No such file or directory
```

then just run `ldconfig` as root.

If you still can't run LeechCraft with the same error, check that

``` {type="bash"}
/usr/local/lib64
/usr/local/lib
```

are present in your `/etc/ld.so.conf`{type="bash"}. For example, default
Mandriva setups are known to miss these lines.

### Linking/startup problems on FreeBSD/Mac OS X in BitTorrent plugin

If you get linking errors in `libleechcraft_bittorrent.so`{type="bash"}
(or `libleechcraft_bittorrent.dylib`{type="bash"} on Mac OS X),
particularly, something like:

    Undefined symbols:
      "boost::filesystem2::no_check(std::basic_string, std::allocator > const&)", referenced from:
          LeechCraft::Plugins::BitTorrent::TorrentMaker::Start(LeechCraft::Plugins::BitTorrent::NewTorrentParams)in torrentmaker.cpp.o
    ld: symbol(s) not found

make sure you are building with optimizations *enabled* (setting
`CMAKE_BUILD_TYPE` to *Release* will do). Make sure there is only one
Boost installation on your system or, at least, that the plugin (and
libtorrent) is being linked to the same version of the Boost libraries
that it's compiled with.

### LeechCraft fails to build with your\_compiler\_name

Please see prerequesites.

### CMake outputs \`Package libtorrent-rasterbar was not found in the pkg-config search path\` and fails with an error

The full error message is:

``` {type="bash"}
Package libtorrent-rasterbar was not found in the pkg-config search path.
Perhaps you should add the directory containing `libtorrent-rasterbar.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libtorrent-rasterbar' found
```

If you get that, you should find where your
`libtorrent-rasterbar.pc`{type="bash"} (typically the
`locate libtorrent-rasterbar.pc`{type="bash"} command will do, though
you would probably need to update its search base) is and issue the
following command:

``` {type="bash"}
export PKG_CONFIG_PATH="/path/to/your/libtorrent-rasterbar.pc"
```

and then re-run CMake in the same shell with the same command line.\

If you re-configure LeechCraft often, you'd probably want to add this
export declaration to your `~/.bashrc`{type="bash"}.
