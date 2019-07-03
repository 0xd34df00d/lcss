---
title: Azoth MuCommands
tags: mucommands, azoth
shortdescr: provides some IRC-like commands for other protocols
parentPage: plugins-azoth
---

Azoth MuCommands provides some IRC-like commands for other protocols in Azoth.

Type `/help` to get the list of available commands in the given chat
session, and type `/help` *command* to get help on a particular
*command*.

Available commands
------------------

- `/names` — Shows the nick names of multiuser chat room participants.
- `/urls` — Lists the URLs appeared in the current chat session.
- `/openurl` — Opens an URL from the current chat session by
  its index.
- `/fetchurl` — Downloads an URL from the current chat session by
  its index.
- `/vcard` — Shows VCards for the given participants, or a roster
  entry, or any protocol user identified by their ID.
- `/version` — Shows the information about a participant or
  contact's software.
- `/time` — Shows the current time of a participant or a contact or a
  remote ID.
- `/disco` — Opens the service discovery tab for the given participant
  or ID.
- `/invite` — Invites a roster entry into a multiuser chat room.
- `/nick` — Changes the nickname used in the current multiuser
  chat room.
- `/subject; /topic` — Changes the subject in the current multiuser
  chat room.
- `/leave; /part` — Leaves the current multiuser chat room.
- `/rejoin` — Leaves the current multiuser chat room and then joins
  it again.
- `/ping` — Pings the given contact and shows the round trip time of
  the ping request.
- `/last` — Shows the time of last activity, or connection, or uptime.
- `/listperms` — Lists the available permission classes and roles for
  the current multiuser chat room.
- `/setperm` — Sets the permissions (like affiliation or role in case
  of XMPP) of a given participant in a multiuser chat room.
- `/kick` — Kicks the given participant from the current multiuser
  chat room.
- `/ban` — Bans the given participant from the current multiuser
  chat room.
- `/pm` — Sends a private message to a participant of the current
  multiuser chat room.
- `/whois` — Shows the real ID of a multiuser chat participant,
  if available.
