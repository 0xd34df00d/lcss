---
title: Autobuilds service
tags: general
published: 2013-10-26T23:30:42

---

We've finally managed to set up a continious integration server: meet
our [Jenkins instance](http://leechcraft.org:8080)!

For now it only uses a Debian Unstable build node to test as full
plugins set as the distro supports, but we think of adding a couple of
other build nodes to test builds on common distros like recent openSUSE
and Ubuntu versions. Seems like we can also perform test builds of
GitHub pull requests automatically as well, but that requires some more
elaboration.

A CI server also allowed me to migrate to clang as a primary compiler
instead of gcc, leading to faster compile times, better error messages
and more issues caught in the code thanks to the warnings. If I'd
migrate to clang without anything like a CI system I'd have to manually
run gcc over the code quite often since gcc has its own quirks. Or
maintainers would have quite a lot of build failures.

Less pain for the maintainers, more fun!
