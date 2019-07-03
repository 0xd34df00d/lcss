---
title: Development digest &num;3
tags: digest
published: 2011-06-02T08:07:39

---

Last week or so something great has happened: EiskaltDC++ is now working
again in LeechCraft, thanks Negativ, the author and main developer of
EiskaltDC++, for porting it to the new LeechCraft's tabs system. And, of
course, despite finals, there are some other changes. So, a bit more
detailed list follows:

- EiskaltDC++ was synced with upstream (new features and bugfixes!)
  and adapted to the new LeechCraft tabs system introduced a month ago
  or so *(thanks Negativ)*.
- Support for recursive Service Discovery in Azoth Xoox.
- Azoth Xoox now supports registering on gateways to other protocols,
  and, of course, working with the gateways.
- Kinotify plugin supports links in notifications and opens them as
  it should.
- Aggregator finally saves columns width *(thanks Akon32)*.
- And, once again, one more user-invisible change. Core changed a bit
  semantics of notifications handling. Now notifications are
  really broadcast. This enables us to implement things like audio
  notifications for different events in addition to already present
  visual ones, and such.

And, maybe the last change, the broadcast notifications, should be
better explained.

Previously, all entities in inter-modular LeechCraft bus were not
broadcast, and the first plugin that accepted an entity was fed with
that entity, and the processing stopped after that. Now, if the entity
is not a delegation request and there are no downloaders that are ready
to accept that entity, the entity is fed to all the plugins that
accepted it, not the first one.

Taking the user notifications example, previously, only visual
notifications plugin or audio notifications plugin (assuming the latter
is present) could handle the entity, but not both. You would either get
sound or get a nice popup, but you could never get them at once. Now,
the corresponding entity is fed to both of these plugins, so it is
possible to have to a visual notification and hear a sound
simultaneously from the same event.

There is also a small downside of this change. Previously, if two
different visual notifications plugins were used, like, libnotify one
and Kinotify, only the first one was used. Now, you would get
notifications through both libnotify and Kinotify, unless you explicitly
disable one of them (or unless your system doesn't support libnotify).
