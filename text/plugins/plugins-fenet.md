---
title: Fenet
tags: plugins, fenet
published: 2013-09-11T12:40:15
shortdescr: is WM and compositor manager

---

Fenet is WM and compositor manager. It allows one to choose a WM to
start upon LeechCraft startup from a list of supported ones, as well as
control and configure a compositing manager, if desired.

Fenet also installs a .desktop file for login managers to know about
LeechCraft as a desktop environment.

Fenet is active only in desktop mode, thus there is no need to disable
it if running LeechCraft as a DE isn't planned.

\[img\_assist|url=images/fenet01.png|title=|align=inline|link=1|width=440\]

### Supported WMs

- Awesome
- KWin
- Openbox

### Supported compositors

- compton

For other compositors a file like
[this](https://github.com/0xd34df00d/leechcraft/blob/master/src/plugins/fenet/share/fenet/compositing/compton.json)
should be written.

### Adding new WMs

Adding another window manager is a matter of writing a description file
in JSON and a shell script to start the WM.

Here are examples for openbox:
[description](https://github.com/0xd34df00d/leechcraft/blob/master/src/plugins/fenet/share/fenet/wms/openbox.json)
and
[script](https://github.com/0xd34df00d/leechcraft/blob/master/src/plugins/fenet/share/fenet/wms/openbox.sh)
and for Awesome:
[description](https://github.com/0xd34df00d/leechcraft/blob/master/src/plugins/fenet/share/fenet/wms/awesome.json)
and
[script](https://github.com/0xd34df00d/leechcraft/blob/master/src/plugins/fenet/share/fenet/wms/awesome.sh).\

The script and the JSON description file should have the same base name
and `sh` and `json` extensions respectively.
