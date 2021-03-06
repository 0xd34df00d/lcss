---
title: Download
toc: true
---

<style>
.invisible-header { visibility: hidden; height: 0px; margin-top: 2em; }
.invisible-header:first-of-type { display: none; }
</style>

Linux {#linux class="invisible-header"}
-----

### Arch {#arch class="invisible-header"}

![](//files.leechcraft.org/imgs/distro_logos/arch.png)

LeechCraft has PKGBUILDs in AUR, so to install it, you first need
yaourt:
```bash
pacman -Sy yaourt
```
Then, just issue
```bash
yaourt -S leechcraft-git
```

### Debian {#debian class="invisible-header"}

![](//files.leechcraft.org/imgs/distro_logos/debian.png)

Packages for Debian Wheezy/Sid are available in [this unofficial
repo](http://notesalexp.org/). Instructions for enabling that repository
could be found on the linked page.

Each LeechCraft plugin is packaged in a separate package. To install all
LeechCraft plugins, just select *leechcraft*, the rest will be pulled
automatically.

### Fedora {#fedora class="invisible-header"}

![](//files.leechcraft.org/imgs/distro_logos/fedora.png)

LeechCraft is currently available in [an OBS
repo](http://software.opensuse.org/download.html?project=home:DarkSS:fedora&package=leechcraft)
for latest Fedora releases.

After adding the repo, issue the following command to install all
LeechCraft modules (which is recommended):
```bash
sudo dnf install "leechcraft*"
```
You may also want to install only a part of the modules. In this case
issue the following to find all available packages with LeechCraft
modules:
```bash
dnf search leechcraft
```
Popular RPM Sphere repo can be used to get LeechCraft packages too.

If you feel like the packages and/or releases are too old, don't hesitate [filling an
issue](https://dev.leechcraft.org/projects/leechcraft/issues/new) against
DA for a version bump.

### Gentoo {#gentoo class="invisible-header"}

![](//files.leechcraft.org/imgs/distro_logos/gentoo.png)

LeechCraft is available in the official Gentoo Portage tree. The most
recent version is currently in *\~arch*, and live ebuilds for the master
branch are masked.

To install the metapackage which would pull all the plugins available,
issue:
```bash
emerge -av leechcraft-meta
```
All LeechCraft packages reside in a single category *app-leechcraft/*.
To see the list of available ebuilds, issue the following (assuming you
have *eix* installed):
```bash
eix -c app-leechcraft/
```
If you prefer sets (starting with Portage 2.2), you can select any of
the following loosely categorized ones:

- `leechcraft-clients-live` for clients for various services like
  [SeekThru](/plugins-seekthru) or [vGrabber](/plugins-vgrabber);
- `leechcraft-net-live` for networking utilities and modules like
  [Aggregator](/plugins-aggregator) or [Poshuku](/plugins-poshuku);
- `leechcraft-tools-live` for various helper utilities like
  [Summary](/plugins-summary) or
  [HistoryHolder](/plugins-historyholder).
- `leechcraft-live` for all of them.

Alternatively, you could manually install every plugin.

Please note that subplugins are toggled via USE flags of the corresponding
first-level plugins.

### openSUSE {#opensuse class="invisible-header"}

![](//files.leechcraft.org/imgs/distro_logos/suse.png)

LeechCraft is available in default OSS repositories.
To install it, just issue the following:
```bash
zypper in leechcraft*
```
For the latest milestone of LeechCraft the [network](https://software.opensuse.org/download.html?project=network&package=leechcraft) repository needs to
be added, so issue
```bash
zypper ar -f -r http://download.opensuse.org/repositories/network/openSUSE_Tumbleweed/network.repo
zypper in leechcraft*
```
replacing *Tumbleweed* in the first command with your current distro version.

To be on the bleeding edge and get most recent snapshots of the master
development branch, add the [corresponding repo](https://software.opensuse.org/download.html?project=home:DarkSS:Qt5&package=leechcraft) by issuing

```bash
zypper ar -f -r http://download.opensuse.org/repositories/home:DarkSS:Qt5/openSUSE_Leap_42.3/home:DarkSS:Qt5.repo
```

If you feel like the packages and/or releases are too old, don't hesitate [filling an
issue](https://dev.leechcraft.org/projects/leechcraft/issues/new) and assigning it to
DA for a version bump.

Alternatively, you can use official openSUSE [packages search](http://software.opensuse.org/).

### Slackware {#slackware class="invisible-header"}

![](//files.leechcraft.org/imgs/distro_logos/slackware.png)

Installation for Slackware is pretty simple: just download packages for
your architecture (pkg for x86, pkg64 for x86\_64) from our
[repo](/repos/slackware/repo/) and install them with:
```bash
updatepkg --install-new packagename
```
For running LeechCraft, you would also need qjson, which could be
obtained from here: http://www.slackers.it/repository/qjson/ or be
installed using `slapt-get`{type="bash"} from slackers.it repository.

The `source`{type="bash"} directory contains scripts for building the
packages and all the required information. Documentation regarding using
and modifying slackbuilds could be obtained at http://slackbuilds.org

Have fun!

### Ubuntu {#ubuntu class="invisible-header"}

![](//files.leechcraft.org/imgs/distro_logos/ubuntu.png)

LeechCraft 0.5.60 and later is available for Ubuntu Oneiric and Precise.
Version 0.5.0 is also available for Maverick and Natty.

Add PPA with Weekly Builds (recommended):

```bash
sudo add-apt-repository ppa:tehnick/leechcraft-unstable
```

Alternatively, you can use PPA with stable releases:

```bash
sudo add-apt-repository ppa:tehnick/leechcraft-stable
```

Update (like `aptitude update`{type="bash"}) and install *leechcraft*
via `aptitude`{type="bash"}, Ubuntu Software Center, Synaptic, Muon or
whatever package manager you like.

The *leechcraft* package pulls the full LeechCraft set. To install only
parts of it, you can just select relevant plugins (they all begin with
*leechcraft-*). If you want to help us with debugging LeechCraft,
install *leechcraft-dbg* package.

FreeBSD {#freebsd class="invisible-header"}
-------

![](//files.leechcraft.org/imgs/distro_logos/freebsd.png)

LeechCraft is available for FreeBSD-current. To install, issue

```bash
portmaster x11/leechcraft
```

or
```bash
make -C x11/leechcraft install clean
```

Currently LeechCraft is represented by a single port file for all
plugins.

Mac OS X {#mac-os-x class="invisible-header"}
--------

![](//files.leechcraft.org/imgs/distro_logos/mac_osx.png)

LeechCraft supports Mac OS X 10.9 and more recent versions.

The latest installer is for the 0.6.70 version, dated July 28, 2014. You
can get it
[here](https://dist.leechcraft.org/LeechCraft/0.6.70/LeechCraft-0.6.70.dmg).

Previous LeechCraft build supporting previous Mac OS versions (10.7 and
10.8) is for the 0.6.0 version, dated September 12, 2013. It is
available
[here](https://dist.leechcraft.org/LeechCraft/0.6.0/leechcraft-0.6.0.dmg).

Microsoft Windows {#microsoft-windows class="invisible-header"}
-----------------

![](//files.leechcraft.org/imgs/distro_logos/Windows.png)

There are two installers, for
[x86\_64](https://dist.leechcraft.org/LeechCraft/0.6.70/leechcraft-installer-0.6.70-0_x86_64.exe)
and
[i686](https://dist.leechcraft.org/LeechCraft/0.6.70/leechcraft-installer-0.6.70-0_i686.exe)
architectures. Both are for LeechCraft 0.6.70, dated August 04, 2014.

Please note that Windows is not as supported as other OSes, so crashes
and bugs that can't be reproduced on Linux won't be considered.

Source
------

The sources for the git HEAD could be downloaded from
[Github](https://github.com/0xd34df00d/leechcraft/archive/master.zip).
There are also tar.xz archives with weekly snapshots at [our
server](https://dist.leechcraft.org/LeechCraft/).

If you want the last bleeding-edge LeechCraft, you could always [build
from source](development-building-from-source).
