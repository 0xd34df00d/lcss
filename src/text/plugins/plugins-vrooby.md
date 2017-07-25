---
title: Vrooby
tags: vrooby, plugins
published: 2013-09-11T12:02:50
shortdescr: removable storage devices manager
---

Vrooby is removable storage device manager for LeechCraft.\
\
Except allowing the user to mount and umount removable devices, it also
provides other plugins with information about what devices are mounted
and at which mount points. [LMP](/plugins-lmp) for example uses this to
enable collection synchronization.\
\
\[img\_assist|url=images/vrooby01\_th.png|title=Devices
popup|align=inline|link=1|width=440\]

Features
--------

\
\

-   Userspace mounting/unmounting of removable devices.
-   Display of information about mounted devices, like mount paths or
    available and total size.
-   Ignoring devices by UUID.
-   Integration with other plugins like [LMP](/plugins-lmp).

Backends
--------

\
\

-   UDisks
-   UDisks2