---
title: XProxy
tags: xproxy, plugins
shortdescr: allows configuring proxy servers on a per-host basis
---

XProxy allows configuring proxy servers on a per-host basis.

`{ "name": "xproxy-1.png", "align": "inline", "title": "XProxy settings" , "thumb" : "medium" }`{.img}

Features
--------

- Support for defining the list of hosts via a Python or JS script
  (useful to fetch a fresh list of RosKomNadzor blocked entities on a live basis, for instance).
- Support for SOCKS5, HTTP and FTP proxies.
- Matching hosts via regexps.
- Different proxies for different ports/protocols.
