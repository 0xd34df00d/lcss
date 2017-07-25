---
title: XProxy
tags: xproxy, plugins
published: 2012-04-17T09:56:16
shortdescr: allows configuring proxy servers on a per-host basis
---

XProxy allows configuring proxy servers on a per-host basis.

\[img\_assist|url=images/xproxy-1.png|title=XProxy settings|align=inline|link=1|width=440\]

Features
--------

- Support for defining the list of hosts via a Python or JS script
  (useful to fetch a fresh list of RosKomNadzor blocked entities on a live basis, for instance).
- Support for SOCKS5, HTTP and FTP proxies.
- Matching hosts via regexps.
- Different proxies for different ports/protocols.
