---
title: Azoth
tags: plugins, azoth
shortdescr: modular IM client
keyplugin: 1
---

`{ "name": "azoth_muc_120916.png", "align": "right", "title": "MUC" , "thumb" : "small" }`{.img}
`{ "name": "azoth_muc_as0_120916.png", "align": "right", "title": "MUC with Adium style" , "thumb" : "small" }`{.img}
`{ "name": "azoth_sd_120916.png", "align": "right", "title": "Service Discovery" , "thumb" : "small" }`{.img}
`{ "name": "azoth_psto_120916.png", "align": "right", "title": "Psto in Azoth" , "thumb" : "small" }`{.img}

Azoth is the modular IM client for LeechCraft.

Fully conforming to the LeechCraft-way, Azoth is modular itself. For
example, protocols are provided by corresponding plugins, so Azoth is a
multiprotocol client as well. Modularity also allows Azoth to be
flexible, extensible and enables the modules to use each other and avoid
code and functionality duplication.

Unlike other multiprotocol clients which tend to implement only those
features that are present in all the protocols, Azoth is modelled after
the XMPP protocol, aiming to provide extensive and full support for XMPP
while remaining usable for other protocols.

Protocols
---------

Azoth supports the following protocols:

- [IRC](/plugins-azoth-acetamide).
- [Mail.Ru Agent](/plugins-azoth-vader).
- [Windows Live Messenger](/plugins-azoth-zheet) (former MSN).
- [XMPP](/plugins-azoth-xoox).
- [VKontakte](/plugins-azoth-murm).
- [Eveyrthing from libpurple](/plugins-azoth-velvetbird).
- [Everything from Telepathy](/plugins-azoth-astrality).

Key features
------------

- Multiple accounts.
- Metacontacts.
- Server history.
- Nested groups that are handled as tags for contacts.
- File transfers.
- Audio calls.
- Rich text messages.
- Extended statuses: current mood, tune, activity.
- Full support for multiuser chatrooms.
- Bookmarks and history of visited conferences.
- Invites to conferences.
- Handling URIs for joining multiuser chatrooms, adding items to
  contact list and such.
- Different emoticons packs and animated smiles.
- Notifications about chat state participation.
- Group message delivery.
- In-band registration.
- Delivery notifications.
- Attention requests.
- Service discovery.
- PGP-encrypted messaging.
- [OTR](http://www.cypherpunks.ca/otr/).
- Support for exchanging contacts.
- Support for search.
- Optional groupless contact list mode.
- Image sending via [data filter](/concepts-data-filters) plugins.

Please note that some of these features depend on the underlying
protocol implementation.

Other plugins
-------------

- [AdiumStyles](/plugins-azoth-adiumstyles) for supporting
  Adium styles.
- Autoidle for autochanging status due to inactivity timeout.
- Autopaste for automatic pasting of long texts to pastebins instead
  of chat sessions.
- [ChatHistory](/plugins-azoth-chathistory) for, well, storing logs
  of chats.
- Depester for ignoring specific multiuser chatrooms participants.
- EmbedMedia for showing media objects like flash videos or images
  directly in the chat window.
- Herbicide, a basic antispam plugin.
- HiLi for customizing highlight settings in conferences.
- Juick for enhanced experience with the [juick.com](http://juick.com)
  microblogging service.
- LastSeen for recording contacts' last online and availability time
  on client side.
- [Metacontacts](/plugins-azoth-metacontacts) for
  supporting metacontacts.
- [Modnok](/plugins-azoth-modnok) for inline displaying
  LaTeX formulae.
- [MuCommands](/plugins-azoth-mucommands) for IRC-style commands.
- NativeEmoticons for supporting emoticons packs in Psi+, Kopete and
  own format.
- [OTRoid](/plugins-azoth-otroid) for supporting [Off-the-Record
  messaging](http://www.cypherpunks.ca/otr/).
- Rosenthal for spellchecking based on plugins like root-level
  [Rosenthal](/plugins-rosenthal).
- StandardStyles for basic styling support.
- Xtazy for publishing currently playing tune.
